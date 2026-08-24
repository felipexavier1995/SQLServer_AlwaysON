<h1> ✅ Habilitando Always On. </h1>


Acessar ao servidor SQL01 e SQL02 basta ir no Sql server manager \
E clicar com o botão direito em SQL Server (MSSQLSERVER)
<img width="901" height="498" alt="image" src="https://github.com/user-attachments/assets/4e88feae-5936-4397-87f4-374e539a5d5f" />


Ir em Properties \
<img width="901" height="498" alt="image" src="https://github.com/user-attachments/assets/311a05f6-f3e1-43cc-bd09-2faef88cd7b2" />

Ir em AlwaysOn High Availability e habilitar AG e depois aplicar. \
<img width="418" height="501" alt="image" src="https://github.com/user-attachments/assets/06e8b968-2d87-41ae-8cb4-1f0e5180b7af" />

Fez isso também no servidor SQL02.


<h3> ✅ 	Criar o Availability Group + Listener. </h3>

Antes de fazer/habilitar o AlwaysON, vamos criar um banco de dados de teste para se colocado como alta disponibilidade esse banco de dados que foi criado. \
<img width="345" height="323" alt="image" src="https://github.com/user-attachments/assets/131056b1-df7f-43fe-b11a-8b9bb8629e48" />



Agora vamos precisamos entrar o MSSQL Server (SQL Server Management Studio) e ir AlwaysOn High Availability com o botão direito e habilitar o serviço \
<img width="473" height="339" alt="image" src="https://github.com/user-attachments/assets/4e3422c9-e390-46ee-95ca-9618e1280a8b" />

Ao clicar, vai aparecer a seguinte tela e basta seguir em frente.
<img width="831" height="766" alt="image" src="https://github.com/user-attachments/assets/2d4dcba7-e36b-4c26-ada3-53394c452a17" />

A seguir vai conter a tela de configuração do AG e Cluster \
O nome do nosso AG vai ser Ag-LAB
<img width="824" height="751" alt="image" src="https://github.com/user-attachments/assets/21b43132-a2d1-433a-b867-71c43c7c9c5b" />

Ao seguir a tela, vai conter o nosso banco de dados e o seguinte status de 'Meets prerequisites'
Isso quer dizer que antes de dar andamento vai precisar fazer um backup full

BACKUP DATABASE database_test \
TO DISK = 'D:\MSSQL\Backup\database_test.bak' \
WITH INIT; \

<img width="827" height="752" alt="image" src="https://github.com/user-attachments/assets/2902300b-32d7-47c1-bec4-b5399a07b0ef" />

Ai clicar em next, vai pedir para adicionar o outro servidor (SQL02) que vai ser a replicação.
<img width="961" height="741" alt="image" src="https://github.com/user-attachments/assets/dbf858e9-c103-48e8-b6bd-ca897507aa29" />
<img width="959" height="720" alt="image" src="https://github.com/user-attachments/assets/bbafd7b8-a16a-4052-82c1-887ee536300f" />

Ao adicionar o SQL02, vamos precisar alterar alguns pontos com esses parâmetros 
<img width="955" height="573" alt="image" src="https://github.com/user-attachments/assets/6cf0ce20-4ae8-4482-bffe-add257879efb" />

Próximo passo — Configurar o Listener, na aba Listener \
Ao clicar em add, vai abrir uma janela para adicionar o IP Fixo, no nosso caso o Ip é 192.168.10.50 \
<img width="956" height="924" alt="image" src="https://github.com/user-attachments/assets/b61b6654-a378-47b6-8240-6d1fdafc1fec" />
