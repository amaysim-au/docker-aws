#!/bin/bash

# Clear out existing AWS session environment, or the awscli call will fail
unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN AWS_SECURITY_TOKEN
# Old ec2 tools use other env vars
unset AWS_ACCESS_KEY AWS_SECRET_KEY AWS_DELEGATION_TOKEN

DURATION="${ROLE_DURATION:-3600}"
SESSION_NAME="${ROLE_SESSION_NAME:-`hostname -s`}"

# KST=access*K*ey, *S*ecretkey, session*T*oken
KST=(`aws sts assume-role --role-arn "arn:aws:iam::$ACCOUNT_ID:role/$ROLE" \
                          --role-session-name "$SESSION_NAME" \
                          --duration-seconds $DURATION \
                          --query '[Credentials.AccessKeyId,Credentials.SecretAccessKey,Credentials.SessionToken]' \
                          --output text`)

echo "export AWS_ACCESS_KEY_ID='${KST[0]}'"
echo "export AWS_SECRET_ACCESS_KEY='${KST[1]}'"
echo "export AWS_SESSION_TOKEN='${KST[2]}'"
