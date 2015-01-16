# Setup of development evironments for the scrum developer training

## Overview

TODO

## Tasks

### TODO

- Overview ;-)
- Sonar-URLS (sonar.url, sonar.jdbc.url, sonar.jdbc.user, sonar.jdbc.password) zu sonar-jobs hinzufügen
- Add database to mysql
- Modify liquibase job to connect to correct database
- Modify tomcat config: Add worblehat datasource
- Add nginx prox
- Globale Jenkins Maven-Konfiguration
- Url Property im pom.xml

### OPTIONAL

- DistributionManagemen in pom auf server-id setzen, damit in settings.xml auf jenkins-host die korrekte artifactory-ip gesetzt werden kan
- Site publishing via github pages

### DONE

- Add apache (with webdav) for site
- Fix deploy-urls in deploy job (/manager/text/list instead of manager/list)
- Plugins (insbes web-plugin) in sonar installieren
- Tomcat manager user freischalten

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
