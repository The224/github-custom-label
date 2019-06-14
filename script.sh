#!/bin/bash

echo ''
echo 'This script will change the GitHub default labels and create labels for your repo. A personal access token is required to access private repos.'

echo ''
echo -n 'GitHub Personal Access Token: '
read -s TOKEN

echo ''
echo -n 'GitHub Org/Repo (e.g. foo/bar): '
read REPO

REPO_USER=$(echo "$REPO" | cut -f1 -d /)
REPO_NAME=$(echo "$REPO" | cut -f2 -d /)

# Delete default labels
# curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/bug
# curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/duplicate
# curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/enhancement
# curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/help%20wanted
# curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/invalid
# curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/question
# curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/wontfix
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/good%20first%20issue

#create generic labels
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"need more ressources","color":"FADA5E","description":"Extra attention is needed"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"refactoring","color":"000000","description":"Rethinking the logic"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"to confirm","color":"891a09","description":"Need to be confirm"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"tasks","color":"891a09","description":"Need to be confirm"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"blocked","color":"b60205","description":"Cant go further"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"trash :neckbeard:","color":"000000"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"

#create priority labels
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"priority high","color":"F57C00"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"priority low","color":"FFE0B2"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"priority medium","color":"FFB74D"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"

#create state labels [I use Zenhub]
# curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"in analysis","color":"fbca04"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
# curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"ready","color":"fbca04"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
# curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"in progress","color":"c2e0c6"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
# curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"in review","color":"c2e0c6"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
# curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"feature testing","color":"0e8a16"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
# curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"integration testing","color":"0e8a16"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
