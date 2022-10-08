#!/bin/bash
LAST_CAPSULE_CTL_VERSION="v0.0.0"
echo "System: ${OSTYPE} $(uname -m)"

if [ -z "$CAPSULE_CTL_PATH" ]
then
    CAPSULE_CTL_PATH="$HOME/.local/bin"
fi

if [[ $1 = "help" ]]
then
    echo "usage: $0"
    echo "The script will detect the OS & ARCH and use the last version of capsule (${LAST_CAPSULE_CTL_VERSION})"
    echo "You can force the values by setting these environment variables:"
    echo "- CAPSULE_CTL_OS (linux, darwin)"
    echo "- CAPSULE_CTL_ARCH (amd64, arm64)"
    echo "- CAPSULE_CTL_VERSION (default: ${LAST_CAPSULE_CTL_VERSION})"
    echo "- CAPSULE_CTL_PATH (default: ${CAPSULE_CTL_PATH})"
    exit 0
fi

if [ -z "$CAPSULE_CTL_VERSION" ]
then
    CAPSULE_CTL_VERSION=$LAST_CAPSULE_CTL_VERSION
fi

if [ -z "$CAPSULE_CTL_OS" ]
then
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
      CAPSULE_CTL_OS="linux"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
      CAPSULE_CTL_OS="darwin"
    else
      CAPSULE_CTL_OS="linux"
    fi
fi

if [ -z "$CAPSULE_CTL_ARCH" ]
then
    if [[ "$(uname -m)" == "x86_64" ]]; then
      CAPSULE_CTL_ARCH="amd64"
    elif [[ "$(uname -m)" == "arm64" ]]; then
      CAPSULE_CTL_ARCH="arm64"
    elif [[ $(uname -m) == "aarch64" ]]; then
      CAPSULE_CTL_ARCH="arm64"
    else
      CAPSULE_CTL_ARCH="amd64"
    fi
fi

MODULE="caps"

echo "Installing ${MODULE}..."
wget https://github.com/bots-garden/capsule-ctl/releases/download/${CAPSULE_CTL_VERSION}/${MODULE}-${CAPSULE_CTL_VERSION}-${CAPSULE_CTL_OS}-${CAPSULE_CTL_ARCH}.tar.gz
tar -zxf ${MODULE}-${CAPSULE_CTL_VERSION}-${CAPSULE_CTL_OS}-${CAPSULE_CTL_ARCH}.tar.gz --directory ${CAPSULE_CTL_PATH}
rm ${MODULE}-${CAPSULE_CTL_VERSION}-${CAPSULE_CTL_OS}-${CAPSULE_CTL_ARCH}.tar.gz

echo "Capsule[module: ${MODULE}] $(capsule version) is installed 🎉"
