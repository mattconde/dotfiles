# dotfiles

## install homebrew

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## install python3

```
brew install python3
```

## clone dotfiles

```
git clone --recursive git@github.com:mattconde/dotfiles.git $HOME/projects/dotfiles
```

## fire off the dotfiles

```
cd ./dotfiles
./dotty/dotty.py initialise.json

./dotty/dotty.py config.json
```
