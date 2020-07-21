.DEFAULT_GOAL := install

dotfiles = .ackrc \
				.asdfrc \
				.fzf.zsh \
				.gitconfig \
				.hyper.js \
				.prettierrc \
				.tmux \
				.tmux.conf \
				.tool-versions \
				.zshrc

install: symlink packages shell vim languages other

cyan = "\\033[1\;96m"
off  = "\\033[0m"
echo.%:
	@echo "\n$(cyan)Building $*$(off)"

symlink: echo.symlink
	@for file in $(dotfiles); do \
		rm -rf ~/$$file ;\
		ln -s $(shell pwd)/$$file ~/$$file ;\
	done

packages: echo.packages
	brew bundle

shell: echo.shell
	chsh -s /bin/zsh

vim: echo.vim
	mkdir -p ~/.config/nvim ;\
	rm -rf ~/.config/nvim/init.vim ;\
	ln -s $(shell pwd)/.init.vim ~/.config/nvim/init.vim ;\
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	nvim +PlugInstall

languages: echo.languages
	bin/languages

other: echo.other
	defaults write com.apple.screencapture location ~/Downloads;killall SystemUIServer ;\
  defaults write com.apple.finder AppleShowAllFiles TRUE;killall Finder ;\
  npm i -g prettier ;\
	pip3 install --user pynvim

