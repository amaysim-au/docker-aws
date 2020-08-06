#!/bin/bash

aws sso login --profile $AWS_SSO_PROFILE
touch /root/.aws/credentials
dnxsso -e -p $AWS_SSO_PROFILE > .env