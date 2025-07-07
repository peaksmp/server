#! /bin/bash

cat <<EOF | docker exec --interactive minecraft sh
rcon-cli "playsound minecraft:block.note_block.bell block @a 0 0 0 1 0.5 1"
sleep 0.2
rcon-cli "playsound minecraft:block.note_block.bell block @a 0 0 0 1 0.5 1"
sleep 0.1
rcon-cli "playsound minecraft:block.note_block.bell block @a 0 0 0 1 0.749154 1"
sleep 0.2
rcon-cli 'title @a times 10 100 10'
rcon-cli 'title @a subtitle {"text":"Peak will reboot to update in 15 seconds.","color":"#BFFFFF"}'
rcon-cli 'title @a title {"text":"Server rebooting"}'
EOF

sleep 15

docker exec minecraft rcon-cli "playsound minecraft:block.note_block.bit block @a 0 0 0 1 0.749154 1"


#if [ -d "$SERVER_ROOT" ]
#then
#  cd "$SERVER_ROOT"
#  docker compose down
#  git fetch --all
#  git reset --hard origin/main
#else
#  git clone "$REPOSITORY_URL" "$SERVER_ROOT"
#  cd "$SERVER_ROOT"
#fi
#
#docker compose pull
#docker image prune -f
#docker compose up -d