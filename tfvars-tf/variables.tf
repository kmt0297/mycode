variable "container_name"{
    description = "value of the name of the docker container"
    type = string
    default = "karthik"
}

variable "internal_port"{
    description = "internal port"
    type = number
    default = 80
}

variable "external_port"{
    description = "external port"
    type = number
    default = 2224
}
