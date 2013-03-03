CPUG-vm
=======

This is a vagrant vm to ease hacking around clojure:
- [lein2](https://github.com/technomancy/leiningen)
- [emacs 24](https://www.gnu.org/software/emacs)
- [emacs-live](https://github.com/overtone/emacs-live)

# Pre-requisites

- a network!
- [git](http://git-scm.com/)
- [vagrant](./README-vagrant.md)

**Note** It's prefered to install rubygems, then install Vagrant from rubygem instead of your package manager: 
```sh
sudo apt-get install rubygems
sudo gem install vagrant
```

# How

``` sh
git clone git@github.com:CPUG/cpug-vm.git

cd cpug-vm

vagrant up
```

# Now

`=M-x start-hacking=`
