# Prerequesites

## Ansible 2.x
**Some features won't work with 1.x, so make sure, that you have the correct version**

Check with
```
ansible --version
```

Install on OSX
```
# via pip
pip install ansible --upgrade

# or via brew
brew install ansible
```

## Boto
Boto is a Python interface to Amazon Web Services used by Ansible EC2 modules.

Install via
```
pip install boto
```

## AWS Credentials

For the ansible ec2 module to work, you need to make your ec2 cedentials available.

Either via environment variables:
```
export AWS_ACCESS_KEY=your-aws-access-key
export AWS_SECRET_KEY=your-aws-secret-key
```

Or by saving the credentials in a file `~/.boto`:
```
[Credentials]
aws_access_key_id = your-aws-access-key
aws_secret_access_key = your-aws-secret-key
```

# Usage

First, execute the script `install-galaxy-roles.sh` which installs necessary ansible roles from ansible galaxy into the `galaxy_roles` folder.

Adapt `create-ec2-playbook.yml` to your needs (keyname, instances), and execute `create-ec2-instances.sh` to create the ec2 instances.

Afterwards execute the following to provision the newly created instances
```
./provision-ec2-instances.sh /path/to/sshkey.pem
```
