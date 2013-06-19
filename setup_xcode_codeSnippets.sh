#!/bin/bash

#cp -r ~/Library/Developer/Xcode/UserData/CodeSnippets/ 
mv ~/Library/Developer/Xcode/UserData/CodeSnippets ~/Library/Developer/Xcode/UserData/CodeSnippets.backup

CODE_SRC=`pwd -P`
ln -s ${CODE_SRC}/CodeSnippets ~/Library/Developer/Xcode/UserData/CodeSnippets
echo "*** XCode Poplax Code Setup Complate!!!***"
