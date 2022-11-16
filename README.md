# dotfiles

### prerequisites

- install `stow`
- checking no folders / files will collide with current counter parts

### installing

run `bash ./stow.sh`

### uninstalling

run `bash ./unstow.sh`

### todo

- install tools script

### updating neovim

```
git checkout tags/v0.8.1 -b v0.8.1-branch

// clean and prepare the repo before build
make distclean
make deps

// check version in the build directory
./build/bin/nvim --version

// build release
make CMAKE_BUILD_TYPE=Release

// install the executable into a location
make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=$HOME/local/nvim install
```

