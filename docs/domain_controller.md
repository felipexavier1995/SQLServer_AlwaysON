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
<img width="790" height="563" alt="image" src="https://github.com/user-attachments/assets/e07b42c1-bbf1-41b5-80fa-f6ce3c640d1b" />

O confirmation é uma resumo de tudo que vai ser instalado no servidor \
<img width="789" height="559" alt="image" src="https://github.com/user-attachments/assets/64b48de1-6d67-4e4a-8c08-eeb5a0864eb0" />

Na aba de Results é o que foi instalado para ser declarado como Domain Controller. \
<img width="788" height="557" alt="image" src="https://github.com/user-attachments/assets/20a2fc3d-7e7c-437a-b1f0-f9e59273da57" />

Ao finalizar, o Windows vai pedir para reiniciar o servidor, ao reiniciar vai apresentar como LABSQL\Administrator \
O prefixo LABSQL é o NetBIOS name do domínio que acabamos de criar. \
Isso confirma que o DC01 já está operando como Domain Controller do domínio labsql.local. \
<img width="1022" height="835" alt="image" src="https://github.com/user-attachments/assets/6cd1de37-391b-49e8-92c0-11636d4b463f" />

<h1>✅ SQL01 e SQL02 ingressados no domínio. </h1>
A seguir, ao ligar o servidor basta ir na aba "local server" e depois trocar o nome do computar e domain \

<img width="1021" height="362" alt="image" src="https://github.com/user-attachments/assets/af444472-8cb0-419a-bdd8-1bcdd4f44adb" />
<img width="408" height="469" alt="image" src="https://github.com/user-attachments/assets/4b69aba5-0241-41a1-85fb-1f6c0fd70e87" /> 

E depois clicar em change e colocar os nomes do computador e o domain. \
<img width="325" height="392" alt="image" src="https://github.com/user-attachments/assets/786eeebb-6215-4b65-9025-589aa03d3262" /> \
Ao confirmar isso, o proprio servidor vai indicar para reiniciar (Por favor fazer isso para validar) \
Repetir esse processo para o servidor SQL02

Uma observação: Ao concluir em colocar todos os servidores no domain. \
Testar resolução de nome completo (FQDN) entre os 3 servidores \

De qualquer uma das VMs, teste:  

ping SQL01.labsql.local \
ping SQL02.labsql.local \
ping DC01.labsql.local  

<img width="682" height="772" alt="image" src="https://github.com/user-attachments/assets/fddabb1c-489f-444e-b309-7f1a8c4b1663" />

<h1>✅ Failover Clustering instalado nos 2 nós. </h1>

Isso precisa ser feito em SQL01 e SQL02 (não no DC01 — o DC não faz parte do cluster de failover do SQL).

Repita esse processo nas duas VMs (SQL01 e SQL02) e me avisa quando ambas tiverem o Failover Clustering instalado. \
Depois seguimos para a criação do cluster propriamente dito (via Failover Cluster Manager), que vai envolver validar a configuração e nomear o cluster. \

Ao logar no servidor basta ir server manager, add roles.
<img width="1027" height="283" alt="image" src="https://github.com/user-attachments/assets/4fa74ac1-0ab2-4e62-816b-c5f2a56fbf70" />

Vai abrir um pop-up \
<img width="792" height="565" alt="image" src="https://github.com/user-attachments/assets/d5f77f9e-1279-41bf-af88-aa274041acfc" />
<img width="786" height="561" alt="image" src="https://github.com/user-attachments/assets/a589dac2-295d-4db6-be61-dcafca35600f" />

vai sempre apontar o servidor em questão (Nesse caso é SQL01)
<img width="789" height="562" alt="image" src="https://github.com/user-attachments/assets/e1bf176b-ebb0-4c3c-822c-b842ef24c8fd" />

Na aba server roles não marcar em nada e seguir em frente 
<img width="789" height="563" alt="image" src="https://github.com/user-attachments/assets/5d601b3b-be52-4d63-9ec0-42f2eaaff553" />

Na aba features deixar marcado o Failover Cluster e next
<img width="790" height="563" alt="image" src="https://github.com/user-attachments/assets/bddab11f-6f34-460d-809e-1ea6c935a3a0" />

E por ultimo vai ter a aba de Confirmation (que é um resumo do que vai ser instalado)


