#!/bin/bash

set -euo pipefail

echo "$MY_VARIABLE"

echo "$MY_SECRET"

echo "GITHUB_TOKEN = $GITHUB_TOKEN"

ls "$GITHUB_WORKSPACE"

echo "Job status is $JOB_STATUS"