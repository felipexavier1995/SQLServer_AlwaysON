<h1> SQL Server Always On </h1> 

Documentação de referência sobre a feature Always On do Microsoft SQL Server, com foco em alta disponibilidade (High Availability) e recuperação de desastres (Disaster Recovery) para ambientes de banco de dados críticos.

Este repositório reúne conceitos, arquitetura e boas práticas sobre o assunto, servindo como material de estudo, consulta rápida e portfólio técnico em administração de banco de dados (DBA).

<h1>  :computer:  O que é o Always On? </h1>

Always On é o nome guarda-chuva dado pela Microsoft a um conjunto de tecnologias de alta disponibilidade e recuperação de desastres do SQL Server, introduzidas a partir do SQL Server 2012. O objetivo central é minimizar (ou eliminar) o downtime de bancos de dados em cenários de falha de hardware, software, ou até de um datacenter inteiro.

Na prática, o Always On se divide em duas soluções complementares:

| Solução | Nível de proteção | Uso principal |
|---|---|---|
| Always On Availability Groups (AGs) | Nivel de banco de dados | Alta disponibilidade + leitura em réplicas secundárias |
| Always On Failover Cluster Instances (FCI) | Nivel de instancia | Proteção contra falha de servidor/harware |

<h1> :computer: Always On Availability Groups (AGs)</h1>
Os Availability Groups permitem agrupar um ou mais bancos de dados de usuário (chamados availability databases) e replicá-los para um ou mais servidores secundários, mantendo cópias sincronizadas ou assíncronas prontas para assumir em caso de falha.

### Principais características:

1. Replicação em nível de banco de dados, não de instância inteira.
2. Suporta até 8 réplicas secundárias.
3. Modos de disponibilidade:
   1. Synchronous Commit — zero perda de dados, mas com impacto de latência.
   2. Asynchronous Commit — melhor performance, com possível perda mínima de dados em failover.
4. Réplicas secundárias podem ser usadas para:
   1. Leitura (Read-Only Routing) — descarrega relatórios e consultas da réplica primária.
   2. Backups — reduz carga de I/O no servidor principal.
5. Requer um Windows Server Failover Cluster (WSFC).
6. Automatic Failover disponível em configurações síncronas com quorum adequado.

<h1> :computer: Always On Failover Cluster Instances (FCI) </h1>
