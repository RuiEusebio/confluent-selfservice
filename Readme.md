# Confluent Selfservice

## Requirements

- docker
- kind 
- make
- helm

# Create ldap secret
kubectl create secret generic ldap-secret --from-file=ldap.txt --dry-run=client -o yaml