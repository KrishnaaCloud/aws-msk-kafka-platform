# MSK Migration Strategy: Process & Workflow

### 1. Stakeholder Coordination
I led weekly syncs with three primary teams to define the migration roadmap:
- **Database Team**: Audited source views to ensure indices were optimized for timestamp-based ingestion.
- **Airflow (App) Team**: Coordinated offset resets to ensure continuous data processing during the topic cutovers.
- **DevOps/Infrastructure**: Defined the IAM Roles and cross-account access policies for Secrets Manager.

### 2. Technical Audit & Optimization
Before migrating any connector, I performed a manual SQL audit of the legacy Kafka queries.
- **Subquery Pattern**: Introduced the `SELECT * FROM (SELECT...) as t` pattern to resolve "Double WHERE" syntax errors common in MSK MSK environments.
- **Partition Normalization**: Re-architected topics (transitioning from multi-partition to single-partition where FIFO ordering was a business priority).

### 3. Migration Workflow
1. **Pilot Phase**: Migration of non-prod environments using the `SecretsManagerConfigProvider`.
2. **Standardization**: Batch update of poll intervals and deduplication logic.
3. **Cutover**: Coordinated "Stop-Update-Recreate" windows for production topics to ensure data integrity during the partition count changes.
