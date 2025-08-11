# User configuration
[ ! -f ~/.profile.fish ] || source ~/.profile.fish

set -g theme_nerd_fonts yes
set -g theme_color_scheme nord

set -g EDITOR nvim


alias k="kubectl"
alias lsl="ls -l"
alias git-cap="git commit --amend --no-edit && git push -f"

function nvm
  bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm $argv
end

set -x NVM_DIR ~/.nvm
nvm use default --silent

function fish_greeting
	set greetings \
		"󱚟  What do you want!?" \
		"󰚩  I've seen your commit history. We need to talk." \
		"󱚝  [WARN] Could you knock next time?" \
		"󱚣  Are you here to check on some of your bugs?" \
		"󰚩  Other people go outside sometimes, you know?" \
    "󱚣  Ready to judge your variable naming conventions" \
    "󰚩  [INFO] go fmt has opinions about your life choices"

	set chosen_msg (random)"%"(count $greetings)
	set chosen_msg $greetings[(math $chosen_msg"+1")]

	# Output it to the console
  printf (set_color B1A2CA)"-----------------------------------------------------------\n"
	printf "  %s\n" $chosen_msg
  printf "-----------------------------------------------------------\n"
end

# Read functions recursively
set fish_function_path \
    ~/.config/fish/functions/*/ \
    $fish_function_path

starship init fish | source

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/jonas.erhart/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
