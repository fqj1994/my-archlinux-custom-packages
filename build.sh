#!/bin/bash
echo "buildbot ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
cd $(dirname $0)
chown buildbot:buildbot -R /pkgs /home/packages /home/buildbot
for i in $(ls); do
    if [[ -d "$i" ]]; then
        echo $i;
        sudo -u buildbot bash -c "cd $i; makepkg -s --noconfirm"
    fi
done
