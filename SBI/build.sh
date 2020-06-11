#!/bin/bash

set -x

export PATH="$PATH:/usr/local/bin"
export USERID=$(id -u)
export GROUPID=$(id -g)

cd $(dirname $0)

CONTAINER_NAME="tester-$(echo ${JOB_NAME} | tr '/ ' '._').${BRANCH_NAME}"
[ -n "$CHANGE_ID" ] && CONTAINER_NAME="${CONTAINER_NAME}-PR${CHANGE_ID}"
CONTAINER_NAME="${CONTAINER_NAME}-${BUILD_ID}"

echo $REGION
echo $AMI_NAME
echo $DESCRIPTION

docker-compose -f builder.yml run \
      --rm -w "$WORKSPACE" \
      --name "$CONTAINER_NAME" \
      slave build -var 'region=$REGION' \
      -var 'ami-name=$AMI_NAME' \
      -var 'description=$DESCRIPTION' slave-ami.json
