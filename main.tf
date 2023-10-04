module "app"{
  source = "git::https://github.com/rpraveenkumar1220/App-Module-Terraform.git"
  for_each = var.component
  env = var.env
}



variable "component" {
  default = {
    frontend={}
    mongodb={}
    catalogue={}
    redis={}
    cart={}
    user={}
    mysql={}
    payment={}
    rabbitmq={}
    shipping={}
  }
}