#!/bin/bash

mv ~/Library/Developer/Xcode/UserData/CodeSnippets ~/Library/Developer/Xcode/UserData/CodeSnippets.backup
mv ~/Library/Developer/Xcode/UserData/FontAndColorThemes ~/Library/Developer/Xcode/UserData/FontAndColorThemes.backup

CODE_SRC=`pwd -P`
ln -s ${CODE_SRC}/CodeSnippets ~/Library/Developer/Xcode/UserData/CodeSnippets
ln -s ${CODE_SRC}/themes ~/Library/Developer/Xcode/UserData/FontAndColorThemes
#cp ${CODE_SRC}/themes/Ciapre.dvtcolortheme ${CODE_SRC}/themes/'Ciapre 2.dvtcolortheme' ${CODE_SRC}/themes/'Ciapre Blue.dvtcolortheme' ~/Library/Developer/Xcode/UserData/FontAndColorThemes
echo "*** XCode Poplax Code Setup Complate!!!***"
