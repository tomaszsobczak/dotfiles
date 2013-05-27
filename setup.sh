#!/bin/bash

# symlinks
echo ""
echo "==[ Creating symlinks ]================="

symlinks_src=(
    "env/profile"
    "git/gitconfig"
    "git/gitignore_global"
)

symlinks_dst=(
    ".profile"
    ".gitconfig"
    ".gitignore_global"
)
 
for k in ${!symlinks_src[@]}; do
    if [ -e ~/${symlinks_dst[$k]} ]; then
        echo "[ FAIL ] ~/${symlinks_dst[$k]} => ~/.dotfiles/${symlinks_src[$k]}"
    else
        ln -s ~/.dotfiles/${symlinks_src[$k]} ~/${symlinks_dst[$k]}
        echo "[  OK  ] ~/${symlinks_dst[$k]} => ~/.dotfiles/${symlinks_src[$k]}"
    fi
done

# done
echo "==[ Finished ]=========================="
echo ""
