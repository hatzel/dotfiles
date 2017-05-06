# Dotfiles
These are my personal dotfiles, to be managed with gnu stow.
I will keep adding to them as time goes by.

To download oh-my-zsh update the submodule:
```
git submodule update --init --recursive
```

# Usage:
To link the dotfiles for one program (say vim) into your directory structure use:
```
stow vim
```
This should be done in `~/dotfiles` otherwise it might not work.
##VIM
When using neovim make sure you also install the python module neovim to get YCM to work.
This is possibly also required for correct power line behavior.
### Setting up YCM
In `~/.config/nvim/plugged/YouCompleteMe` (after installing everything using VimPlug) run the following command:
```
python2 install.py --system-libclang --system-boost --all
```
This takes a while to compile.
