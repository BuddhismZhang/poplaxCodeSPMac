#!/bin/bash
# Test on Xcode4.x and Xcode5-DP 
# by Poplax[linjiang9999@gmail.com]

CODE_SRC=`pwd -P`
XCODE_USERDATA=~/Library/Developer/Xcode/UserData
XCODE_USERDATA_CONFIG_DIR="CodeSnippets FontAndColorThemes KeyBindings"
XCODE_PLUGIN=~/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins/
XCODE_PLUGIN_NAME="UncrustifyPlugin OMQuickHelp"


#Install My Config
for user_config in $XCODE_USERDATA_CONFIG_DIR
do
	if ! [ -d $XCODE_USERDATA/$user_config ]
	then
		echo "file $XCODE_USERDATA/$user_config not exsit"
	else
		if ! [ -d $XCODE_USERDATA/$user_config.backup ]
		then    
			echo "make backup $XCODE_USERDATA/$user_config.backup"
			mv $XCODE_USERDATA/$user_config $XCODE_USERDATA/$user_config.backup    
		fi
	fi

	if ! [ -h $XCODE_USERDATA/$user_config ]
	then
		echo "Create symbolic link $XCODE_USERDATA/$user_config"
		ln -s $CODE_SRC/$user_config $XCODE_USERDATA/$user_config
	fi
done

#Install Plugin
if ! [ -d "$XCODE_PLUGIN" ]
then 
    mkdir -p "$XCODE_PLUGIN" 
fi

for plugin in $XCODE_PLUGIN_NAME
do
	if ! [ -e "$XCODE_PLUGIN/$plugin.xcplugin" ]
	then
		echo Install plugin
		cp -r $plugin.xcplugin.tar.gz "$XCODE_PLUGIN"
		cd "$XCODE_PLUGIN"
		tar -zxf $plugin.xcplugin.tar.gz
		cd -
	fi
done

echo "*** XCode Poplax Code Setup Complate!!!***"
