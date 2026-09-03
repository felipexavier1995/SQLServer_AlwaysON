---query para verificar o andamento do backup do momento ---

SELECT session_id as SPID, 
command, a.text AS Query, start_time, percent_complete, 
dateadd(second,estimated_completion_time/1000, 
getdate()) as estimated_completion_time
FROM sys.dm_exec_requests r 
CROSS APPLY sys.dm_exec_sql_text(r.sql_handle) a
WHERE r.command in ('BACKUP DATABASE','RESTORE DATABASE')



-- Depois de aplicar tunning da query

SELECT 
    r.session_id AS SPID,
    r.command,
    t.text AS Query,
    r.start_time,
    r.percent_complete,
    DATEADD(SECOND, r.estimated_completion_time / 1000, GETDATE()) AS estimated_completion_time
FROM (
    SELECT * 
    FROM sys.dm_exec_requests
    WHERE command IN ('BACKUP DATABASE', 'RESTORE DATABASE')
) r
CROSS APPLY sys.dm_exec_sql_text(r.sql_handle) t;
