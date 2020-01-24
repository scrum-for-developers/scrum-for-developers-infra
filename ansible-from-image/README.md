# Prerequesites

## Ansible 2.2.0.0 
Some features won't work with 1.x, so make sure, that you have the correct version.
Ansible also made API changes in version 2.5 so greater versions won't work as well.

It's probably best to use exactly version **2.2.0.0**.

Check you version with
```
ansible --version
```
Install ansible 2.2.0.0 with:
```
pip install ansible==2.2.0.0
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
Adapt `create-ec2-playbook.yml` to your needs (keyname, instances), and execute `create-ec2-instances.sh` to create the ec2 instances.

Afterwards execute the following to provision the newly created instances
```
./provision-ec2-instances.sh /path/to/sshkey.pem
```

# What is not yet automated?

## Jenkins job configuration

Ansible creates all necessary Jenkins Jobs, but they are not yet configured correct. The following is missing:
* If your git-repository needs authentication, you have to provide the credentials manually.
* The configuration for the job *040-worblehat-acceptance-test* is not complete (e.g. saucelabs-account in ~/.m2/settings.xml is missing).
You can get that information from one of the former trainers (Andreas Houben, Andreas Ebbert-Karoum, Michael Lex, Benedikt Ritter)

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
