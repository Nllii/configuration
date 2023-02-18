#!bin/bash 
# This script is used to run the commands in the terminal
currentDirectory=$(pwd)


# pip install --only-binary=:macosx_10_15_x86_64: -r requirements.txt


# swiftc -import-objc-header /System/Library/Frameworks/AppKit.framework/Headers/AppKit.h -o birthday main.swift && ./birthday

if [[ -f $HOME/Library/Application\ Support/Code/User/settings.json ]]; then
    cp $HOME/Library/Application\ Support/Code/User/settings.json .
else
    echo "Directory does not exist"
    exit 1
fi

