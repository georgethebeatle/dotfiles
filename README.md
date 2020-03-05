# Workstation setup

This is an attempt tp automate my workstation setup. It installs required software as well as config for tools like the terminal, vim, tmux, etc

### Install

Clone this repository and run
```
./scripts/install
```

Note: The first time you run this it may complain that stow does not own the dotfiles in your home dir. Stow is conservative so it will never silently override
your current config. If that happend you can decide how to resolve the conflicts - you can manually backup your files or just unlink them if you are using symlinks already

It may take som time on a clean machine. Works best with iterm with a Nerd font set. In order to set the nerd fond got to 
`Iterm Preferences > Profiles -> Text`, check the `Use a different font for non-ASCII text` option and select a nerd font.

### Customize

If you have your own repo that is organized in the GNU Stow package format you can use your own config by running for example:
```
STOW_DIR="~/workspace/my-dotfiles" STOW_PACKAGES="git tmux vim"
```

This will install all software and symlink your own config to the home dir. It assumes that your repo looks something like this:

```
my-dotfiles/
- git
  - .gitconfig
- tmux
  - .tmux.conf
- vim
  - .vimrc
```

If you want to use my config but just override the config of say git and vim you can do the following:
```
CUSTOM_STOW_DIR="~/workspace/my-dotfiles" CUSTOM_STOW_PACKAGES="git vim"
```

This will install all stow packages in this repo first and then it will install the custom ones that you provided. If there are conflicts it will first remove
my package and then install yours. In the above example `git` is a package in both repos and so there will be a conflict, so the `install` script will install `git` from
this repo, uninstall it, and then install `git` from the custom repo.

