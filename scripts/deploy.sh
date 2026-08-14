#!/bin/bash
set -euo pipefail

FULL_NAME="$DOCKERHUB_USERNAME/$IMAGE:latest"

# write the key from the environment to a temp file, lock it down
echo "$EC2_SSH_KEY" > vockey4.pem
chmod 400 vockey4.pem

# run the deploy commands on EC2 over SSH
ssh -o StrictHostKeyChecking=accept-new -i vockey4.pem \
 "$EC2_USER@$EC2_HOST" "
 docker pull $FULL_NAME
 docker stop $CONTAINER 2>/dev/null || true
 docker rm $CONTAINER 2>/dev/null || true
 docker run -d --name $CONTAINER \
 --restart always -p $PORT:$PORT $FULL_NAME
 "
rm -f vockey4.pem # never leave the key lying around