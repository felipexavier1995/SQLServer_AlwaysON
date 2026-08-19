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
