#!/bin/bash

# COMMON_BUILD_COMMANDS='-kb sofle/keyhive -km manna-harbour_miryoku -e MIRYOKU_ALPHAS=QWERTY -e MIRYOKU_EXTRA=COLEMAKDH -e MIRYOKU_TAP=QWERTY -e MIRYOKU_NAV=INVERTEDT -e MIRYOKU_CLIPBOARD=WIN -e MIRYOKU_LAYERS=FLIP'
COMMON_BUILD_COMMANDS='-kb sofle/keyhive -km manna-harbour_miryoku -e MIRYOKU_ALPHAS=QWERTY -e MIRYOKU_NAV=VI'
COMPILE="qmk compile $COMMON_BUILD_COMMANDS"
FLASH_LEFT="qmk flash $COMMON_BUILD_COMMANDS -bl dfu-split-left"
FLASH_RIGHT="qmk flash $COMMON_BUILD_COMMANDS -bl avrdude-split-right"

echo "Building sofle."
$COMPILE

if [ -z $1 ] ; then
    echo "Pass 'true' if you are trying to flash"
else
    echo "Flashing left: Plug in and reset LEFT bootloader."
    read
    $FLASH_LEFT
    echo "Flashing right: Plug in and reset RIGHT bootloader."
    read
    $FLASH_RIGHT
fi
