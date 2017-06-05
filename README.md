# amaysim/aws

Docker image containing AWS CLI, AWS Shell, and some scripts to ease AWS deployments.

## Usage

### Build Locally

If you want to build and use your own local image

```bash
# build image locally
$ make build
# go inside the container
$ make shell
```

### Environment Variables

```
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_DEFAULT_REGION=
AWS_ACCOUNT_ID=

# Cloudformation stack name to be created/updated/deleted
STACK_NAME=
# the cloudformation file path
CFN_FILE=
# the cloudformation params file
CFN_PARAMS_FILE=
```

## Update Docker image

1. Change (or not) `VERSION` in `Makefile`
2. Build and test locally
3. Commit and push the changes
4. Tag the commit with the command `make gitTag`
5. Go to [hub.docker.com](hub.docker.com)
6. In `Build Details` tab, you should now see the new tag kicking off

Docker image
------------

The Docker image has the following:

- Alpine
- [aws-cli](https://github.com/aws/aws-cli)
- [aws-shell](https://github.com/awslabs/aws-shell)
- envsubst: quite useful to create file based on a template using env vars

### Scripts

Some scripts has been written to help deploying to AWS (see example)

Name | Description
---|---
cfn-create-or-update.sh | Create or update a cloudformation
cfn-delete.sh | Delete a cloudformation
cfn-validate-template.sh | Validate a cloudformation template
