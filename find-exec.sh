#!/usr/bin/env bash

### TODO: Rewrite me in python?

#Variables

update_shellrc(){
if [[ -f /bin/bash ]]; then
  echo "
      if
        [ -d $HOME/.local/bin ]; then
        export PATH=$PATH:$HOME/.local/bin
      fi
    " >> /home/'$USER'/.bashrc
fi

if [[ -f /usr/bin/zsh ]]; then
  echo "
      if
        [ -d $HOME/.local/bin ]; then
        export PATH=$PATH:$HOME/.local/bin
      fi
    " >> /home/'$USER'/.zshrc
fi
}

## Make a bin folder if we dont have one

mkdir -p /home/'$USER'/.local/bin
#Run Chunk
read -p "Where did you install pentools?  " runFolder
echo "Finding executable files  in $runFolder"
find $runFolder -type f -executable -name '*.py' -o -name '.rb' -o -name '*.sh' -exec "ln -s '{}' '/home/$USER/.local/bin'"
update_shellrc
