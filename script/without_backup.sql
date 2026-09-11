--- query para verificar bancos sem backup recente (alerta).

DECLARE @LimiteFull   INT = 24;   -- horas - limite aceitável desde o último FULL
DECLARE @LimiteLog    INT = 2;    -- horas - limite aceitável desde o último LOG (se FULL recovery)

SELECT
    db.name AS [Banco de Dados],
    db.recovery_model_desc AS [Modelo de Recuperação],
    MAX(CASE WHEN bs.type = 'D' THEN bs.backup_finish_date END) AS [Ultimo Full],
    MAX(CASE WHEN bs.type = 'I' THEN bs.backup_finish_date END) AS [Ultimo Diferencial],
    MAX(CASE WHEN bs.type = 'L' THEN bs.backup_finish_date END) AS [Ultimo Log],
    DATEDIFF(HOUR, MAX(CASE WHEN bs.type = 'D' THEN bs.backup_finish_date END), GETDATE()) AS [Horas desde Full],
    DATEDIFF(HOUR, MAX(CASE WHEN bs.type = 'L' THEN bs.backup_finish_date END), GETDATE()) AS [Horas desde Log],
    CASE
        WHEN MAX(CASE WHEN bs.type = 'D' THEN bs.backup_finish_date END) IS NULL THEN 'NUNCA FEZ FULL - CRÍTICO'
        WHEN DATEDIFF(HOUR, MAX(CASE WHEN bs.type = 'D' THEN bs.backup_finish_date END), GETDATE()) > @LimiteFull THEN 'FULL ATRASADO'
        WHEN db.recovery_model_desc = 'FULL'
             AND DATEDIFF(HOUR, MAX(CASE WHEN bs.type = 'L' THEN bs.backup_finish_date END), GETDATE()) > @LimiteLog THEN 'LOG ATRASADO'
        ELSE 'OK'
    END AS [Status]
FROM sys.databases db
LEFT JOIN msdb.dbo.backupset bs
    ON db.name = bs.database_name
WHERE db.name NOT IN ('tempdb')  -- tempdb não precisa de backup
  AND db.state_desc = 'ONLINE'
GROUP BY db.name, db.recovery_model_desc
ORDER BY [Status] DESC, db.name;
GO
