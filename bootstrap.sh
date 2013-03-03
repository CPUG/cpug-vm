#!/bin/bash -x

# install the bare necessities
sudo aptitude install -y tmux git emacs24 openjdk-7-jdk

# install leiningen
if [ ! -f ~vagrant/bin/lein ]; then

    su -l vagrant -c "mkdir -p ~vagrant/bin"

    su -l vagrant -c "wget https://raw.github.com/technomancy/leiningen/stable/bin/lein -O ~vagrant/bin/lein"

    su -l vagrant -c "chmod +x ~vagrant/bin/lein"

    su -l vagrant -c "echo 'export PATH=~vagrant/bin:$PATH' | tee -a ~vagrant/.bashrc"

    su -l vagrant -c "cp /vagrant/profiles.clj ~vagrant/.lein/"

    su -l vagrant -c "~/bin/lein version"
fi

# clone emacs-live
if [ ! -d ~vagrant/.emacs.d/.git ]; then

    su -l vagrant -c "rm -rf ~vagrant/.emacs.d"

    su -l vagrant -c "git clone git://github.com/overtone/emacs-live.git ~vagrant/.emacs.d"

    su -l vagrant -c "emacs --version"
fi
