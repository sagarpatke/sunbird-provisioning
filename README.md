# sunbird-provisioning

This repository provides the necessary scripts to easily provision infrastructure and deploy sunbird on AWS, with Azure backed storage. Just configure AWS Credentials, login to Azure using Azure CLI, set a few configuration parameters and execute the script. This should deploy a sunbird instance, and provide you with details to access sunbird.

> Note: WIP: Due to some issues with sunbird's DevOps scripts, the process is unable to complete. We are working with the Sunbird team to resolve this issue

# Prerequisites
1. Linux / Mac
1. Install [Terraform](https://www.terraform.io/intro/getting-started/install.html), [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html), [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/installing.html), and [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
1. Open config file, and fill in the details for `implementation_name`, `region`, `sunbird_environment` (production, staging or test), and `email`. Do not change the line for `ekstep_jwt_token`.
1. [Generate AWS Access key](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#access-keys-and-secret-access-keys), and configure this for AWS Profile that matches the implementation_name by executing the command: `aws configure --profile <implementation_name>`
1. Login to Azure from Azure CLI 2.0 . Execute the command `az login`, and follow the instructions to complete login from the browser.
1. Generate the EkStep JWT token by following the instructions from [here](http://www.sunbird.org/developer-docs/telemetry/authtokengenerator_jslibrary/#how-to-generate-authorization-credentials) and [here](https://community.ekstep.in/developer-knowledgebase/45-getting-started-with-apis). Set EkStep JWT Token as an environment variable: open `.bashrc`, and add a line `export EKSTEP_JWT_TOKEN=<INSERT-TOKEN-HERE>`. If `sunbird_environment` is production, set EkStep production token, otherwise set QA token.
1. If you'd like to manage a domain with these scripts, first read the section [How to enable Domain Name management for GoDaddy](#godaddy). [Create GoDaddy API Key for Production](https://developer.godaddy.com/keys). Add the API Key and Secret to your environment variables, by adding these lines to `.bashrc`.

```bash
export GODADDY_API_KEY=<insert-key-here>
export GODADDY_API_SECRET=<insert-secret-here>
```

After this, open new terminal and provision.

# Steps to provision and deploy
1. After all Prerequisites are complete, simply execute the `go.sh` script present in `bin` directory. That's it.

> __Do not delete or share any of the generated files.__ If you delete, you will no longer have ssh access to the servers and its data. If you share it with someone, he will have ssh access to the servers created through these scripts. Ideally, check-in all the generated files into a private repository, and share it only with trusted collaborators.

# <a name="godaddy"></a>How to enable Domain Name management for GoDaddy
GoDaddy domain name can be managed using this script. However, enabling this feature has an unintended side effect of removing all other DNS entries, hence __enable it at your own risk. You have been warned.__

You must already have a goDaddy account, and have purchased a domain in question.

1. Open the file `terraform/domain-setup.tf`. Remove the first line (`/*`) and the last line (`*/`), save and close.
1. Open `config`, and add the following line for domain name:
  ```yaml
  domain_name: sunbird.example.com
  ```
1. Execute the following command to install terraform go-daddy provider:
  ```bash
  bash <(curl -s https://raw.githubusercontent.com/n3integration/terraform-godaddy/master/install.sh)
  ```

# Steps to cleanup
1. Execute the script `purge.sh`

# Things to do (Contributions welcome)
- [x] Fix issues with sunbird-devops scripts
- [ ] Use EkStep API Key and Secret, and generate the JWT Token as part of the script
- [x] Support for Custom Domain Name
- [ ] Support https
- [ ] Support for a pure AWS deployment
- [ ] Support for a pure Azure deployment
