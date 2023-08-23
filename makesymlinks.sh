#!/bin/bash

dir=~/dotfiles
cd $dir

# if [[ "$OSTYPE"]] == "darwin"* ]]; then
# fi

echo "rm ~/.config/nvim"
rm ~/.config/nvim

echo "creat symlink to ~/.config/nvim"
ln -s $dir/nvim ~/.config/nvim

echo ""

files="vimrc zshrc tmux.conf tmux.conf.local"

for file in $files; do
    echo "rm $file from ~"
    rm ~/.$file
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
    rm ~/.local/bin/nvim
    ln -s ~/Documents/nvim-linux64/bin/nvim ~/.local/bin/nvim
    echo "creat symlink to ~/.local/bin/nvim"

    rm ~/.local/bin/tree-sitter
    ln -s $dir/bins_lin/tree-sitter ~/.local/bin/tree-sitter
    echo "creat symlink to ~/.local/bin/tree-sitter"

    rm ~/.local/bin/stylua
    ln -s $dir/bins_lin/stylua ~/.local/bin/stylua
    echo "creat symlink to ~/.local/bin/stylua"

    # rm ~/.local/bin/ctags
fi
