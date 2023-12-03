# Confluent Selfservice

## Requirements

- docker
- kind 
- make
- helm

# Create ldap secret
kubectl create secret generic ldap-secret --from-file=ldap.txt --dry-run=client -o yaml

# Create mds secret
kubectl create secret generic mds-token --from-file=mdsPublicKey.pem=mds-publickey.txt --from-file=mdsTokenKeyPair.pem=mds-tokenkeypair.txt --dry-run=client -o yaml

# Create mds client
kubectl create secret generic mds-client --from-file=bearer.txt --dry-run=client -o yaml

# Create plain internal secret
kubectl create secret generic credential --from-file=plain.txt --from-file=plain-users.json --dry-run=client -o yaml