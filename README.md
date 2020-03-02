# docker-aws

![Security Scan](https://github.com/DNXLabs/docker-aws/workflows/Security%20Scan/badge.svg)
![Lint](https://github.com/DNXLabs/docker-aws/workflows/Lint/badge.svg)

Docker image containing AWS CLI, AWS Shell, and some scripts to ease AWS deployments.

## Dependencies
- Docker

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

## Author
App managed by DNX Solutions.

## License
Apache 2 Licensed. See LICENSE for full details.