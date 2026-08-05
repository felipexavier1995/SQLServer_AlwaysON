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

O FCI protege a instância inteira do SQL Server (não apenas bancos específicos), utilizando armazenamento compartilhado (Shared Storage) entre os nós do cluster.

Principais características:

1. Um único nome virtual de rede (VNN) e IP virtual representam a instância, independentemente de qual nó físico está ativo.
2. Em caso de falha, o serviço do SQL Server é reiniciado em outro nó do cluster, apontando para o mesmo storage compartilhado. (Por esse motivo o nome ser alta disponibilidade)
3. Protege contra falhas de servidor/hardware, mas não contra falhas do storage (por isso é comum combinar FCI + AGs em arquiteturas mais robustas).
4. Depende obrigatoriamente de Windows Server Failover Cluster (WSFC).

### <h1> :computer: Componentes-chave da arquitetura (AGs)</h1>
1. WSFC (Windows Server Failover Cluster) — infraestrutura de cluster que fornece o mecanismo de quorum e monitoramento de saúde dos nós.
2. Listener — endpoint de rede único (para AGs) que redireciona conexões automaticamente para a réplica primária atual.
3. Endpoint de espelhamento (Database Mirroring Endpoint) — canal de comunicação usado para replicação entre réplicas. (Entre os nos SQL01 e SQL02)

### <h1> ✅ Benefícios </h1>
1. Redução drástica de RTO (Recovery Time Objective) e RPO (Recovery Point Objective).
2. Failover automático ou manual, com mínima intervenção humana.
3. Melhor aproveitamento de hardware, usando réplicas secundárias para leitura e backup.
4. Flexibilidade para combinar AGs e FCI conforme a criticidade de cada aplicação.

### <h1> 📚 Requisitos usados para a criação dos servidores e seus nomes. </h1>

| System | Memory | Storage | Network |
| --- | --- | --- | --- |
| Winodws Server 2019 | 4GB | 50GB | Internal Network and NAT |

###<h1> 📋 Pré-requisitos gerais </h1>
1. SQL Server Enterprise Edition (para funcionalidades completas; Standard Edition possui versão simplificada, "Basic Availability Groups", desde o SQL 2016).
2. Windows Server Failover Clustering habilitado
3. Conectividade de rede estável e de baixa latência entre os nós
4. Storage compartilhado (para FCI) ou storage independente por nó (para AGs). (Usaremos o AGs)


