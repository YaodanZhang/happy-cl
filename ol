#!/bin/bash

set -e

source .profile

openshift_username=$(op get item "$openshift_credential_id" | jq -r '.details.fields | map(select(.name == "username")) | .[0].value')
openshift_password=$(op get item "$openshift_credential_id" | jq -r '.details.fields | map(select(.name == "password")) | .[0].value')

oc login "$@" --username=$openshift_username --password=$openshift_password
