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
kms_key_arn    = "arn:aws:kms:us-east-1:751367052640:key/a22c937a-e218-4e4a-b545-d6c384ff99fc"
kms_key_id     = "	a22c937a-e218-4e4a-b545-d6c384ff99fc"

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

rds = {
  main = {
    component      = "mysql"
    engine         = "aurora-mysql"
    engine_version = "5.7.mysql_aurora.2.11.3"
    database_name  = "dummy"
    instance_count = 1
    instance_class = "db.t3.small"

  }
}

docdb ={
  main ={
    component      = "docdb"
    engine         = "docdb"
    engine_version = "4.0.0"
    instance_count = 1
    instance_class = "db.t3.medium"
  }
}

elasticache = {
  main = {
    component             = "elasticache"
    engine                = "redis"
    engine_version        = "6.x"
    node_type             = "cache.t3.micro"
    parameter_group_name  = "default.redis6.x.cluster.on"
    num_node_groups       = 1
    replicas_per_node_group= 1
  }
}

