#! /bin/bash

: '
    uninstall vim plugins
'

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
    # if directory exists then uninstall
    if [ -d $pluginDir ]; then
        rm -rf ${pluginDir}
        echo "      plugin removed"
    fi
done
