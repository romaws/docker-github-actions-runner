# GitHub Self-hosted Runner Docker image

GitHub Self-hosted Runner Docker image based on Debian Buster.

## Variables

| Name           | Default Value | Description                        |
| -------------- | ------------- | -----------------------------------|
| `ACCOUNT` | "" | Github account. For example: mine is "romaws". |
| `REPO` | "" | Github repository. For example: this repo is "docker-github-actions-runner".  |
| `ACCESS_TOKEN` | "" | Generate token with "repo" scope [here](https://github.com/settings/tokens/new). |
| `RUNNER_NAME=` | `$HOSTNAME` | Set the runner name. Container hostname is default name. |

## Examples

```bash
docker run -d \
    -e ACCESS_TOKEN=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx \
    -e ACCOUNT=romaws \
    -e REPO=docker-github-actions-runner \
    romaws/github-actions-runner
```

## Documentation

[Hosting your own runners](https://help.github.com/en/actions/hosting-your-own-runners)
