#!/bin/bash
# Test on Xcode4.x and Xcode5-DP

XCODE_USERDATA=~/Library/Developer/Xcode/UserData
XCODE_PLUGIN=~/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins/
CODE_SRC=`pwd -P`


if ! [ -d $XCODE_USERDATA/CodeSnippets ]
then
    echo "create dir $XCODE_USERDATA/CodeSnippets"
    mkdir -p $XCODE_USERDATA/CodeSnippets
fi
if ! [ -d $XCODE_USERDATA/CodeSnippets.backup ]
then    
    echo "make backup $XCODE_USERDATA/CodeSnippets.backup"
    mv $XCODE_USERDATA/CodeSnippets $XCODE_USERDATA/CodeSnippets.backup    
fi

if ! [ -d $XCODE_USERDATA/FontAndColorThemes ]
then
    echo "create dir $XCODE_USERDATA/FontAndColorThemes"
    mkdir $XCODE_USERDATA/FontAndColorThemes
fi
if ! [ -d $XCODE_USERDATA/FontAndColorThemes.backup ]
then
    echo "make backup $XCODE_USERDATA/FontAndColorThemes.backup"
    mv $XCODE_USERDATA/FontAndColorThemes $XCODE_USERDATA/FontAndColorThemes.backup    
fi

if ! [ -d "$XCODE_PLUGIN" ]
then 
    mkdir -p "$XCODE_PLUGIN" 
fi

if ! [ -e "$XCODE_PLUGIN/UncrustifyPlugin.xcplugin" ]
then
    echo Install plugin
    cp -r UncrustifyPlugin.xcplugin.tar.gz "$XCODE_PLUGIN"
    cd "$XCODE_PLUGIN"
    tar -zxf UncrustifyPlugin.xcplugin.tar.gz
    cd -
fi

if ! [ -h $XCODE_USERDATA/CodeSnippets ]
then
    echo "Create symbolic link $XCODE_USERDATA/CodeSnippets"
    ln -s $CODE_SRC/CodeSnippets $XCODE_USERDATA/CodeSnippets
fi

if ! [ -h $XCODE_USERDATA/FontAndColorThemes ]
then
    echo "Create symbolic link $XCODE_USERDATA/FontAndColorThemes"
    ln -s $CODE_SRC/themes $XCODE_USERDATA/FontAndColorThemes
fi

#cp ${CODE_SRC}/themes/Ciapre.dvtcolortheme ${CODE_SRC}/themes/'Ciapre 2.dvtcolortheme' ${CODE_SRC}/themes/'Ciapre Blue.dvtcolortheme' ~/Library/Developer/Xcode/UserData/FontAndColorThemes
echo "*** XCode Poplax Code Setup Complate!!!***"
