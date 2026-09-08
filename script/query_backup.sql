--- query para backup full.
use [nome do banco de dados];
go


--- query para backup log.
use [nome do banco de dados];
go
  
BACKUP LOG FinanceiroDB TO DISK = N'[nome do banco de dados].trn' 
  WITH INIT, COMPRESSION;
