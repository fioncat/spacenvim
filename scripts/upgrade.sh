#!/bin/bash

set -e

git pull origin
bash ./scripts/apply_snapshot.sh
nvim +PackerCompile
