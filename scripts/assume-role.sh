#!/bin/bash

# Clear out existing AWS session environment, or the awscli call will fail
unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN AWS_SECURITY_TOKEN
# Old ec2 tools use other env vars
unset AWS_ACCESS_KEY AWS_SECRET_KEY AWS_DELEGATION_TOKEN

DURATION="${AWS_ROLE_DURATION:-3600}"
SESSION_NAME="${AWS_ROLE_SESSION_NAME:-`date +%s`}"
EXPORT="${EXPORT:-no}"


# KST=access*K*ey, *S*ecretkey, session*T*oken
KST=(`aws sts assume-role --role-arn "arn:aws:iam::$AWS_ACCOUNT_ID:role/$AWS_ROLE" \
                          --role-session-name "$SESSION_NAME" \
                          --duration-seconds $DURATION \
                          --query '[Credentials.AccessKeyId,Credentials.SecretAccessKey,Credentials.SessionToken]' \
                          --output text`)

if [ ${#KST[@]} -eq 0 ]; then
  exit 1
fi

if [ "$EXPORT" == "yes" ]; then
  echo ""
  echo "export AWS_ACCESS_KEY_ID=${KST[0]}"
  echo "export AWS_SECRET_ACCESS_KEY=${KST[1]}"
  echo "export AWS_SESSION_TOKEN=${KST[2]}"
else
  echo ""
  echo "AWS_ACCESS_KEY_ID=${KST[0]}"
  echo "AWS_SECRET_ACCESS_KEY=${KST[1]}"
  echo "AWS_SESSION_TOKEN=${KST[2]}"
fi
