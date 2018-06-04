# sunbird-provisioning

This repository provides the necessary scripts to easily provision infrastructure and deploy sunbird on AWS, with Azure backed storage. Just configure AWS Credentials, login to Azure using Azure CLI, set a few configuration parameters and execute the script. This should deploy a sunbird instance, and provide you with details to access sunbird.

> Note: WIP: Due to some issues with sunbird's DevOps scripts, the process is unable to complete. We are working with the Sunbird team to resolve this issue

# Prerequisites
1. Install [Terraform](https://www.terraform.io/intro/getting-started/install.html), [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html), [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/installing.html), and [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
1. Open config file, and fill in the details for implementation_name, region, sunbird_environment (production, staging or test), ekStepToken (EkStep JWT Token. If sunbird_environment is production, set EkStep production token, otherwise set QA token)
1. [Generate AWS Access key](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#access-keys-and-secret-access-keys), and configure this for AWS Profile that matches the implementation_name by executing the command: `aws configure --profile <implementation_name>`
1. Login to Azure from Azure CLI 2.0 . Execute the command `az login`, and follow the instructions to complete login from the browser.

# Steps to provision and deploy
1. After all Prerequisites are complete, simply execute the `go.sh` script present in `bin` directory

> Note that, once the execution has started, the current state of the resources created is maintained in the current folder. For this reason, please keep a complete backup of this folder after the provisioning is complete, as it is required for altering and destroying the created resources. We will work on hosted workflow management for sunbird when we find the time, and these srcipts are only the first step in this direction.

# Steps to cleanup
1. Execute the script `purge.sh`

# Things to do (Contributions welcome)
- [ ] Fix issues with sunbird-devops scripts
- [ ] Use EkStep API Key and Secret, and generate the JWT Token as part of the script
- [ ] Support for Custom Domain Name
- [ ] Support https
- [ ] Support for a pure AWS deployment
- [ ] Support for a pure Azure deployment
