variable "keypair" {
    type = string
    description = "aws keypair"
    default = "Andrew"
}

variable "ami" {
  type = string
  description = "ami id"
  default = "ami-0a995d0560feba0ed"
}

variable "instance_type" {
    type = string
    description = "aws instance type"
    default = "t3.micro"
}