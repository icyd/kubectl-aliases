#!/bin/bash

python generate_aliases.py | sed -r 's/(kubectl.*) --watch/watch \1/g' > $XDG_CONFIG_HOME/zsh/kubectl_aliases.zsh

