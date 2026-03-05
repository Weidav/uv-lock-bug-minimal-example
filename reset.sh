#!/bin/bash

# This script resets the example to the initial state before the bug is reproduced in reproduce_bug.sh

cd example-lib/
uv add pydantic==1.10.26

cd ../scripts/
uv lock --script example-script.py --upgrade-package example-lib

cd ../example-app/
uv lock
