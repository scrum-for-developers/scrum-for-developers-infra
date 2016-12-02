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

## Create a AWS SSH Key Pair

1. Go to your AWS Console -> EC2 -> Key Pairs.
2. Create a new key pair and assign a name (e.g. "scrumfordevelopers"). This name is references in `create-ec2-playbook.yml`. Save the private key file (e.g. `scrumfordevelopers.pem`). This file is neede later to execute `provision-ec2-instances.sh`.
3. **Change access rights of the private key *.pem to 600**. This is necessary, because otherwise ssh won't work.

# Usage

First, execute the script `install-galaxy-roles.sh` which installs necessary ansible roles from ansible galaxy into the `galaxy_roles` folder.

Adapt `create-ec2-playbook.yml` to your needs (keyname, instances), and execute `create-ec2-instances.sh` to create the ec2 instances.

Afterwards execute the following to provision the newly created instances
```
./provision-ec2-instances.sh /path/to/sshkey.pem
```

# What is not yet automated?

## docker-compose up
Ansible installs docker and clones the scrum-for-developers-infra Repository to `/scrumfordevelopers/infra`. **But it does not start docker-compose!**.

So you have to log in to the created ec2-instances via ssh yourself and start docker-compose:
```
ssh -i /path/to/your/keyfile.pem ubuntu@INSTANCEIP
cd /scrumfordevelopers/infra/docker
docker-compose up &
```

## Jenkins job configuration

Ansible creates all necessary Jenkins Jobs, but they are not yet configured correct. The following is missing:
* The git-url in the job *010-worblehat-build* is not set. You have to set it manually.
* If your git-repository needs authentication, you have to provide the credentials manually.
* The configuration for the job *040-worblehat-acceptance-test* is not complete (e.g. saucelabs-account in ~/.m2/settings.xml is missing).

# Troubleshooting

## SSH connection failed
Make sure, that your private keyfile (`XXX.pem`) has access rights `600`. To change, just execute `chmod 600 XXX.pem`.

## Problem "only amazon vpc security groups may be used with this operation"
If your aws account is too old, then you will get this error.

You can check it your account is too old by going to the EC2 dashboard:
1. Login to AWS
2. Go to EC2
3. Now you should be on the "EC2 Dashboard". On the right side, you can see "Supported platform". If you have "EC2" as supported platform, then your account is too old. It should only say "VPC".

Possible solution: Use different region (e.g eu-central-1).

## Beware of "regions" (invalid amis, ...)
The region is defined in ansible/create-ec2-playbook.yml.
If you want to use another region, you also have to change the ami_id!

## Problem connecting to newly created instances
The [Ansible EC2 Dynamic Inventory](http://docs.ansible.com/ansible/intro_dynamic_inventory.html#example-aws-ec2-external-inventory-script) caches results. Execute `./ec2-dynamic-inventory/ec2.py --refresh-cache` to refresh the cache.
