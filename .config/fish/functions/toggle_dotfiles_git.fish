function toggle_dotfiles_git
	if test -e $HOME/.git
		mv "$HOME/.git" "$HOME/.git-dotfiles"
	else
		mv "$HOME/.git-dotfiles" "$HOME/.git"
	end
end
