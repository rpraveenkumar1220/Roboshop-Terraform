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
vpc={
  main={
    cidr_block = "10.10.0.0/16"
  }
}