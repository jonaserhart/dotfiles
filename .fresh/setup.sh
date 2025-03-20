echo 'Setting up mac...'

if test ! $(which brew); then
  echo 'Installing homebrew...'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if test ! $(which fish); then
  echo 'Installing fish...'
  brew install fish
  chsh -s $(which fish)
  brew install starship
  # My preferred preset
  starship preset nerd-font-symbols -o ~/.config/starship.toml
fi

if test ! $(which nvim); then
  echo 'Installing nvim...'
  brew install neovim
  nvim --version
  # dependency to nvim
  brew install ripgrep

  touch $HOME/.profile.fish
  echo "set -g -x NVIMENV private" >> $HOME/.profile.fish
  echo "NVIMENV default is 'private', update .profile.fish if needed"
fi

if test ! $(which neovide); then
  echo 'Installing neovim gui...'
  brew install neovide
  neovide --version
fi

if test ! $(which go); then
  brew install go
  go --version
fi

if test ! $(which wezterm); then
  brew install --cask wezterm
  wezterm cli spawn --new-window
fi

# font
brew install --cask font-zed-mono
