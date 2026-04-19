# Enterprise MSK Migration & Infrastructure Management
## Role: Lead Migration Architect
As the sole engineer responsible for the organization-wide transition from self-managed Kafka to **Amazon MSK**, I spearheaded the end-to-end migration of all data streams, connectors, and topics. 
### Project Impact
- **Organizational Leadership**: Acted as the primary point of contact for Database, Airflow, and Application teams to audit requirements and coordinate seamless cutovers.
- **Full-Scale Migration**: Successfully migrated 65+ connectors,200+ Topics and 100+ million records to MSK with zero data loss.
- **Query Optimization**: Redesigned and optimized legacy SQL queries for high-performance JDBC ingestion, including custom subquery implementations to handle MSK-specific requirements.
- **Cost & Performance Tuning**: Implementation of staggered "Pulse Ingestion" models to reduce RDS infrastructure costs and CPU load by 40%.
## 📁 Repository Structure
- `/connectors`: Production-ready configurations for MSK JDBC Source Connectors.
- `/scripts`: Custom Bash orchestration suite for staggered batch ingestion and automated restarts.
- `/docs`: **Migration Strategy**, Security Hardening, and Architecture Deep-dives.
