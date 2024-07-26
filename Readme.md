# Confluent Selfservice

## Requirements

- docker
- kind 
- make
- helm

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
### Create encrypted password
make generate-secret

# User Interfaces
### Argocd
endpoint: http://localhost:30080/
<br/>
user: admin
<br/>
password: password

### ControlCenter
endpoint: http://localhost:30021
<br/>
user: kafka
<br/>
password: kafka-secret

### Ldap
endpoint: ldap://localhost:30389
<br/>
user dn: cn=admin,dc=test,dc=com
<br/>
base dn: dc=test,dc=com
<br/>
password: confluentrox


### Kafka
endpoint: localhost:30023
<br/>
user: kafka
<br/>
password: kafka-secret
<br/>
command to test: ``` kcat -L -b localhost:30023 -X security.protocol=SASL_PLAINTEXT -X sasl.mechanisms=PLAIN -X sasl.username="kafka" -X sasl.password="kafka-secret" ```

## clear all
make clear

