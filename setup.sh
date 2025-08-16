#### NEOVIM ALACRITTY I3 BASHRC SSH

ssh-keygen -t ed25519 -C "githubklevisimeri"
echo "SSH key for KlevisImeri github:"
cat .ssh/id_ed25519.pub
read -p "Press Enter to continue..."

sudo dnf install -y neovim python3-neovim
sudo dnf install alacritty

cd .config/
git clone git@github.com:KlevisImeri/nvim
git clone git@github.com:KlevisImeri/alacritty.git
rm -r i3
git@github.com:KlevisImeri/i3.git
cd ..

cd Downloads
curl https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/FiraCode.zip
unzip FiraCode.zip
mkdir -p ~/.local/share/fonts
mv FiraCodeNerdFont*.ttf ~/.local/share/fonts/
fc-cache -fv
cd ..

mkdir Project
cd Project
git clone git@github.com:KlevisImeri/bashrc.git
cd bashrc
mv .bashrc ~/
mv .git-prompt.sh ~/
mv .ssh/config ~/.ssh/
cd ..

### OTHER
sudo dnf install chromium-browser pip age
pip install pulsemixer


### FINAL
i3-msg restart
