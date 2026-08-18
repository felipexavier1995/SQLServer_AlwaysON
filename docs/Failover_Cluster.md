<h1>✅ Validando Failover Cluster.</h1>

Esse passo verifica se o ambiente atende aos requisitos mínimos para o cluster funcionar corretamente — é uma boa prática (e a Microsoft recomenda fortemente rodar isso antes de criar o cluster de fato). \
Dentro do qualquer servidor (No caso vai entrar no servidor SQL01 para validar) vamos executar algumas etapas.

<img width="1027" height="647" alt="image" src="https://github.com/user-attachments/assets/af58a9e7-03b1-4f3c-a266-17d6e82a00a9" />

Para verificar os NOS e os servidores que estão conectados no cluster são apresentar na seguinte tela.
<img width="1013" height="724" alt="image" src="https://github.com/user-attachments/assets/83ba5b44-9825-46b9-8d58-1074a7a2a61b" />


<img width="1021" height="730" alt="image" src="https://github.com/user-attachments/assets/a64c2e38-7908-4016-98e3-6ee68ba9da63" />

Na aba nodes vão apresentar os servidores SQL01 e SQL02

| Computer Name | Status | Assigned Vote | Current Vote | 
| --- | --- | --- | --- |
| SQL01 | UP | 1 | 0 |
| SQL02 | UP | 1 | 1 |
<img width="1016" height="296" alt="image" src="https://github.com/user-attachments/assets/52decc72-177c-4ec6-a474-f80578fc8360" />

