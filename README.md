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

## Fresh mac

Use dotty against both configs

```
./dotty/dotty.py initialise.json

./dotty/dotty.py config.json
```

## Updating

In most cases a `git pull` should do the job, if there are new files follow it up by running dotty on the main config again.

```
./dotty/dotty.py config.json
```
