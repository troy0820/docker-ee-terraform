# Deploy environment

To deploy this environment you will need to have a file in your config directory.  You will be in the `platforms/${environment}` directory when deploying this environment.

If you want to use remote state, **YOU must deploy this first**.  If you don't want to use remote state remove the line `backend "s3" {}` from the docker-ee-beta platform.

You will need to be in the directory where the platfom is.  The examples in this deployment guide assumes that you are in `provisioning/platforms/${platform}`

First you choose your workspace
```bash
terraform workspace new ${whatever you want to call it}
```

Verify that you are now in a new `terraform workspace`

```bash
terraform workspace list
```

Then you will need to plan the environment.

```bash
terraform plan -var-file="../../config/${whatever your config file is named}"
```

After there are no errors, you can then apply this environment to AWS.

```bash
terraform apply -var-file="../../config/${whatever your config fle is named}" -auto-approve
```

_auto-approve_ flag will allow you to not have to enter _yes_ when spinning up the platform.
