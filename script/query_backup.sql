--- query para backup full.
use [nome do banco de dados];
go



--- query para backup log.
use [nome do banco de dados];
go
  
BACKUP LOG [nome do banco de dados] 
  TO DISK = N'[caminho do backup ].trn' 
  WITH INIT, COMPRESSION, STATS = 15;
  GO
