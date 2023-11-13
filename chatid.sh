#!/bin/bash

echo 'Type your bot token here:'
read BOT_TOKEN

# call data
calldata="$(curl -s https://api.telegram.org/bot$BOT_TOKEN/getUpdates | tail -n 1)"

# get chat id
chat_id="$(echo $calldata | awk -F 'id' '{print $3}'| cut -d ':' -f 2 | cut -d ',' -f 1)"
# get username
username="$(echo $calldata | awk -F 'username' '{print $3}' | cut -d '"' -f 3)"
# get firstname
first_name="$(echo $calldata | awk -F 'first_name' '{print $2}' | cut -d '"' -f 3 )"
# get lastname
last_name="$(echo $calldata | awk -F 'last_name' '{print $2}' | cut -d '"' -f 3 )"

# hasil
echo "Name: $first_name $last_name"$'\n'"Chat id: $chat_id"$'\n'"Username: $username"
