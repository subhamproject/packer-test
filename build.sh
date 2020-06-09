#!/bin/bash

export PATH="$PATH:/usr/local/bin"
export USERID=$(id -u)
export GROUPID=$(id -g)

CONTAINER_NAME="tester-$(echo ${JOB_NAME} | tr '/ ' '._').${BRANCH_NAME}"
[ -n "$CHANGE_ID" ] && CONTAINER_NAME="${CONTAINER_NAME}-PR${CHANGE_ID}"
CONTAINER_NAME="${CONTAINER_NAME}-${BUILD_ID}"

docker-compose -f builder.yml run \
      -w "$WORKSPACE" \
      --name "$CONTAINER_NAME" \
      slave "validate slave-ami.json"
