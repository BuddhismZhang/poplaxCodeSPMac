#!/bin/bash

mv ~/Library/Developer/Xcode/UserData/CodeSnippets ~/Library/Developer/Xcode/UserData/CodeSnippets.backup

CODE_SRC=`pwd -P`
ln -s ${CODE_SRC}/CodeSnippets ~/Library/Developer/Xcode/UserData/CodeSnippets
cp ${CODE_SRC}/themes/Ciapre.dvtcolortheme ${CODE_SRC}/themes/'Ciapre 2.dvtcolortheme' ${CODE_SRC}/themes/'Ciapre Blue.dvtcolortheme' ~/Library/Developer/Xcode/UserData/FontAndColorThemes
echo "*** XCode Poplax Code Setup Complate!!!***"
