
# Allow members of group sudo to execute any command
%sudo   ALL=(ALL:ALL) ALL
>>>
user   ALL=(ALL:ALL) NOPASSWD:ALL








brew uninstall node
brew install node --without-npm
echo prefix=~/.npm-packages >> ~/.npmrc
curl -L https://www.npmjs.com/install.sh | sh
Node and npm should be correctly installed at this point. The final step is to add ~/.npm-packages/bin to your PATH so npm and global npm packages are usable. To do this, add the following line to your ~/.bash_profile:

export PATH="$HOME/.npm-packages/bin:$PATH"