echo "[+] Installing ZSH..."
# Check if apt command exists
function update_apt() {
sudo apt update
sudo apt upgrade
sudo apt install zsh-autosuggestions zsh-syntax-highlighting
}
function update_pacman() {
sudo pacman -Syu
sudo pacman -S zsh zsh-syntax-highlighting zsh-autosuggestions
}
function update_brew() {
    brew update;
    brew upgrade;
    echo "[+] Installing ZSH..."
    brew install zsh;
    brew install zsh-syntax-highlighting
    brew install zsh-autosuggestions
}
if command -v apt &> /dev/null; then
    update_apt
# Check if pacman command exists
elif command -v pacman &> /dev/null; then
    update_pacman
else
    echo "No supported package manager (apt or pacman or brew) found on your system."
fi
echo "[!] Configuring ZSH."
cp -r ./.* ~
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
echo 'source ~/.powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
echo "[!] Changing default shell to zsh."
sudo chsh -s /bin/zsh
chsh -s /bin/zsh
exec zsh
