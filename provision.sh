#!/usr/bin/env bash   

# Export variables
export VAGRANT=/home/vagrant
export KANJI=$VAGRANT/kanji

echo "VAGRANT=$VAGRANT"
echo "KANJI=$KANJI"

# Install node & yarn
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install --lts
nvm use --lts
corepack enable
node -v
npm -v
yarn -v

# Setup SSH
eval $(ssh-agent -s)
cat $VAGRANT/.ssh/id_ed25519 | tr -d '\r' | ssh-add -
ssh-keyscan gitlab.com > $VAGRANT/.ssh/known_hosts
chmod 644 $VAGRANT/.ssh/known_hosts
ssh -T git@gitlab.com

# Clone main repository
mkdir -p $KANJI
git clone git@gitlab.com:inverse-team/plateform/main.git $KANJI/main
cd $KANJI/main
make install
make aliases
make env

# Pull docker images
make pull