#!/bin/bash

# Create a new directory for the project
# This script is for macOS.


# Sanity check not needed as we are creating a new directory
# if [ "$(ls -A .)" ]; then
#     echo "- Current directory is not empty - swift init needs a new directory."
#     exit 1
# fi



DATE=$(date)
project_name=$1
project_dir=$2
if [ -z "$project_name" ]; then
    printf "Please provide a project name: "
    read project_name

fi

if [ -z "$project_dir" ]; then
    printf "Please provide a project directory or leave blank for HOME dir : $HOME: "
    read project_dir

fi


if [ -z "$project_dir" ]; then
    project_dir=$HOME
fi


echo "Creating project $project_name in $project_dir/$project_name on $DATE " >> scripts.log

#check if file exists
if [ -d "$project_dir/$project_name" ]; then
    echo "Failed to create project $project_name in $project_dir/$project_name as it already exists"
    echo "Failed to create project $project_name in $project_dir/$project_name on $DATE " >> scripts.log
    exit 1
fi

echo "Creating project objective -C $project_name in $project_dir/$project_name"
mkdir "$project_dir/$project_name"
cd "$project_dir/$project_name"

# Create a new Objective-C file
touch main.m

# add a simple code to the file

cat << EOF > main.m
#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        while (1) {
            NSPoint mouseLocation = [NSEvent mouseLocation];
            fprintf(stderr, "Mouse Location: {%f, %f}\n", mouseLocation.x, mouseLocation.y);
            usleep(100000); // sleep for 0.1 second
        }
    }
    return 0;
}
EOF



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
code --install-extension ms-vscode.cpptools

# build the project
# echo "xcodebuild -project $project_name.xcodeproj -scheme $project_name -configuration Debug" > build.sh
touch build.sh

cat << EOF > build.sh
#!/bin/bash
# --- project $project_name created on $DATE by $USER ---

# Note: You need to specify the frameworks you need to link.

clang -o $project_name *.m  -framework ApplicationServices -framework Foundation -framework Cocoa -framework AppKit -fobjc-arc
./$project_name
EOF

chmod +x build.sh

# echo "project $project_name created on $DATE" > build.sh
# echo "clang -o $project_name *.m  -framework ApplicationServices -framework Foundation -framework Cocoa -framework AppKit -fobjc-arc" > build.sh
# echo "clang -framework Foundation -framework Cocoa main.m -o $project_name" > build.sh

