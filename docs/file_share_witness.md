<h1>✅ Configurar o File Share Witness.</h1>

Vamos precisar entrar no servidor DC01 e criar um diretorio que vamos compartilhar esse diretorio para os restantes dos servidores. 

Vai abrir o file explorer e criar o diretorio com o nome de FSW_SQLCLUSTER

Que vai ficar no seguinte caminho C:\FSW_SQLCLUSTER

Já no diretorio, clique com botão direito na pasta → Properties → Sharing → Advanced Sharing

Marque "Share this folder" \
Clique em Permissions

Adicione o objeto de computador do cluster com permissão de leitura/escrita: \
Clique Add \ 
No campo, digite: SQLCLUSTER$ (o $ no final é importante — é o nome do objeto de computador do cluster no AD) \
Clique Check Names para validar (deve resolver certinho) \
Clique OK

<img width="746" height="730" alt="image" src="https://github.com/user-attachments/assets/6fef7f25-923c-4ae5-956c-90ba06580956" />

Agora, vamos entrar em qualquer outro servidor, como por exemplo o SQL01
<img width="584" height="546" alt="image" src="https://github.com/user-attachments/assets/60ac517c-63f6-497e-885a-f1880c38a4c6" />

Ao clicar em Configure Cluster Quorum Wizard

Na tela de boas-vindas, clique Next  
Select Quorum Configuration Option: selecione "Select the quorum witness" → Next \
Select Quorum Witness: selecione "Configure a file share witness" → Next \
Configure File Share Witness: digite o caminho UNC da pasta compartilhada:

\\DC01\FSW_SQLCLUSTER \

<img width="684" height="468" alt="image" src="https://github.com/user-attachments/assets/beaa886c-48ca-4dc6-ac92-49ac8deab524" />


Ai finalizar, vamos validar indo para o proprio Failover Cluster Manager, vamos para a parte Cluster Core Resources
<img width="1024" height="732" alt="image" src="https://github.com/user-attachments/assets/2293158a-08d5-4889-b9dc-6180e0a7ebff" />

