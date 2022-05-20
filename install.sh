#!/usr/bin/env bash

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo "Running on Linux"
        bash ./install_linux.sh
elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo "Running on Mac OSX"
elif [[ "$OSTYPE" == "cygwin" ]]; then
        # POSIX compatibility layer and Linux environment emulation for Windows
        echo "Running on Cygwin"
elif [[ "$OSTYPE" == "msys" ]]; then
        # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
        echo "Running on Msys (MinGW)"
elif [[ "$OSTYPE" == "win32" ]]; then
        # I'm not sure this can happen.
        echo "Running on Windows"
elif [[ "$OSTYPE" == "freebsd"* ]]; then
        echo "Running on FreeBSD"
else
        echo "Unknown OS, please setup your environement manually"
fi