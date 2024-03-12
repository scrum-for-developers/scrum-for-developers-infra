# Prerequesites

## Ansible 2.x

Latest tested version is 2.10.8.

Check with

```shell
ansible --version
```

Install on OSX

```shell
# via pip
pip3 install ansible --upgrade

# or via brew
brew install ansible
```

## Boto

Boto is a Python interface to Amazon Web Services used by Ansible EC2 modules.

Install via

```shell
pip3 install boto3
```

## AWS Credentials

For the ansible ec2 module to work, you need to make your ec2 cedentials available.

Either via environment variables:

```shell
export AWS_ACCESS_KEY=your-aws-access-key
export AWS_SECRET_KEY=your-aws-secret-key
```

Add a pfile **s4d** in your aws credentials: `~/.aws/credentials`:

```shell
[s4d]
aws_access_key_id = your-aws-access-key
aws_secret_access_key = your-aws-secret-key
```

## Create a AWS SSH Key Pair

1. Go to your AWS Console -> EC2
2. Check your region to be eu-central-1/Frankfurt.
3. Go to Key Pairs.
4. Create a new key pair and assign a name (e.g. "scrumfordevelopers"). This name is references in `create-ec2-playbook.yml`. Save the private key file (e.g. `scrumfordevelopers.pem`). This file is needed later to execute `provision-ec2-instances.sh`.
5. **Change access rights of the private key *.pem to 600**. This is necessary, because otherwise ssh won't work.

# Usage

## Installing Ansible Roles

The needed ansible roles are described in `requirements.yml`. In order to install them, you the command:

```shell
❯ ansible-galaxy install --force -r requirements.yml
```

## Playbook

Adapt `create-ec2-playbook.yml` to your needs (keyname, instances), and execute `create-ec2-instances.sh` to create the ec2 instances.

Afterwards execute the following to provision the newly created instances

```shell
./provision-ec2-instances.sh /path/to/sshkey.pem
```

# What is not yet automated?

## Jenkins job configuration

Ansible creates all necessary Jenkins Jobs, but they are not yet configured correct. The following is missing:
* The git-url in the job *010-worblehat-build* is not set. You have to set it manually.
* If your git-repository needs authentication, you have to provide the credentials manually.
* The configuration for the job *040-worblehat-acceptance-test* is not complete (e.g. saucelabs-account in ~/.m2/settings.xml is missing).

# Defaults

## Passwords
* artifactory: admin / Hell0PSD!
* jenkins: admin / Hell0PSD!
* sonar: admin / Hell0PSD!

## Ports

* Jenkins: 8080
* [Artifactory](https://jfrog.com/help/r/jfrog-installation-setup-documentation/artifactory-network-ports): 8081, 8082
* SonarQube: 9000

## Installation

/var/lib/jenkins
/opt/jfrog/artifactory/var/etc
/usr/local/sonar

## Routings

## Services

* service spring-boot-admin start
* service worblehat-test start
* service worblehat-prod start

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

## Jenkins is not showing copied jobs
Have you tried it with turning off and on again?
Type the following in your browser http://[putYourIpHere]/jenkins/restart and accept the restart with `Yes`
