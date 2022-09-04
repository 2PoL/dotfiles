#!/bin/zsh

if [[ "$OSTYPE" != "darwin"* ]]; then
  echo "No macOS detected!"
  exit 1
fi

start() {
  clear

  echo "#    ___  _____      _        ______ _   ___      __  #"
  echo "#   |__ \|  __ \    | |      |  ____| \ | \ \    / /  #"
  echo "#      ) | |__) |__ | |      | |__  |  \| |\ \  / /   #"
  echo "#     / /|  ___/ _ \| |      |  __| | . ` | \ \/ /    #"
  echo "#    / /_| |  | (_) | |____  | |____| |\  |  \  /     #"
  echo "#   |____|_|   \___/|______| |______|_| \_|   \/      #"
  echo "#                                                     #"
  echo "#                                                     #"
  echo "        !! ATTENTION !!"
  echo "YOU ARE SETTING UP: 2PoL Environment (macOS)"
  echo "==========================================================="
  echo ""
  echo -n "* The setup will begin in 5 seconds... "

  sleep 5

  echo -n "Times up! Here we start!"
  echo ""

  cd $HOME
}

# xcode command tool will be installed during homebrew installation
install_homebrew() {
  echo "==========================================================="
  echo "                     Install Homebrew                      "
  echo "-----------------------------------------------------------"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
}

install_packages() {
  # Only install required packages for setting up enviroments
  # Later we will call brew bundle
  __pkg_to_be_installed=(
    curl
    fnm
    git
    jq
    wget
    zsh
  )

  echo "==========================================================="
  echo "* Install following packages:"
  echo ""

  for __pkg ($__pkg_to_be_installed); do
    echo "  - ${__pkg}"
  done

  echo "-----------------------------------------------------------"

  brew update

  for __pkg ($__pkg_to_be_installed); do
    brew install ${__pkg} || true
  done
}

clone_repo() {
  echo "-----------------------------------------------------------"
  echo "* Cloning 2PoL/dotfiles Repo from GitHub.com"
  echo "-----------------------------------------------------------"

  git clone https://github.com/2PoL/dotfiles.git

  cd ./dotfiles
  rm -rf .git
}

setup_omz() {
  echo "==========================================================="
  echo "                      Shells Enviroment"
  echo "-----------------------------------------------------------"
  echo "* Installing Oh-My-Zsh..."
  echo "-----------------------------------------------------------"

  curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash

  echo "-----------------------------------------------------------"
  echo "* Installing ZSH Custom Plugins & Themes:"
  echo ""
  echo "  - zsh-autosuggestions"
  echo "  - fast-syntax-highlighting"
  echo "  - zsh-gitcd"
  echo "  - p10k zsh-theme"
  echo "  - zsh-z"
  echo "-----------------------------------------------------------"

  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zdharma/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
  git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-z

  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
}

brew_bundle() {
  brew bundle
}

install_nodejs() {
  echo "==========================================================="
  echo "              Setting up NodeJS Environment"

  eval $(fnm env --shell zsh)
  fnm install --lts

  # Set NPM Global Path
  export NPM_CONFIG_PREFIX="$HOME/.npm-global"
  # Create .npm-global folder if not exists
  [[ ! -d "$NPM_CONFIG_PREFIX" ]] && mkdir -p $NPM_CONFIG_PREFIX

  echo "-----------------------------------------------------------"
  echo "* Installing NodeJS LTS..."
  echo "-----------------------------------------------------------"

  fnm install --lts

  echo "-----------------------------------------------------------"
  echo -n "* NodeJS Version: "

  node -v

  __npm_global_pkgs=(
    @cloudflare/wrangler
    @upimg/cli
    0x
    cf-firewall-rules-generator
    clinic
    hexo-cli
    ipip-cli
    nali-cli@next
    vercel
    npm-why
    pnpm
    npm
    posea
    serve
    surge
    yarn
  )

  echo "-----------------------------------------------------------"
  echo "* npm install global packages:"
  echo ""

  for __npm_pkg ($__npm_global_pkgs); do
    echo "  - ${__npm_pkg}"
  done

  echo "-----------------------------------------------------------"

  for __npm_pkg ($__npm_global_pkgs); do
    npm i -g ${__npm_pkg}
  done
}

zshrc() {
  echo "==========================================================="
  echo "                  Import 2PoL env zshrc                   "
  echo "-----------------------------------------------------------"

  cat $HOME/dotfiles/_zshrc/macos.zshrc > $HOME/.zshrc
  cat $HOME/dotfiles/p10k/.p10k.zsh > $HOME/.p10k.zsh
}

vimrc() {
  echo "==========================================================="
  echo "                  Import 2PoL env vimrc                   "
  echo "-----------------------------------------------------------"

  cat $HOME/dotfiles/vim/.vimrc > $HOME/.vimrc
}

finish() {
  echo "==========================================================="
  echo -n "* Clean up..."

  cd $HOME
  rm -rf $HOME/dotfiles

  echo "Done!"
  echo ""
  echo "> Sukka Enviroment Setup finished!"
  echo "> Do not forget run those things:"
  echo ""
  echo "- chsh -s /usr/bin/zsh"
  echo "- npm login"
  echo "- ci-edit-update"
  echo "- oload-config"
  echo "- git-config"
  echo "* open vim and run :PlugInstall"
  echo "==========================================================="

  cd $HOME
}

start
install_homebrew
install_packages
clone_repo
setup_omz
brew_bundle
install_nodejs
ci_editor
ioio
fix_home_end_keybinding
zshrc
finish
