#!/bin/bash

# symlinks
echo ""
echo "==[ Preparing files ]==================="

files_src=(
    ".profile"
    ".gitconfig"
)

files_dst=(
    ".env_local"
    ".gitconfig_local"
)

for k in ${!files_src[@]}; do
    if [ -e ~/${files_dst[$k]} ]; then
        echo "[ FAIL ] move ~/${files_src[$k]} => ~/${files_dst[$k]}"
    else
        mv ${files_src[$k]} ~/${files_dst[$k]}
        echo "[  OK  ] move ~/${files_src[$k]} => ~/${files_dst[$k]}"
    fi
done

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
        echo "[ FAIL ] link ~/${symlinks_dst[$k]} => ~/.dotfiles/${symlinks_src[$k]}"
    else
        ln -s ~/.dotfiles/${symlinks_src[$k]} ~/${symlinks_dst[$k]}
        echo "[  OK  ] link ~/${symlinks_dst[$k]} => ~/.dotfiles/${symlinks_src[$k]}"
    fi
done

# done
echo "==[ Finished ]=========================="
echo ""
