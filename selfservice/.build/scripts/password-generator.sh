#!/bin/bash

# Function to generate a random password
generate_password() {
    length=$1

    # Define the character set (excluding special characters)
    charset="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

    # Use /dev/urandom to generate random bytes, and fold to limit the length
    password=$(cat /dev/urandom | LC_ALL=C tr -dc "$charset" | head -c "$length")
    echo "$password"
}

# Check if the user provided a password length as an argument
if [ $# -eq 1 ]; then
    length=$1
    password=$(generate_password "$length")
    echo "\n"
    echo "Generated password: $password"
    echo "\n"
    # @echo '$(enc)' | tr -d '\n' | kubeseal --raw --scope cluster-wide --cert ./.build/certs/pub.crt; echo
    enc_password=$( echo $password | tr -d '\n' | kubeseal --raw --scope cluster-wide --cert ./selfservice/.build/certs/pub.crt; echo)
    echo "Encrypted password: $enc_password"

else
    echo "Usage: $0 <password_length>"
fi
