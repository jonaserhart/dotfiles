#!/usr/bin/env bash
# Dotfiles install script — runs automatically in devcontainers and Codespaces.
# Also safe to run manually on a fresh Linux machine.
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ─── Helpers ─────────────────────────────────────────────────────────────────
info()    { echo "[install] $*"; }
success() { echo "[install] ✓ $*"; }
skip()    { echo "[install] – $* (already installed, skipping)"; }

is_linux() { [[ "$(uname -s)" == "Linux" ]]; }
is_macos() { [[ "$(uname -s)" == "Darwin" ]]; }

has() { command -v "$1" &>/dev/null; }

# ─── Neovim ──────────────────────────────────────────────────────────────────
NVIM_VERSION="v0.11.6"

_glibc_ge_238() {
  local ver
  ver=$(ldd --version 2>&1 | head -1 | grep -oP '\d+\.\d+$' || echo "0.0")
  local major minor
  IFS='.' read -r major minor <<< "$ver"
  [[ "$major" -gt 2 || ( "$major" -eq 2 && "$minor" -ge 38 ) ]]
}

_install_neovim_prebuilt() {
  local arch
  arch=$(uname -m)
  local nvim_arch
  if [[ "$arch" == "x86_64" ]]; then nvim_arch="linux-x86_64"; else nvim_arch="linux-arm64"; fi
  curl -fsSL "https://github.com/neovim/neovim/releases/download/${NVIM_VERSION}/nvim-${nvim_arch}.tar.gz" \
    | sudo tar -C /opt -xz
  sudo ln -sf "/opt/nvim-${nvim_arch}/bin/nvim" /usr/local/bin/nvim
}

_install_neovim_from_source() {
  info "glibc < 2.38 detected — building Neovim from source (this takes a few minutes)..."
  sudo apt-get install -y --no-install-recommends \
    cmake ninja-build gettext lua5.1 build-essential
  git clone https://github.com/neovim/neovim --depth=1 --branch "${NVIM_VERSION}" /tmp/neovim-src
  make -C /tmp/neovim-src CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=/usr/local -j"$(nproc)"
  sudo make -C /tmp/neovim-src CMAKE_INSTALL_PREFIX=/usr/local install
  rm -rf /tmp/neovim-src
}

install_neovim() {
  if has nvim && nvim --version &>/dev/null; then skip "neovim"; return; fi
  info "Installing Neovim ${NVIM_VERSION}..."
  if _glibc_ge_238; then
    _install_neovim_prebuilt
  else
    _install_neovim_from_source
  fi
  success "neovim $(nvim --version | head -1)"
}

# ─── System tools ────────────────────────────────────────────────────────────
install_tools() {
  info "Installing system tools..."
  local pkgs=()
  has rg      || pkgs+=(ripgrep)
  has fd      || pkgs+=(fd-find)
  has git     || pkgs+=(git)
  has curl    || pkgs+=(curl)
  has unzip   || pkgs+=(unzip)
  # ca-certificates is needed for curl to validate TLS connections
  dpkg -s ca-certificates &>/dev/null || pkgs+=(ca-certificates)

  if [[ ${#pkgs[@]} -gt 0 ]]; then
    sudo apt-get update -qq
    sudo apt-get install -y --no-install-recommends "${pkgs[@]}"
    # fd-find installs as 'fdfind', add an alias
    if has fdfind && ! has fd; then
      sudo ln -sf "$(which fdfind)" /usr/local/bin/fd
    fi
    success "system tools: ${pkgs[*]}"
  else
    skip "system tools"
  fi

  # Node.js — needed for bash-language-server and other npm-based tools
  if ! has npm; then
    info "Installing Node.js (LTS)..."
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - 2>/dev/null
    sudo apt-get install -y --no-install-recommends nodejs
    success "node $(node --version) / npm $(npm --version)"
  else
    skip "node/npm"
  fi

  # tree-sitter CLI — required by nvim-treesitter to compile parsers
  # Use the GitHub release binary (v0.22.6, built on Ubuntu 22.04, glibc 2.35-compatible)
  if ! has tree-sitter; then
    local ts_version="0.22.6"
    local arch
    arch=$(uname -m)
    local ts_arch
    if [[ "$arch" == "x86_64" ]]; then ts_arch="x64"; else ts_arch="arm64"; fi
    curl -fsSL "https://github.com/tree-sitter/tree-sitter/releases/download/v${ts_version}/tree-sitter-linux-${ts_arch}.gz" \
      | gunzip | sudo tee /usr/local/bin/tree-sitter > /dev/null
    sudo chmod +x /usr/local/bin/tree-sitter
    success "tree-sitter $(tree-sitter --version)"
  else
    skip "tree-sitter"
  fi
}

# ─── Lazygit ─────────────────────────────────────────────────────────────────
LAZYGIT_VERSION="0.44.1"

install_lazygit() {
  if has lazygit; then skip "lazygit"; return; fi
  info "Installing lazygit ${LAZYGIT_VERSION}..."
  local arch
  arch=$(uname -m)
  local lg_arch
  if [[ "$arch" == "x86_64" ]]; then lg_arch="x86_64"; else lg_arch="arm64"; fi
  curl -fsSL "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_${lg_arch}.tar.gz" \
    | tar -C /tmp -xz lazygit
  sudo mv /tmp/lazygit /usr/local/bin/lazygit
  success "lazygit $(lazygit --version | head -1)"
}

# ─── Symlink dotfiles ─────────────────────────────────────────────────────────
link() {
  local src="$1" dst="$2"
  if [[ -e "$dst" && ! -L "$dst" ]]; then
    info "Backing up existing $dst → ${dst}.bak"
    mv "$dst" "${dst}.bak"
  fi
  mkdir -p "$(dirname "$dst")"
  ln -sfn "$src" "$dst"
  success "linked $dst → $src"
}

link_dotfiles() {
  info "Linking dotfiles..."
  link "${DOTFILES_DIR}/.config/nvim" "${HOME}/.config/nvim"
  [[ -f "${DOTFILES_DIR}/.bashrc" ]]   && link "${DOTFILES_DIR}/.bashrc"   "${HOME}/.bashrc"
  [[ -f "${DOTFILES_DIR}/.inputrc" ]]  && link "${DOTFILES_DIR}/.inputrc"  "${HOME}/.inputrc"
}

# ─── LSP servers ─────────────────────────────────────────────────────────────
LUA_LS_VERSION="3.13.5"
GOLANGCI_LINT_VERSION="v2.1.2"
GOLANGCI_LINT_LS_VERSION="v0.0.2"
HELM_LS_VERSION="v0.0.2"

install_lsp_servers() {
  info "Installing LSP servers..."

  # bash-language-server (always — npm is almost always present in devcontainers)
  if has npm && ! has bash-language-server; then
    sudo npm install -g bash-language-server
    success "bash-language-server"
  else
    has bash-language-server && skip "bash-language-server"
  fi

  # lua-language-server (always — needed to edit this very config)
  if ! has lua-language-server; then
    info "Installing lua-language-server ${LUA_LS_VERSION}..."
    local arch
    arch=$(uname -m)
    local lua_ls_arch
    if [[ "$arch" == "x86_64" ]]; then lua_ls_arch="linux-x64"; else lua_ls_arch="linux-arm64"; fi
    curl -fsSL "https://github.com/LuaLS/lua-language-server/releases/download/${LUA_LS_VERSION}/lua-language-server-${LUA_LS_VERSION}-${lua_ls_arch}.tar.gz" \
      | sudo tar -C /opt/lua-language-server --no-same-owner -xz 2>/dev/null \
      || (sudo mkdir -p /opt/lua-language-server && curl -fsSL "https://github.com/LuaLS/lua-language-server/releases/download/${LUA_LS_VERSION}/lua-language-server-${LUA_LS_VERSION}-${lua_ls_arch}.tar.gz" | sudo tar -C /opt/lua-language-server -xz)
    sudo ln -sf /opt/lua-language-server/bin/lua-language-server /usr/local/bin/lua-language-server
    success "lua-language-server"
  else
    skip "lua-language-server"
  fi

  # Go LSPs — only if Go is present in the container
  if has go; then
    if ! has gopls; then
      info "Installing gopls..."
      go install golang.org/x/tools/gopls@latest
      success "gopls"
    else
      skip "gopls"
    fi

    if ! has golangci-lint; then
      info "Installing golangci-lint ${GOLANGCI_LINT_VERSION}..."
      curl -fsSL https://raw.githubusercontent.com/golangci/golangci-lint/HEAD/install.sh \
        | sh -s -- -b "$(go env GOPATH)/bin" "${GOLANGCI_LINT_VERSION}"
      success "golangci-lint"
    else
      skip "golangci-lint"
    fi

    if ! has golangci-lint-langserver; then
      info "Installing golangci-lint-langserver ${GOLANGCI_LINT_LS_VERSION}..."
      go install github.com/nametake/golangci-lint-langserver@"${GOLANGCI_LINT_LS_VERSION}"
      success "golangci-lint-langserver"
    else
      skip "golangci-lint-langserver"
    fi
  else
    info "Go not found — skipping Go LSPs (gopls, golangci-lint-langserver)"
  fi

  # helm-ls — only if helm is present
  if has helm && ! has helm_ls; then
    info "Installing helm-ls ${HELM_LS_VERSION}..."
    local arch
    arch=$(uname -m)
    local helm_ls_arch
    if [[ "$arch" == "x86_64" ]]; then helm_ls_arch="amd64"; else helm_ls_arch="arm64"; fi
    curl -fsSL "https://github.com/mrjosh/helm-ls/releases/download/${HELM_LS_VERSION}/helm_ls_linux_${helm_ls_arch}" \
      -o /tmp/helm_ls && sudo install -m 0755 /tmp/helm_ls /usr/local/bin/helm_ls
    success "helm_ls"
  else
    has helm || info "helm not found — skipping helm-ls"
    has helm_ls && skip "helm_ls"
  fi

  # rust-analyzer — only if rustup/cargo is present
  if has rustup && ! has rust-analyzer; then
    info "Installing rust-analyzer..."
    rustup component add rust-analyzer
    # rustup installs it as 'rust-analyzer' in the toolchain bin — link to PATH
    local ra_path
    ra_path=$(rustup which rust-analyzer 2>/dev/null || true)
    if [[ -n "$ra_path" ]]; then
      sudo ln -sf "$ra_path" /usr/local/bin/rust-analyzer
    fi
    success "rust-analyzer"
  else
    has rustup || info "rustup not found — skipping rust-analyzer"
    has rust-analyzer && skip "rust-analyzer"
  fi
}

install_homebrew() {
  if has brew; then skip "homebrew"; return; fi
  info 'Installing homebrew...'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  eval "$(/opt/homebrew/bin/brew shellenv)"
}

install_lsp_servers_macos() {
  info "Installing LSP servers via homebrew..."
  if has go; then
    brew install --quiet --no-cache gopls golangci-lint-langserver
    success "gopls, golangci-lint-langserver"
  else
    info "Go not found — skipping Go LSPs (gopls, golangci-lint-langserver)"
  fi

  if has helm; then
    brew install --quiet --no-cache helm-ls
    success "helm-ls"
  else
    info "helm not found — skipping helm-ls"
  fi

  if has rustup; then
    brew install --quiet --no-cache rust-analyzer
    success "rust-analyzer"
  else
    info "rustup not found — skipping rust-analyzer"
  fi

  if has npm; then
    brew install --quiet --no-cache bash-language-server
    success "bash-language-server"
  else
    info "npm not found — skipping bash-language-server"
  fi

  brew install --quiet --no-cache lua-language-server
  success "lua-language-server"
}

install_tools_macos() {
  info "Installing system tools via homebrew..."
  brew install --quiet --no-cache \
    git \
    node \
    tree-sitter-cli \
    lazygit
  success "homebrew packages: git, node, tree-sitter-cli, lazygit"
}

install_neovim_macos() {
  if has nvim && nvim --version &>/dev/null; then skip "neovim"; return; fi
  info "Installing Neovim via homebrew..."
  brew install --quiet --no-cache neovim
  success "neovim $(nvim --version | head -1)"
}

# ─── Bootstrap Neovim plugins ─────────────────────────────────────────────────
bootstrap_nvim() {
  info "Bootstrapping lazy.nvim plugins (headless)..."
  nvim --headless "+Lazy! sync" +qa 2>/dev/null || true
  success "lazy.nvim sync done"
}

# ─── Main ────────────────────────────────────────────────────────────────────
main() {
  if is_linux; then
    install_tools
    install_neovim
    install_lazygit
    install_lsp_servers
  elif is_macos; then
    install_homebrew
    install_tools_macos
    install_lsp_servers_macos
    install_neovim_macos
  else
    info "Unsupported OS: $(uname -s) — skipping system tools installation"
  fi

  link_dotfiles
  bootstrap_nvim

  success "Dotfiles installed. Open a new shell or run: source ~/.bashrc"
}

main "$@"
