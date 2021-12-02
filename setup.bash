#!/bin/bash

declare -A project=( 
    ["microServiceStatistique"]="git@github.com:cultureGeneralYNOVGLS/microServiceStatistique.git"
    ["microServicePartie"]="git@github.com:cultureGeneralYNOVGLS/microServicePartie.git" 
    ["cultureGeneralFront"]="git@github.com:cultureGeneralYNOVGLS/cultureGeneralFront.git"
    ["microServiceUtilisateur"]="git@github.com:cultureGeneralYNOVGLS/microServiceUtilisateur.git"
    )

if [[ -d ./project ]] ; then
  rm -rf ./project
fi

mkdir -p ./{project,data/{micro-service-game-mongodb,micro-service-user-mongodb}}

for p in "${!project[@]}" ; do
  git clone ${project[$p]} project/${p}
done

docker-compose up --build -d