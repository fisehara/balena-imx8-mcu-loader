#!/usr/bin/env bash

set -euo pipefail

if [ -n "${BALENA_DEVICE_TYPE:-}" ]
then
	echo "BALENA_DEVICE_TYPE is ${BALENA_DEVICE_TYPE}..."
	device_slug="${BALENA_DEVICE_TYPE}"
else
	echo "BALENA_DEVICE_TYPE is unset, skipping module build..."
	exit 0
fi

if [ -n "${BALENA_HOST_OS_VERSION:-}" ]
then
	echo "BALENA_HOST_OS_VERSION is ${BALENA_HOST_OS_VERSION}..."
	os_version="${BALENA_HOST_OS_VERSION##* }.${BALENA_HOST_OS_VARIANT:-prod}"
else
	echo "BALENA_HOST_OS_VERSION is unset, skipping module build..."
	exit 0
fi


# # download kernel sources from balena
# echo "Download balenaOS kernel sources" "https://files.balena-cloud.com/images/${device_slug}/${os_version/+/%2B}/kernel_source.tar.gz"



# # curl -fsSL "https://files.balena-cloud.com/images/coral-dev/2.67.3%2Brev2.prod/kernel_source.tar.gz" \
# # 	| tar xz --strip-components=2 -C ./

# curl -fsSL "https://files.balena-cloud.com/images/${device_slug}/${os_version/+/%2B}/kernel_source.tar.gz" \
# 	| tar xz --strip-components=2 -C ./



# make -C /usr/src/app/build modules_prepare

export KDIR=/usr/src/app/build
#### # Architecture
export ARCH=arm64
#### # Path to the used cross-compiler
export CROSS_COMPILE=
export SOC=IMX8MM

#### # Build the application and kernel module

make --debug=j -C ./m4ctrl

# ls -la /usr/src/app/m4ctrl/kernel
# ls -la /usr/src/app/m4ctrl/user

export ARMGCC_DIR=/usr/src/app/gcc-arm-11.2-2022.02-aarch64-arm-none-eabi

cd /usr/src/app/mcuxpresso_sdk/boards/evkmimx8mq/multicore_examples/rpmsg_lite_str_echo_rtos/armgcc
./build_debug.sh

ls -la ./debug
# make -C /usr/src/app/build --debug=j M="${src}"

# clean up kernel sources
# rm -rf /usr/src/app/build
