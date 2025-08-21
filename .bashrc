export PATH=$PATH:/usr/local/share/dotnet
export PATH="$HOME/go/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1='\[\e[2m\]$?\[\e[0m\] \[\e[2m\]\t\[\e[0m\] \[\e[1m\]\W\[\e[0m\] \[\e[38;5;69m\](\[\e[38;5;69m\]${PS1_CMD1}\[\e[38;5;69m\])\[\e[0m\]   \$ '

export EDITOR="nvim"

export BASH_COMPLETION_COMPAT_DIR="$(brew --prefix)/etc/bash_completion.d"
[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"
