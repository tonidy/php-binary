#!/bin/bash

# Clean up old build and tmp files
rm -rf ./build/* 

# Compile the PHAR
box compile

# Prepare directories
mkdir -p ./build ./tmp

# Move PHAR to build directory
mv index.phar ./build/

# Define micro.sfx path
MICRO_SFX="./tmp/micro.sfx"

# Download and extract only if micro.sfx doesn't exist
if [ ! -f "$MICRO_SFX" ]; then
  cd tmp
  curl -LO https://dl.static-php.dev/static-php-cli/common/php-8.4.5-micro-macos-aarch64.tar.gz
  tar -xvf php-8.4.5-micro-macos-aarch64.tar.gz
  cd ..
fi

# Build the final binary
cat "$MICRO_SFX" ./build/index.phar > ./build/appbin && chmod 0755 ./build/appbin
