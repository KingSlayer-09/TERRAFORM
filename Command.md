terraform init              >> Initilising terraform block
terraform fmt               >> Format sahi krega
terraform validate          >> Structure validate krega


terraform plan                                     >> Planning the strucuture
terraform plan -var-file="prod.tfvars"             >> uploading with vars
terraform plan -out=planfile                       >> Plan ko ek file me save karna (jo apply me use hoga)


terraform apply -auto-approve                      >> Auto approve the plan
terraform apply planfile                           >> Pehle se saved plan file ko apply karo
terraform apply -var-file="file.tfvars"            >> uploading with vars


### variable validations

validation {
    condition     = var.instance_type == "t2.micro" || var.instance_type == "t3.micro"
    error_message = "Instance type must be either 't2.micro' or 't3.micro'."
  }

validation {
    condition     = contains(["t2.micro", "t3.medium", "t3.large"], var.instance_type)
    error_message = "Instance type must be t2.micro, t3.medium, or t3.large"
  }

validation {
    condition     = can(regex("^t[23]\\.", var.instance_type))
    error_message = "Instance type must start with t2. or t3."
  }


### Mergeing variables

tags = merge(local.common_tags, var.additional_tags)