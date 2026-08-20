<h1> ✅ Instalação do SQL Server 2016.</h1>

<h3> 💻 Pré instalação. </h3>
Antes de darmos andamento a instalação, precisa fazer o pré instalação diretamento do site da Microsoft.

Link: https://www.microsoft.com/pt-br/evalcenter/download-sql-server-2016

Ao baixar o instalador, vamos executar ele para assim gerar o arquivo .ISO

<img width="844" height="671" alt="image" src="https://github.com/user-attachments/assets/43c09843-59af-4417-8e9f-a27efc2ca0ca" />

<img width="846" height="669" alt="image" src="https://github.com/user-attachments/assets/38aa8756-6f60-48fc-a4aa-8ed7686b0248" />

<img width="495" height="117" alt="image" src="https://github.com/user-attachments/assets/64b05161-388c-4597-9f37-2ec681eb1806" />


OBS: Vamos colocar como Ingles para ter uma padronização com ambiente de produção global.


<h3> 💻 Adicionando o arquivo .ISO na maquina virtual. </h3>

Antes de ligar os servidor SQL01 e SQL02, vai ser necessário colocar o arquivo .ISO na unida de disco (DVD)

<img width="653" height="561" alt="image" src="https://github.com/user-attachments/assets/159d3bc6-94f0-4899-a8b9-cb5ca5dac8f7" />

Agora basta ligar o servidor para reconhecer a instalação do sql server no servidor.

<h3> 💻 Instalação do serviço do SQL SERVER. </h3>

Entrando no servidor, basta ir no File Explorer 
<img width="792" height="590" alt="image" src="https://github.com/user-attachments/assets/13fedbde-888a-44f6-9720-f82370f482b3" />

Ao executar, ir em "installation" e "New SQL Server stand-alone installation or add features to an existing installation".
<img width="790" height="594" alt="image" src="https://github.com/user-attachments/assets/125c8963-0f43-4222-bce3-2ff5d51ed57d" />

Na aba lateral de Product Key, podemos deixar como developer
Porque desse modo os recursos que Enterprise Edition e suas features contem no pacote, sem prazo de expiração e é gratuita.
<img width="807" height="608" alt="image" src="https://github.com/user-attachments/assets/89c459c1-65f5-4887-b980-b786642ba51f" />

A seguir, marca como "I accept..."
<img width="811" height="609" alt="image" src="https://github.com/user-attachments/assets/d9991143-3747-4863-9557-5d24d4331c92" />

Marcar a caixa e seguir \
<img width="809" height="607" alt="image" src="https://github.com/user-attachments/assets/ae186c56-7ef7-40b6-a116-0ad6f3baa0d6" />

Ao seguir vai contem esse ERRO, porem, vamos seguir adiante
<img width="799" height="590" alt="image" src="https://github.com/user-attachments/assets/a37dcdb3-a492-47c3-af1a-d588bf4fa06b" />


Ao seguir vai conter esses warning são referente alguns atualizações do Sistemas Operacionais. \
Podemos seguir em frente e posteriormente atualizar o Windows. 
<img width="808" height="608" alt="image" src="https://github.com/user-attachments/assets/ad915d8f-3507-4703-a0eb-46a35ea5c698" />

Na parte de feature selection, vamos marcar nas opções:
1. ✅ Database Engine Services
2. ✅ Client Tools Connectivity





