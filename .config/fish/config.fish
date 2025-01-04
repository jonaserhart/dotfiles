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

function fish_greeting
	set greetings \
		"What do you want!?" \
		"Welcome to where your dreams come to meet syntax errors" \
		"Another day, another poorly indented piece of code..." \
		"I've seen your commit history. We need to talk." \
		"Could you knock next time?" \
		"Are you here to check on some of your bugs?" \
		"Other people go outside sometimes, you know?" \
    "Ready to judge your variable naming conventions"

	set chosen_msg (random)"%"(count $greetings)
	set chosen_msg $greetings[(math $chosen_msg"+1")]

	# Output it to the console
	printf (set_color F90)"%s\n" $chosen_msg
end
