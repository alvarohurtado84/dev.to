#!/bin/bash

# to be used as %> ./scripts/build_and_push.sh production5

# sync the last version of forem
echo "Syncing fork..."
./scripts/sync_fork.sh

# creates the latest production image
echo "Building docker - production"
docker build . --target production -t 971559955932.dkr.ecr.eu-west-1.amazonaws.com/forem-foodpeople:$@

# pushes it to ECR
echo "Login to AWS"
aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin 971559955932.dkr.ecr.eu-west-1.amazonaws.com/forem-foodpeople

echo "Push image to ECR"
docker push 971559955932.dkr.ecr.eu-west-1.amazonaws.com/forem-foodpeople:$@
