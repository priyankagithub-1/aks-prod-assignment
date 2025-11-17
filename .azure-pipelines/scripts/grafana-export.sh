#!/bin/bash
set -euo pipefail
# This script exports a list of dashboards by UID to PNG using Grafana render API
GRAFANA_URL=${GRAFANA_URL}
API_KEY=${GRAFANA_API_KEY}
DASH_UIDS=("dashboard-uid-1" "dashboard-uid-2")
TIMESTAMP=$(date -u +%Y%m%dT%H%M%SZ)
for uid in "${DASH_UIDS[@]}"; do
  OUTFILE="grafana-report-${uid}-${TIMESTAMP}.png"
  curl -s -H "Authorization: Bearer ${API_KEY}" "${GRAFANA_URL}/render/d-solo/${uid}?panelId=1&width=1000&height=500&tz=UTC" -o /tmp/${OUTFILE}
  # upload to blob
  az storage blob upload --account-name ${AZURE_STORAGE_ACCOUNT} --account-key ${AZURE_STORAGE_KEY} --container-name reports --file /tmp/${OUTFILE} --name ${OUTFILE}
#done
