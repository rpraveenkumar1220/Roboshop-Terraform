env = "prod"
component = {
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
}

vpc={
  main={
    cidr_block = [ "10.20.0.0/16"]
  }
}