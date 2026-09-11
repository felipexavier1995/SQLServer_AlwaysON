--- query para listar logins e suas roles de servidor.

SELECT
    sp.name AS [Login],
    sp.type_desc AS [Tipo],
    sp.is_disabled AS [Desabilitado],
    sp.create_date AS [Data Criação],
    sp.modify_date AS [Última Modificação],
    STUFF((
        SELECT ', ' + r.name
        FROM sys.server_role_members rm
        JOIN sys.server_principals r ON rm.role_principal_id = r.principal_id
        WHERE rm.member_principal_id = sp.principal_id
        FOR XML PATH('')
    ), 1, 2, '') AS [Roles de Servidor]
FROM sys.server_principals sp
WHERE sp.type IN ('S', 'U', 'G')  -- S = SQL Login, U = Windows Login, G = Windows Group
  AND sp.name NOT LIKE '##%'      -- exclui logins internos do sistema
ORDER BY sp.name;
GO
