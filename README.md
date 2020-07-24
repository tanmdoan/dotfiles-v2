## dotfiles

Simple environment for working as web developer

### What's included

The environment created here helps with working with these tools/langues:

- zsh/oh-my-zsh
- git
- neovim
- tmux
- Ruby/Rails
- Javascript/React/TS

Other utility tools include:

- [asdf](https://github.com/asdf-vm/asdf) -- manages languages (replaces rvm, nvm)
- [autojump](https://github.com/wting/autojump) -- easily jump to directories
- [fzf](https://github.com/junegunn/fzf) -- fuzzy finder for the terminal

### To Install

- clone the repo anywhere in your system
- run `make`

### Make it your own

Place your dotfiles into a `.local` file and the original dotfile will source your
custom file.

For example:

`.zshrc.local` will be sourced by `zhsrc`
`.tmux.conf.local` will be sourced by `.tmux.conf`

The entry point is the `Makefile` and custom tools can be included via homebrew in
the `Brewfile`

### Things to come

- uninstall script

Inspiration came from ## athal7's dotfiles
