<h1>✅ DC01 promovindo a Domain Controller.</h1>

Já com os três servidores instalado o Sistema Operacional, precisamos alegar um deles como o Domain Controller.

:bell: Mas o que é Domain Controller ?

Ele vai ser o servidor que vai ter a função de autentificar, criar regrar e politicas de grupo, gerenciamento de diretório e disco. Agora referente ao serviço de SQL Server, o Domain Controller tem como funcionalidade de autenticar logins no SQL Server, controlar acessos de contas com suas devidas credenciais.



## Mermaid diagrams
```mermaid
graph TD
  A[Domain Controller] --> B{Autenticador}
  B -->|Link| C[SQL01]
  B -->|Link| D[SQL02]
```

<h1>:computer: Como criar um Domain por etapas: </h1>

Com os três servidores instalados e configurados, precisamos declarar um deles como o Domain Controller. Um detalhe que vamos observar é que o servidor contem IP fixo.
<img width="1023" height="512" alt="image" src="https://github.com/user-attachments/assets/e0ff3136-8ea1-45c9-b7a6-e7befec1acf5" />

Logo vamos alterar o Computer Name e Domain. 
| Computer Name | Domain Name |
| --- | --- |
| DC01 | labsql.local |

A seguir o sistema operacional vai pedir para reiniciar.
<img width="1024" height="540" alt="image" src="https://github.com/user-attachments/assets/bc10cc90-b594-4141-8aaf-4f56955dbfd7" />

A seguir vamos instalar uma nova features que é o Active Directory Domain com  
<img width="1023" height="250" alt="image" src="https://github.com/user-attachments/assets/03eac90b-357d-4181-8eea-1481e9031e2b" />

Na parte superior a esquerda se encontra com o computer nome e o domain
<img width="788" height="562" alt="image" src="https://github.com/user-attachments/assets/96cd5ac7-78de-48ff-94aa-b7f4ed5b328d" />

Na proxima etapa basta deixar como está no momento, porque vai ser apenas um servidor de Domain com algumas roles e features. 
<img width="792" height="562" alt="image" src="https://github.com/user-attachments/assets/2d1c2d5a-85cc-4afd-ab58-c45ce6cb87f7" />

No filtro vamos digitar o nome do servidor [DC01] e definir que esse servidor será o Domain Controller. \
A seguir vai apresentar o nome do servidor e o IP do mesmo.
<img width="784" height="560" alt="image" src="https://github.com/user-attachments/assets/6c10f808-f5ea-4911-8623-9cae05071bd4" />

Em Server Roles vamos deixar marcado apenas as seguintes opções.
* Active Directory Certificate Services.
* DNS Server 
<img width="818" height="624" alt="image" src="https://github.com/user-attachments/assets/64016e5c-e1e5-45d1-94ec-075d5eec0037" />



