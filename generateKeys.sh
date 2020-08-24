#!/bin/bash

if which docker > /dev/null
    then
        echo "Docker is installed...Will continue"
    else
        # echo "Please install docker. Then try again"
        # echo "Future release will install docker for you"
        # exit 1

        echo "Installing Docker... One moment please..."
        sudo apt install apt-transport-https ca-certificates curl software-properties-common
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
        sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
        sudo apt update
        apt-cache policy docker-ce
        sudo apt install docker-ce
        sudo systemctl status docker
        echo "Adding user to docker group..."
        sudo usermod -aG docker ${USER}
        echo "Docker setup complete! 💯"
fi

printf "Generating Aura Keys\n"
docker run parity/subkey:2.0.0-rc6 generate --scheme Sr25519

printf "Generating Granpa Keys...\n"
read -p 'Paste Mnemoic: ' mnemonic
docker run parity/subkey:2.0.0-rc6 inspect-key --scheme Sr25519 "$mnemonic"

printf "Now update the aura.json & gran.json files! (under ./keystore)\n"
printf "WIP - this will continue to be automated further. -Matt\n"
