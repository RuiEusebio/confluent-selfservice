# Confluent Selfservice

## Requirements

- docker
- kind 
- make
- helm

# Create ldap secret
kubectl create secret generic ldap-secret --from-file=ldap.txt --dry-run=client -o yaml

# Create mds secret
kubectl create secret generic mds-token --from-file=mds-publickey.txt --from-file=mds-tokenkeypair.txt --dry-run=client -o yaml