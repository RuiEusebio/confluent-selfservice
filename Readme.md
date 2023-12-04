# Confluent Selfservice

## Requirements

- docker
- kind 
- make
- helm

### Create encrypted password
make generate-secret

## provision local cluster

***The completion of the setup typically requires approximately 10 minutes.***
<hr/>
make setup

# Service Account Template

```yaml
name: change-me
quotas: 1mb
password: change-me
owners:
  - one
  - two
enabled: true
```

# User Interfaces
### Argocd
endpoint: http://localhost:30080/
user: admin
password: password

### ControlCenter
endpoint: http://localhost:30021
user: kafka
password: kafka-secret

### Ldap
endpoint: ldap://localhost30389
user dn: cn=admin,dc=test,dc=com
base dn: dc=test,dc=com
password: confluentrox

## clear all
make clear

