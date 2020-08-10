#!/bin/bash

#  CODEARTIFACT_AUTH_TOKEN

CODEARTIFACT_AUTH_TOKEN=(`aws codeartifact get-authorization-token \
                        --domain $DOMAIN  \
                        --domain-owner $DOMAIN_OWNER \
                        --query authorizationToken \
                        --output text`)                          
if [ "$EXPORT" == "yes" ]; then
  echo "export CODEARTIFACT_AUTH_TOKEN=${CODEARTIFACT_AUTH_TOKEN}"                          
else
  echo "CODEARTIFACT_AUTH_TOKEN=${CODEARTIFACT_AUTH_TOKEN}"                          
fi
