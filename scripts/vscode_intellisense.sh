#!/bin/bash
# This script is used to setup vscode intellisense for swift and objective-c


server_path="$(xcrun --toolchain swift --find sourcekit-lsp)"

if [[ $? -eq 0 ]]; then
    echo "sourcekit-lsp is installed"
else
    echo "sourcekit-lsp is not installed"
    exit 1
fi

config='"sourcekit-lsp.serverPath": "'$server_path'"' 

if [[ -f $HOME/Library/Application\ Support/Code/User/settings.json ]]; then
    echo "settings.json exists"
    if grep -q "sourcekit-lsp.serverPath" $HOME/Library/Application\ Support/Code/User/settings.json; then
        echo "sourcekit-lsp.serverPath is already in settings.json"
    else
        echo "sourcekit-lsp.serverPath is not in settings.json"
        echo $config >> $HOME/Library/Application\ Support/Code/User/settings.json
    fi
else
    echo "settings.json does not exist"
    echo $config >> $HOME/Library/Application\ Support/Code/User/settings.json
fi
