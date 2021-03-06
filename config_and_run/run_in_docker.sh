#!/bin/bash

CSV_NAME=$1
CONTAINER_ID=$2
CONFIG_NAME=obscuritext_configs


# Copies csv file and config files into docker
docker cp ${CSV_NAME}.csv \
        ${CONTAINER_ID}:/dssg-obscuritext-7890e9a/${CSV_NAME}.csv
docker cp ${CONFIG_NAME}.cfg \
        ${CONTAINER_ID}:/dssg-obscuritext-7890e9a/${CONFIG_NAME}.cfg

docker exec -it ${CONTAINER_ID} sh -c "python3 text_obscure.py"
docker cp ${CONTAINER_ID}:/dssg-obscuritext-7890e9a/obscured_${CSV_NAME} \
              ./obscured_${CSV_NAME}
