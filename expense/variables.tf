#ec2 variables
variable "instance_names" {
    type = list
    default = ["db","backend","frontend"]
}
variable "image_id" {
    type = string    #optional
    default = "ami-09c813fb71547fc4f"   #optional
    description = "RHEL-9 AMI ID"   #optional -->anything
}
variable "instance_type" {
    type = string
    default = "t3.micro"
}
variable "common_tags" {     
    default = {
        Project = "Expense"
        Environment = "Dev"
        Terraform = "true"
    }
}

#sg variables
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

#r53 variables
variable "zone_id" {
    default = "Z020156726KEQOBA2RA7Q"  #expense.fun hosted zone id
}
variable "domain_name" {
    default = "expense.fun"
}