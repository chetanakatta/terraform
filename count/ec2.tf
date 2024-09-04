#count loop used for list. by using count creating 3 ec2

resource "aws_instance" "db" {
    count = length(var.instance_name)  #length uses the no in default var to create no of instance
    #count = 3 to create 3 instances
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    tags = {
        Name = var.instance_name[count.index] #count is nothing but loop and count.index --->0,1,2
    }
}
resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
    description = "allowing SSH access"

    #terraform block
    ingress {        #inbound
        from_port        = 22     #22 to 22 means, opening ssh protocol
        to_port          = 22
        protocol         = "tcp"   
        cidr_blocks      = ["0.0.0.0/0"]
    }

    egress {
        from_port        = 0 # from 0 to 0 means, opening all protocols
        to_port          = 0
        protocol         = "-1" # -1 all protocols
        cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow_ssh"
        CreatedBy = "chetana"
    }
}
