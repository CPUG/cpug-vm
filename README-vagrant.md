Vagrant use
===========

We use vagrant to ease local development around the tests on the byon installation.

# pre-requisites

## ruby (1.9)

``` sh
sudo aptitude install ruby1.9.3 rubygems
```

## virtualbox (4.1)

``` sh
sudo aptitude virtualbox
```

## vagrant (1.0.5)

Vagrant permits to simply orchestrate the starting and stopping or your vm running with virtualbox.

```sh
sudo gem install vagrant
```

## vagrant-snap (0.10)

Vagrant-snap permits to simply take hot snapshot of your vm.

```sh
sudo gem install vagrant-snap virtualbox
```

**Note**

You need to add the virtualbox gem dependency because of a dependency issue on the [`vagrant/vagrant-snap`)[https://github.com/t9md/vagrant-snap/issues/9]

## ruby1.8/1.9

There are some issues about some ruby scritps that depends on the ruby 1.8.
Installing both ruby1.8 and ruby1.9 creates problems.

A simple workaround is to create a symbolic link `/usr/bin/ruby1.8` on `/usr/bin/ruby`.

```sh
sudo ln -s /usr/bin/ruby1.8 /usr/bin/ruby
```

# install the image

## download

```sh
vagrant box add lucid64 http://files.vagrantup.com/lucid64.box
```

This will download and install locally a fresh image (you can see this as a virtualbox ami)
Now you got all you need.

## boot the vm

Place yourself in your working directory.

```sh
vagrant up
```

## connect to it

```sh
vagrant ssh
```

# halt it

Now that you're good, you can stop the vm.

```sh
vagrant halt
```

# snapshot

The utility of the snapshot must not be under-estimated.
You can see this as git for your code.

This permits rapidly to go back in time and change a failed step by not going over every steps again.

## snapshot

### take

```sh
vagrant snap take vm1 -n $TAG_YOU_WANT -d $DESCRIPTION_YOU_WANT
```

- the description (-d) is optional but recommended.

Example:

```sh
vagrant snap take vm1 -n app-installed-and-ok -d "app-core has been installed via puppet and is ok."
```

### list

This command will list all your snapshots for this vm.

```sh
vagrant snap list
```

Here is a possible output:

``` sh
[vm1]
 puppet-agent-ready [ 15658 days ] puppet-master is ready
[vm2]
 app-core-installed [ 15658 days ] app-core has been installed with the puppet agent
```

### back to the ~~future~~ past

If you do snapshot, you will have eventually to restore your snapshot at some point.
Here is the command.

```sh
vagrant snap go $TAG_YOU_WANT $VM_NAME
```

$VM_NAME is optional.
If you do not give any, all your vms will be wired up to the tag $TAG_YOU_WANT.

For example:

```sh
vagrant snap go "app-installed-ok" vm1
```
