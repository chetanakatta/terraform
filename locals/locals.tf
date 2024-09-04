locals {
    ami_id = "ami-09c813fb71547fc4f"
    sg_id = "sg-035be4e538db0b944"         #replace with your sg id
    instance_type = var.instace_name == "db" ? "t3.small" : "t3.micro" #we use vars inside locals but can't use vars and locals inside vars
    tags = {
        Name = "locals"
    }
}