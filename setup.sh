sudo dnf update

if [ ! -f ~/.ssh/id_ed25519 ]; then
    ssh-keygen -t ed25519 -C "githubklevisimeri"
    echo "SSH key for KlevisImeri github:"
    cat ~/.ssh/id_ed25519.pub
    read -p "Press Enter to continue..."
fi

sudo dnf install -y \
    neovim \
    python3-neovim \
    alacritty \
    git \
    chromium-browser \
    pip \
    age \
    flameshot \
    adb \
    pactl \
    python3

pip install pulsemixer

mkdir -p ~/.config
cd ~/.config/
rm -rf nvim
git clone git@github.com:KlevisImeri/nvim.git
rm -rf alacritty
git clone git@github.com:KlevisImeri/alacritty.git
rm -rf i3
git clone git@github.com:KlevisImeri/i3.git
cd ~

mkdir -p ~/Downloads
cd ~/Downloads
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/FiraCode.zip
unzip FiraCode.zip
mkdir -p ~/.local/share/fonts
mv FiraCodeNerdFont*.ttf ~/.local/share/fonts/
fc-cache -fv
cd ~

mkdir -p ~/Project
cd ~/Project

rm -rf bashrc
git clone git@github.com:KlevisImeri/bashrc.git
cd bashrc
mv .bashrc ~/
mv .git-prompt.sh ~/
mkdir -p ~/.ssh
mv .ssh/config ~/.ssh/
sudo mv audiosource.sh /usr/local/bin/
cd ~

xdg-mime default firefox.desktop application/pdf
xdg-mime default firefox.desktop image/png
xdg-mime default firefox.desktop image/jpeg
xdg-mime default firefox.desktop image/svg+xml

i3-msg restart
source ~/.bashrc
