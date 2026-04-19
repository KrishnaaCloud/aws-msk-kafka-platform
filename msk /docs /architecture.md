# Technical Implementations & Optimizations

## 1. SQL Query Engineering
Legacy Kafka Connect queries often failed due to the way MSK appends incremental filters. I implemented a **Subquery Extraction Pattern** to ensure SQL syntax validity:
- **Legacy**: `SELECT * FROM table WHERE u_date > ...` (Failed on complex views)
- **Optimized**: `SELECT * FROM (SELECT <fields> FROM view ORDER BY id DESC) as t` (Successfully isolated the base data from the MSK pulse filter).

## 2. Staggered Pulse Ingestion

### Methodology
To mitigate the risk of connection surges on the source database, I engineered a "Staggered Ingestion" model. Instead of standard continuous polling, the connectors operate in a coordinated "burst" mode.

### Operational Logic
1. **Quiescent State**: Connectors are configured with a `poll.interval.ms` of 12 hours. This prevents standard background execution from hitting the DB.
2. **Scheduled Trigger**: A system-level `cron` job initiates an orchestration script at 08:30 and 20:30 UTC.
3. **Staggered Activation**: The script iterates through the connector catalog to trigger a `POST /restart` for each task. A **300-second sleep** is enforced between restarts.
4. **Outcome**: No more than one connector is performing an intensive database scan at any given time, preserving RDS Read Replica CPU credit balance and preventing query timeouts.

### Results
- Successfully eliminated RDS CPU spikes during ingestion windows.
- Standardized data availability for end-users at predictable twice-daily intervals.

