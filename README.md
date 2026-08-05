<h1> SQL Server Always On </h1> 

Documentação de referência sobre a feature Always On do Microsoft SQL Server, com foco em alta disponibilidade (High Availability) e recuperação de desastres (Disaster Recovery) para ambientes de banco de dados críticos.

Este repositório reúne conceitos, arquitetura e boas práticas sobre o assunto, servindo como material de estudo, consulta rápida e portfólio técnico em administração de banco de dados (DBA).

:floppy_disk: <h1> O que é o Always On? </h1>

Always On é o nome guarda-chuva dado pela Microsoft a um conjunto de tecnologias de alta disponibilidade e recuperação de desastres do SQL Server, introduzidas a partir do SQL Server 2012. O objetivo central é minimizar (ou eliminar) o downtime de bancos de dados em cenários de falha de hardware, software, ou até de um datacenter inteiro.

Na prática, o Always On se divide em duas soluções complementares:

| Solução | Nível de proteção | Uso principal |
|---|---|---|
| Always On Availability Groups (AGs) | Nivel de banco de dados | Alta disponibilidade + leitura em réplicas secundárias |
| Always On Failover Cluster Instances (FCI) | Nivel de instancia | Proteção contra falha de servidor/harware |

