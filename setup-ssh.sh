#!/bin/bash
# SSH setup 
# - Creates SSH key
# - Tests it

echo "Enter name of ssh key (e.g. Computer123)"
read varkey
mkdir ~/.ssh
cd ~/.ssh

varinput="${varkey}\n\n"
printf ${varinput} | ssh-keygen -t ed25519 -C ${varkey}
sudo apt install xclip
varfile="${varkey}.pub"
xclip -sel clip < ${varfile}

echo Key was copied to your clipboard
echo ""
echo ""
echo "Go to:"
echo "GitLab -> Settings -> SSK Keys -> Add key"
echo "Enter git address to test it (e.g. git@gitlab.ciirc.cvut.cz)"
read address
cd ~/.ssh
ssh -T ${address}
echo "Welcome message should habe been printed on screen"
