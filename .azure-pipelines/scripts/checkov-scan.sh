#!/bin/bash
set -euo pipefail
# run checkov on terraform directory
docker run --rm -v $(pwd)/terraform:/tf bridgecrew/checkov:latest -d /tf --quiet || true
# exit code non-zero indicates findings — choose policy: exit non-zero on critical
