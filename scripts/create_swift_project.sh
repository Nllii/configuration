#!/bin/bash

# Create the project directory
# check if current directory is empty

# Sanity check not needed as we are creating a new directory
# if [ "$(ls -A .)" ]; then
#     echo "- Current directory is not empty - swift init needs a new directory."
#     exit 1
# fi


project_name=$1
if [ -z "$project_name" ]; then
    printf "Please provide a project name: "
    read project_name

fi

echo "Creating project $project_name in $PWD/$project_name"

mkdir $project_name
cd $project_name

# Initialize a Swift package
swift package init --type executable

# Change into the Sources directory
cd Sources/$project_name

# Write the Swift source code
cat << EOF > main.swift
import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!

    func applicationDidFinishLaunching(_ notification: Notification) {
        // Create the window
        window = NSWindow(contentRect: NSRect(x: 0, y: 0, width: 200, height: 200),
                          styleMask: [.titled, .closable, .miniaturizable],
                          backing: .buffered,
                          defer: false)
        window.title = "Hello World"
        window.center()
        window.makeKeyAndOrderFront(nil)
    }
}

let delegate = AppDelegate()
let app = NSApplication.shared
app.delegate = delegate
app.activate(ignoringOtherApps: true)
app.run()
EOF

# Build the project
swift build

# Run the project
swift run

echo "swift build" > build.sh
echo "swift run" > build.sh
chmod +x build.sh