#!/bin/bash
set -euo pipefail
IMAGE_TAG=${BUILD_BUILDID:-local}
ACR_FQDN=${ACR_NAME}.azurecr.io
az acr login --name ${ACR_NAME}
docker build -t ${ACR_FQDN}/sample-app:${IMAGE_TAG} -f app/Dockerfile .
docker push ${ACR_FQDN}/sample-app:${IMAGE_TAG}
