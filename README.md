# Docker EE Beta

Terraform scripts to provision Docker EE to AWS

_What is not included with this repo:_

```
- main.tfvars
- terraform state
- Docker EE script sent as user_data
- Subscription license for Docker EE
```

## How do we deploy Docker-EE-Beta

You will need a file called `main.tfvars` store in your config directory.

This file will be used to provision the environment in the "platforms" directory.

To deploy the platform to AWS, check the [documentation](./docs/README.md)


