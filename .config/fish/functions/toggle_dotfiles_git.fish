
function toggle_dotfile_git_repo;
  if [ -d "$HOME/.git" ]; then
    mv "$HOME/.git" "$HOME/.git-dotfiles"
  else
    mv "$HOME/.git-dotfiles" "$HOME/.git"
  end
end

