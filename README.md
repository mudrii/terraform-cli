# terraform-cli

[terraform Version](https://releases.hashicorp.com/terraform/)

Alias

```sh
alias terraform='docker run -it --rm -e GOOGLE_CREDENTIALS=/root/.config/gcloud/terraform-admin.json -v ${HOME}:/root -v $(pwd):/app/ -w /app/ mudrii/terraform-cli terraform'
```