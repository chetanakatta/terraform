#preference
#1.command line
#2.tfvars
#3.Environment variable
#4.default values

variable "image_id" {
    type = string    #optional
    default = "ami-09c813fb71547fc4f"   #optional
    description = "RHEL-9 AMI ID"   #optional -->anything
}
variable "instance_type" {
    type = string
    default = "t3.micro"
}
variable "tags" {     #it's a map
    default = {
        Project = "Expense"
        Environment = "Dev"
        Module = "DB"
        Name = "DB"
    }
}

variable "sg_name" {
    default = "allow_ssh"
}
variable "sg_description" {
    default = "allowing port 22"
}

variable "ssh_port" {
    default = 22
}
variable "protocol" {
    default = "tcp"
}
variable "allowed_cidr" {
    type = list(string)
    default = ["0.0.0.0/0"] 
}