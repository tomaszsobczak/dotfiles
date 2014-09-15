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
        echo "[ FAIL ] Destination file ~/${files_dst[$k]} already exists"
    elif [ -e ~/${files_src[$k]} ]; then
        mv ${files_src[$k]} ~/${files_dst[$k]}
        echo "[  OK  ] Moving ~/${files_src[$k]} => ~/${files_dst[$k]}"
    else
        echo "[ MISS ] Source file ~/${files_src[$k]} not found"
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
        echo "[ FAIL ] Destination ~/${symlinks_dst[$k]} already exists"
    elif [ -e ~/.dotfiles/${symlinks_src[$k]} ]; then
        ln -s ~/.dotfiles/${symlinks_src[$k]} ~/${symlinks_dst[$k]}
        echo "[  OK  ] Linking ~/${symlinks_dst[$k]} => ~/.dotfiles/${symlinks_src[$k]}"
    else
        echo "[ MISS ] Source file ~/${symlinks_src[$k]} not found"
    fi
done

# done
echo "==[ Finished ]=========================="
echo ""
