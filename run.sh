#!/bin/bash

FILE="$XDG_CONFIG_HOME/zsh/kubectl_aliases.zsh"
python generate_aliases.py | sed -r 's/(kubectl.*) --watch/watch \1/g' > $FILE

cat<<'EOF' >> $FILE

alias -g KN='-oyaml | kubectl neat | yh '
alias -g YN='-oyaml | kubectl neat'
kcx(){ [ $# -ge 1 ] && kubectl ctx $1 || kubectl ctx $(kubectl ctx | fzf --preview={} --preview-window=:hidden)  }
kns(){ [ $# -ge 1 ] && kubectl ns $1 || kubectl ns $(kubectl ns | fzf --preview={} --preview-window=:hidden)  }
EOF
