#!/bin/bash

# Create a new directory for the project


if [ "$(ls -A .)" ]; then
    echo "- Current directory is not empty - swift init needs a new directory."
    exit 1
fi


project_name=$1
if [ -z "$project_name" ]; then
    printf "Please provide a project name: "
    read project_name

fi

echo "Creating project $project_name in $PWD/$project_name"


mkdir $project_name
cd $project_name

# Create a new Objective-C file
touch main.m

# Open the directory in VSCode
code .

# Initialize a new workspace and add the Objective-C file to it
echo '{
    "folders": [
        {
            "path": "."
        }
    ],
    "settings": {
        "clang-format.style": "Google",
        "files.associations": {
            "*.m": "objective-c"
        }
    }
}' > workspace.code-workspace

# Install required VSCode extensions
# code --install-extension ms-vscode.cpptools
# code --install-extension formulahendry.code-runner
