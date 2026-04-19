#!/bin/bash
# MSK Connector Orchestration Script
# Purpose: Leads a staggered restart across the organization's connectors to safeguard RDS resources.

# Catalog of migrated connectors
CONNECTORS=(
  "prod_ishangam_cms_campaigns"
  "prod_ishangam_cms_ylma_regs_v2"
  "prod_donations_onetime_v2"
  "prod_donations_recurring_v2"
  "prod_ishangam_outreach_isha_vidhya"
  "nonprod_donations_erp_payments"
)

echo "$(date): Initiating Scheduled Staggered Sync..."

for name in "${CONNECTORS[@]}"; do
  echo "Force-starting $name..."
  # Triggers an immediate poll via the Kafka Connect REST API
  curl -s -X POST http://localhost:8083/connectors/$name/tasks/0/restart
  
  # 5-minute stagger (300 seconds) to prevent concurrent DB load
  sleep 300 
done

echo "Orchestration Complete. Next pulse scheduled via system cron."
