# Confluent Selfservice

## Requirements

- docker
- kind 
- make
- helm

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

# provision local cluster

***The completion of the setup typically requires approximately 10 minutes.***
<hr/>

make setup

# clear all
make clear

# Create ldap secret
kubectl create secret generic ldap-secret --from-file=ldap.txt --dry-run=client -o yaml

# Create mds secret
kubectl create secret generic mds-token --from-file=mdsPublicKey.pem=mds-publickey.txt --from-file=mdsTokenKeyPair.pem=mds-tokenkeypair.txt --dry-run=client -o yaml

# Create mds client
kubectl create secret generic mds-client --from-file=bearer.txt --dry-run=client -o yaml

# Create plain internal secret
kubectl create secret generic credential --from-file=plain.txt --from-file=plain-users.json --dry-run=client -o yaml