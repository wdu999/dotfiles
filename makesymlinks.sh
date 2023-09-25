#!/bin/bash

dir=~/dotfiles
cd $dir

# if [[ "$OSTYPE"]] == "darwin"* ]]; then
# fi

# if [ -d "~/.config/nvim"]; then
    echo "rm -rf ~/.config/nvim"
    rm -rf ~/.config/nvim
# fi

echo "creat symlink to ~/.config/nvim"
ln -s $dir/nvim ~/.config/nvim

echo ""

# files="bashrc vimrc zshrc tmux.conf tmux.conf.local"
files="bashrc vimrc"

for file in $files; do

    # if [-a "~/.$file"]; then
        echo "rm $file from ~"
        rm ~/.$file
    # fi
    echo "creat symlink to $file"
    ln -s $dir/$file ~/.$file
    echo ""
done

if [[ "$OSTYPE"]] == "linux-gnu"* ]]; then
    echo ""
    echo "-----"
    echo "linux"
    echo "-----"
    echo ""

    # if [ ! -d "~/.local/bin"]; then
        mkdir -p ~/.local/bin
        echo "create folders ~/.local/bin"
    # fi

    # if [ ! -d "~/.local/share/themes"]; then
        mkdir -p ~/.local/share/themes
        echo "create folders ~/.local/share/themes"
    # fi

    # if [ ! -d "~/.local/share/icons"]; then
        mkdir -p ~/.local/share/icons
        echo "create folders ~/.local/share/icons"
    # fi

    # if [ ! -d "~/.local/share/fonts"]; then
        mkdir -p ~/.local/share/fonts
        echo "create folders ~/.local/share/fonts"
    # fi

    # if [ -f "~/.local/bin/nvim"]; then
        rm ~/.local/bin/nvim
    # fi
    ln -s ~/Documents/nvim-linux64/bin/nvim ~/.local/bin/nvim
    echo "creat symlink to ~/.local/bin/nvim"

    # if [ -f "~/.local/bin/tree-sitter"]; then
        rm ~/.local/bin/tree-sitter
    # fi
    ln -s $dir/bins_lin/tree-sitter ~/.local/bin/tree-sitter
    echo "creat symlink to ~/.local/bin/tree-sitter"

    chmod +x ~/.local/bin/tree-sitter

    # if [ -f "~/.local/bin/stylua"]; then
        rm ~/.local/bin/stylua
    # fi
    ln -s $dir/bins_lin/stylua ~/.local/bin/stylua
    echo "creat symlink to ~/.local/bin/stylua"

    chmod +x ~/.local/bin/stylua

    # rm ~/.local/bin/ctags
fi
