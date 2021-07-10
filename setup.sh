#! /bin/bash

: '
    load vim setup and plugins
'

# install json query
#sudo apt install jq # debian/ubuntu
#brew install jq # mac

# check jq
if ! command -v jq &> /dev/null; then
    echo "jq is not installed on system"; exit 1;
fi

echo "Processing Vim Plugins..."
# loop plugins for processing
jq -c '.plugins[]' plugins.json | while read i; do
    pluginName=$( echo $i | jq -rc '.name' )
    pluginGit=$( echo $i | jq -rc '.git' )
    pluginDir=$( echo $i | jq -rc '.setupdir' | awk -v awkvar="${HOME}" '{print awkvar"/.vim/"$1}' )

    if [ -z $pluginName ]; then echo "plugin name not setup in plugin json file"; exit 1; fi
    if [ -z $pluginGit ]; then echo "plugin git url not setup in plugin json file"; exit 1; fi
    if [ -z $pluginDir ]; then echo "plugin directory not setup in plugin json file"; exit 1; fi

    echo "  > ${pluginName}"
    # if directory doesnt exist then install
    if [ ! -d $pluginDir ]; then
        git clone $pluginGit $pluginDir
        echo "      installed"
    else
        cd ${pluginDir}
        git pull > /dev/null 2>&1
        test $? -eq 0 && echo "      up-to-date"
    fi
done
