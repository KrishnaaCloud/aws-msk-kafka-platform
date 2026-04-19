# Enterprise MSK Migration & Infrastructure Management

## Role: Lead Migration Architect
As the **sole engineer responsible** for the organization-wide transition from self-managed Kafka to **Amazon MSK**, I spearheaded the end-to-end migration of all data streams, connectors, and topics. This suite contains the production-hardened configurations, security integrations, and automation logic I developed to standardize our enterprise data infrastructure.

### Project Impact & Scale
- **Direct Leadership**: Acted as the primary architect and coordinator for Database, Airflow, and Application teams to audit requirements and execute zero-downtime cutovers.
- **Full-Scale Migration**: Successfully migrated **65+ connectors**, **200+ Topics**, and **100+ million records** to MSK with zero data loss.
- **Query Engineering**: Optimized legacy SQL queries for high-performance JDBC ingestion, implementing complex subquery patterns to ensure compatibility with MSK incremental filters.
- **Cost Efficiency**: Implementation of staggered "Pulse Ingestion" models, reducing source RDS infrastructure costs and CPU load by **40%**.

---

## 📁 Repository Directory Structure

- **[/Connectors](https://github.com/KrishnaaCloud/Kafka/blob/main/msk/Scripts/stagger_pulse.sh))**: Production-ready configuration files for MSK JDBC Source Connectors.
- **[/scripts](https://github.com/KrishnaaCloud/Kafka/tree/689b5c3b348fd6cd147eca65ee1f5c6bab8503fc/msk%20/Scripts%20)**: Custom Bash orchestration suite for staggered execution.
- **[/docs](https://github.com/KrishnaaCloud/Kafka/tree/689b5c3b348fd6cd147eca65ee1f5c6bab8503fc/msk%20/docs%20)**: Technical deep-dives, Stakeholder sync logs, and Migration strategy documents.
