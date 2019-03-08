#!/bin/sh

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# build.sh                 
#                          
# https://github.com/olakra/language-translator
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

echo "# ~~~~~~~~~~~~~~~~~~~~~~~~ #"
echo "# translator               #"
echo "# v.0.0.1                  #"
echo "# ~~~~~~~~~~~~~~~~~~~~~~~~ #"

cd src/docker
sh -c 'docker-compose up -d --no-recreate --quiet-pull' &
cd ../..
