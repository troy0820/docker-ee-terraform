# Deploy environment

To deploy this environment you will need to have a file in your config directory.  You will be in the `platforms/${environment}` directory when deploying this environment.

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
terraform apply -var-file="../../config/${whatever your config fle is named}"
```
