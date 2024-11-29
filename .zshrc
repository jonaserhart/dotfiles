# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

source $ZSH/oh-my-zsh.sh

# User configuration

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

path+=("$HOME/go/bin")
path+=("/usr/local")
export PATH

set -a
[ ! -f ~/.env ] || source ~/.env
set +a

toggle_dotfile_git_repo ()
{
  if [ -d "$HOME/.git" ]; then
    mv "$HOME/.git" "$HOME/.git-dotfiles"
  else
    mv "$HOME/.git-dotfiles" "$HOME/.git"
  fi
}

DISABLE_UNTRACKED_FILES_DITRY="true"
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/jonas.erhart/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

alias k="kubectl"
