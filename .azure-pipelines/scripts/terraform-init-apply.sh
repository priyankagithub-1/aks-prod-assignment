#!/bin/bash
set -euo pipefail
CMD=${1:-plan}
cd terraform
terraform init -backend-config="storage_account_name=${TF_BACKEND_SA}" -backend-config="container_name=${TF_BACKEND_CONTAINER}" -backend-config="resource_group_name=${TF_BACKEND_RG}"
if [ "$CMD" = "plan" ]; then
  terraform plan -out tfplan
elif [ "$CMD" = "apply" ]; then
  terraform apply -auto-approve tfplan
else
  echo "unknown command"
  exit 1
fi
