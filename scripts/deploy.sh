#! /bin/bash

if [ -d "$SERVER_ROOT" ]
then
  cd "$SERVER_ROOT"
  docker compose down
  git fetch --all
  git reset --hard origin/main
else
  git clone "$REPOSITORY_URL" "$SERVER_ROOT"
  cd "$SERVER_ROOT"
fi

docker compose pull
docker image prune -f
docker compose up -d