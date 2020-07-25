.DEFAULT_GOAL := install

dotfiles = .ackrc \
				.asdfrc \
				.fzf.zsh \
				.gitconfig \
				.tmux.conf \
				.tool-versions \
				.zshrc

install: packages shell symlink vim languages other

cyan = "\\033[1\;96m"
off  = "\\033[0m"
echo.%:
	@echo "\n$(cyan)Building $*$(off)"

shell: echo.shell
	bin/shell

packages: echo.packages
	brew bundle

symlink: echo.symlink
	@for file in $(dotfiles); do \
		rm -rf ~/$$file ;\
		ln -s $(shell pwd)/$$file ~/$$file ;\
	done

vim: echo.vim
	mkdir -p ~/.config/nvim ;\
	rm -rf ~/.config/nvim/init.vim ;\
	ln -s $(shell pwd)/.init.vim ~/.config/nvim/init.vim ;\

languages: echo.languages
	bin/languages

other: echo.other
	defaults write com.apple.screencapture location ~/Downloads;killall SystemUIServer ;\
  defaults write com.apple.finder AppleShowAllFiles TRUE;killall Finder ;\
	pip3 install --user pynvim

