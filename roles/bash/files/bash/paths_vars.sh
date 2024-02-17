#!/usr/bin/env bash

addToPath /usr/local/go/bin
#addToPath $GOPATH/bin
#addToPath $HOME/go/bin
addToPath $HOME/.dotfiles/bin
#addToPath $HOME/.cargo/bin
addToPathFront $HOME/.local/bin
# Add paths to dotnet tools
addToPath $HOME/.dotnet/tools

export DOTNET_ROOT=$HOME/.dotnet
addToPath $DOTNET_ROOT
addToPath $DOTNET_ROOT/tools
# ccache
#addToPathFront /usr/lib/ccache
