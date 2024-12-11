# User configuration

set -U fish_user_paths /usr/local/bin $fish_user_paths
set -U fish_user_paths "$HOME/go/bin" $fish_user_paths
set -U fish_user_paths "$HOME/.rd/bin" $fish_user_paths
set -U fish_user_paths "/opt/homebrew/bin" $fish_user_paths

[ ! -f ~/.env ] || source ~/.env

set -g theme_nerd_fonts yes
set -g theme_color_scheme nord

set -g EDITORi VIM


alias k="kubectl"
alias lsl="ls -l"
alias git-cap="git commit --amend --no-edit && git push -f"

