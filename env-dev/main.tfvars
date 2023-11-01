/*component = {
  frontend  = {}
  mongodb   = {}
  catalogue = {}
  redis     = {}
  cart      = {}
  user      = {}
  mysql     = {}
  payment   = {}
  rabbitmq  = {}
  shipping  = {}
}*/

env = "dev"

default_vpc_id = "vpc-093e0600672c5ecc1"
default_vpc_rt = "rtb-0bc1356ac15da6b6c"

allow_ssh_cidr = ["172.31.0.0/16"]

vpc = {
  main = {
    cidr_block = "10.10.0.0/16"
    subnets    = {
      public = { cidr_block = ["10.10.1.0/24", "10.10.2.0/24"] }
      web    = { cidr_block = ["10.10.3.0/24", "10.10.4.0/24"] }
      app    = { cidr_block = ["10.10.5.0/24", "10.10.6.0/24"] }
      db     = { cidr_block = ["10.10.7.0/24", "10.10.8.0/24"] }
    }
  }
}

rabbitmq = {
  main = {
    instance_type = "t3.small"
    component = "rabbitmq"
  }
}

