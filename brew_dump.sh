#!/bin/bash
# Dump all installed brew packages to a file
today=$(date +%Y-%m-%d)
timestamp=$(date +%H-%M-%S)
echo "__ Brew dump __" >> leaves
echo "-- Dumping brew packages to file $today @$timestamp" >> leaves
brew deps --tree --installed >> leaves

echo "-- versions" >> leaves
brew list --versions >> leaves
echo "-- taps" >> leaves
brew tap >> leaves

echo "-- everything below this can be uninstalled or installed -- " >> leaves

brew leaves >> leaves
echo "-- Dumping casks $today @$timestamp" >> casks
brew list --cask  >> casks
echo "__ end dump __" >> leaves
echo "" >> leaves


