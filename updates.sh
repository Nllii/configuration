#!bin/bash 
# This script is used to run the commands in the terminal
currentDirectory=$(pwd)
DATE=$(date)
# This command is to make pip only gets the macosx_10_15_x86_64 version of the package
# pip install --only-binary=:macosx_10_15_x86_64: -r requirements.txt


# swiftc -import-objc-header /System/Library/Frameworks/AppKit.framework/Headers/AppKit.h -o birthday main.swift && ./birthday
function moveTobackUp(){
    if [[ -f .zshrc ]]; then
      echo "Moving the files to backup"
        mv .zshrc ./backups/.zshrc.bak
        mv settings.json ./backups/settings.json.bak
        mv casks ./backups/casks.bak
        mv leaves ./backups/leaves.bak
        
       
       
    fi
}



function vscodeUserSettings() {
    if [[ -f $HOME/Library/Application\ Support/Code/User/settings.json ]]; then
    cp $HOME/Library/Application\ Support/Code/User/settings.json .
    else
        echo "Directory does not exist"
        exit 1
    fi

}

function copyZshrc() {
    if [[ -f $HOME/.zshrc ]]; then
    cp $HOME/.zshrc .
    else
        echo "Directory does not exist"
        exit 1
    fi

}



function dumpbrew() {
    if [[ -f $HOME/.zshrc ]]; then
    bash brew_dump.sh
    else
        echo "Directory does not exist"
        exit 1
    fi
    

}


if [[ $1 == "-all" ]]; then
    echo "backing up all the files"
    moveTobackUp
    echo "Updating the settings.json file"
    vscodeUserSettings
    echo "Updating the .zshrc file"
    copyZshrc
    echo "Updating the brew dump file"
    dumpbrew
    echo "last backup was run by  updates.sh script on $DATE" >> ./backups/scripts.log
    exit 0
fi



