#!/bin/bash
# Add download sources 
sudo apt update

# Install from file list
xargs sudo apt-get -y install < $HOME/.dotfiles/packages/base 


check_and_run() {
    local command_to_check="$1"
    local command_to_run="$2"
    
    if ! command -v "$command_to_check" &> /dev/null; then
        echo "$command_to_check is not installed. Running alternative command..."
        eval "$command_to_run"
        return 0
    else
        echo "$command_to_check is already installed."
        return 1
    fi
}


# Check if the comand exists and run install if not 
check_and_run rustc "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"

check_and_run pyenv "curl https://pyenv.run | bash"

check_and_run kubectl 'curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl'

check_and_run tailscale "curl -fsSL https://tailscale.com/install.sh | sh"
 
check_and_run ollama "curl -fsSL https://ollama.com/install.sh | sh"

install_yazi() {
    rustup update
    git clone https://github.com/sxyazi/yazi.git
    cd yazi
    cargo build --release --locked
    sudo mv target/release/yazi target/release/ya /usr/local/bin/
    cd ..
    rm -rf yazi
}

check_and_run yazi "install_yazi"
