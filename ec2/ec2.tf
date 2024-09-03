# resource <resource-type> <resource-name>
resource "aws_instance" "db" {

    ami = "ami-09c813fb71547fc4f"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id] #resource-type and name
    instance_type = "t3.micro"

    tags = {
        Name = "db"
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

    egress {        #outbound
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
