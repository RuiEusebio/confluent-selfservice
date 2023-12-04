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

## clear all
make clear

