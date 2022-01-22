# Storage for Linux .dotfiles
 
### Work with the git repository
#### - from the ~/git_directory
##### Create folder .dotfiles move files ex: .bashrc into .dotfiles folder
##### git status
##### git add filenames
##### git commit -m "first upload" filenames
##### git push origin main
##### git branch
#
### Using stow to symlink .dotfiles in $HOME
##### ex: sudo apt install stow
##### - Create a .dotfiles folder in your home directory and a bash folder inside the .dotfiles folder

##### - Move your .dotfiles ex: mv .bashrc ~/.dotfiles/bash/
##### - Anything you don't want symlinked put in the .dotfiles folder ex: README.md
#
### Stow your .dotfiles 
##### From within ~/.dotfiles/bash folder
##### ex: stow --target=/home/username bash
##### The bash folder is the target to stow
#
#### Tested on 
##### NAME="Ubuntu"VERSION="20.04.1 LTS (Focal Fossa)" ID_LIKE=debian

