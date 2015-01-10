# Setup of development evironments for the scrum developer training

## Overview

TODO

## Testing with vargant

TODO: I've not figured out how to pre define SSH ports for vagrant machines, so
maybe you have to adjust the settings in your hosts file.

```shell
cd vagrant
vagrant up
cd ../ansible
cp hosts.sample hosts
ansible-playbook -i hosts --private-key=~/.vagrant.d/insecure_private_key playbook.yml
```

Note: after recreating the vagrant machine, the SSH key may change.
So if you've added the key to your known hosts during ansible provisioning, you
will have to remove the old key from ~/.ssh/known_hosts or the ansible provisioning
will fail.
