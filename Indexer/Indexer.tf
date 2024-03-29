########################
# variables
########################

variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "private_key_path" {}
variable "key_name" { 
 default = "project"
}

#####################
# Providers
#####################

provider "aws" {
 access_key = "${var.aws_access_key}" 
 secret_key = "${var.aws_secret_key}" 
 region = "us-east-1"
}

#####################
# Resources
#####################

resource "aws_instance" "Indexer" {
 ami = "ami-0565af6e282977273"  
 instance_type = "t2.micro" 
 key_name = "${var.key_name}" 
 count = 3
 security_groups = ["cluster"]
tags {
  Name = "${format("Indexer-%1d",count.index+1)}"
  Group = "cluster"
  Type = "Indexer"
 }
}
