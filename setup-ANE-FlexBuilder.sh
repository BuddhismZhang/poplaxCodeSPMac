#!/bin/sh

# Create By Poplax [linjiang9999@gmail.com]
# Date : Thu Sep 12 12:53:16 2013
#
# 安装 FlexBuilder4.7 对 AIRSDK 3.8的支持 (for macOS)
# 1.首先安装好FlexBuilder(4.7测试通过)
# 2.打开终端,进入当前工作目录
# 3.运行此脚本
#
# 安装包内容说明:
# - AIRSDK_Compiler.tbz2 : AIRSDK3.8版本,
# - AdobeAIRSDK.tbz2 : 用于升级Flex SDK (用于Adobe Flex 应用程序对 AIR SDK 3.6+ 和 Flash Builder 4.7 的支持)
# - amtlib.framework : framework 破解文件
# - setup-ANE-FlexBuilder.sh
#
# 注: 安装完毕后打开Flex Builder,在"偏好设置"里确认 "FlexSDK" , "AIRSDK" 配置路径是否正确.升级后的FLEXSDK需要手动 "添加"

# Crack Start 替换文件破解
# sudo echo "127.0.0.1 	activate.adobe.com" >> /etc/hosts

LX_FLEX_FRAMEWORK_AMTLIB="amtlib.framework"
LX_FLEX_FRAMEWORK_AMTLIB_PATH=/Applications/Adobe\ Flash\ Builder\ 4.7/eclipse/plugins/com.adobe.flexide.amt_4.7.0.349722/os/macosx/Frameworks/
cd "$LX_FLEX_FRAMEWORK_AMTLIB_PATH"
echo "$LX_FLEX_FRAMEWORK_AMTLIB_PATH"
if ! [ -d $LX_FLEX_FRAMEWORK_AMTLIB".bak" ]
then
    cp -fr $LX_FLEX_FRAMEWORK_AMTLIB $LX_FLEX_FRAMEWORK_AMTLIB".bak"
    rm -fr $LX_FLEX_FRAMEWORK_AMTLIB
fi
cd -
cp -fr $LX_FLEX_FRAMEWORK_AMTLIB "$LX_FLEX_FRAMEWORK_AMTLIB_PATH"
# Crack End

LX_PWD="`pwd -P`/"
LX_AIRSDK_VERSION="3.8"

LX_FLEXSDK_DIR="4.6.0"
LX_FLEXSDK=/Applications/Adobe\ Flash\ Builder\ 4.7/sdks/
LX_AIRSDK=/Applications/Adobe\ Flash\ Builder\ 4.7/eclipse/plugins/com.adobe.flash.compiler_4.7.0.349722/

FILE_AIRSDK_COMPILER="AIRSDK_Compiler.tbz2"
FILE_FLEXSDK_UPDATE="AdobeAIRSDK.tbz2"

TMP_FILENAME_FLEX_UPDATE=$LX_FLEXSDK_DIR"-air"$LX_AIRSDK_VERSION

# Update AIRSDK to new version. Start

echo "Setup Start ..."
echo "Update AIRSDK to "$LX_AIRSDK_VERSION
echo "Backup older AIRSDK ..."

cp -fr "$LX_AIRSDK""AIRSDK" "$LX_AIRSDK""AIRSDK.bak"

echo "Install new AIRSDK version "$LX_AIRSDK_VERSION "..."

cd "$LX_AIRSDK""AIRSDK"
rm -fr *
cp "$LX_PWD"$FILE_AIRSDK_COMPILER .
tar jxvf $FILE_AIRSDK_COMPILER 
cd -

echo "AIRSDK has been Installed !!!"
echo ""

# Update AIRSDK End.


# Setup FlexSDK to surport AIRSDK Start.

echo "Now Setup Flex Project Surport to AIRSDK "$LX_AIRSDK_VERSION
echo "Copy FlexSDK as a new folder ..."

if ! [ -d "$LX_FLEXSDK"$TMP_FILENAME_FLEX_UPDATE ]
then
    mkdir "$LX_FLEXSDK"$TMP_FILENAME_FLEX_UPDATE
fi

cp -fr "$LX_FLEXSDK"$LX_FLEXSDK_DIR/ "$LX_FLEXSDK"$TMP_FILENAME_FLEX_UPDATE/
cp -f $FILE_FLEXSDK_UPDATE "$LX_FLEXSDK"$TMP_FILENAME_FLEX_UPDATE/
cd "$LX_FLEXSDK"$TMP_FILENAME_FLEX_UPDATE
tar jxvf $FILE_FLEXSDK_UPDATE
rm -f $FILE_FLEXSDK_UPDATE
cd -

# Setup FlexSDK End.

echo "FlexSDK has been updated !!!"

echo "Setup Done ."


