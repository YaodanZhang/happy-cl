#!/bin/bash

source .profile

cache_file=$script_folder/.openshift.cache

if [ ! -f $cache_file ]
then
  touch $cache_file
fi

source $cache_file

if [ ! -z $openshift_username ]
then
  output=$(oc login --username=$openshift_username "$@" <&-)
else
  false
fi

signed_in_or_not=$?

if [ ! $signed_in_or_not -eq 0 ]
then
  set -e

  openshift_username=$(op get item "$openshift_credential_id" | jq -r '.details.fields | map(select(.name == "username")) | .[0].value')
  echo "export openshift_username=$openshift_username" > $cache_file

  openshift_password=$(op get item "$openshift_credential_id" | jq -r '.details.fields | map(select(.name == "password")) | .[0].value')

  oc login "$@" --username=$openshift_username --password=$openshift_password
else
  echo -e "$output"
fi
