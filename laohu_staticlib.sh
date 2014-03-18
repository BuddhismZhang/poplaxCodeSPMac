#!/bin/sh

#LaoHu SDK static lib builder by poplax

LIB_NAME=WmComPlatform
UNIVERSAL_OUTPUTFOLDER=${BUILD_DIR}/${CONFIGURATION}-all
IPHONE_OS_DIR=${BUILD_DIR}/${CONFIGURATION}-iphoneos
IPHONE_SIMULATOR_DIR=${BUILD_DIR}/${CONFIGURATION}-iphonesimulator

xcodebuild -target ${LIB_NAME} ONLY_ACTIVE_ARCH=NO -configuration ${CONFIGURATION} -sdk iphoneos BUILD_DIR="${BUILD_DIR}" BUILD_ROOT="${BUILD_ROOT}"
xcodebuild -target ${LIB_NAME} -configuration ${CONFIGURATION} -sdk iphonesimulator -arch i386 BUILD_DIR="${BUILD_DIR}" BUILD_ROOT="${BUILD_ROOT}"

mkdir -p "${UNIVERSAL_OUTPUTFOLDER}/${LIB_NAME}"
lipo -create "${IPHONE_SIMULATOR_DIR}/lib${LIB_NAME}.a" "${IPHONE_OS_DIR}/lib${LIB_NAME}.a" -output "${UNIVERSAL_OUTPUTFOLDER}/${LIB_NAME}/${LIB_NAME}.a"
lipo -info "${UNIVERSAL_OUTPUTFOLDER}/${LIB_NAME}.a"

pushd "${IPHONE_OS_DIR}"
mkdir -p "./include/${LIB_NAME}/${LIB_NAME}Info/Share"
find "./include/${LIB_NAME}" -depth 1 -name "*ShareInfo.h"|xargs -I {} mv -f {} "./include/${LIB_NAME}/${LIB_NAME}Info/Share/"
mkdir -p "./include/${LIB_NAME}/WXApi"
find "./include/${LIB_NAME}" -depth 1 -name "*WXApi*h"|xargs -I {} mv -f {} "./include/${LIB_NAME}/WXApi"
popd

cp -Rf "${IPHONE_OS_DIR}/include/${LIB_NAME}" "${UNIVERSAL_OUTPUTFOLDER}/"



