#!/usr/bin/env bash

set -euo pipefail

# Install nvim plugins
nvim --headless +'PlugInstall --sync' +qa
