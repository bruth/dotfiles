#!/usr/bin/env bash

set -euo pipefail

# Install nvim plugins.
nvim --headless +'PlugInstall --sync' +qa

# Install tmux plugin manager.
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
