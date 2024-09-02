resource "aws_instance" "db" {
    ami = var.image_id   
    count = length(var.instance_names)
    vpc_security_group_ids = [aws_security_group.allow_ssh.id] #resource-type and name
    instance_type = var.instance_names[count.index] == "db" ? "t3.small" : "t3.micro"

    tags = merge(
        var.common_tags,
        {
            Name = var.instance_names[count.index]
            Module = var.instance_names[count.index]
        }
    )
}

resource "aws_security_group" "allow_ssh" {
    name = var.sg_name
    description = var.sg_description

    #terraform block
    ingress {        #inbound
        from_port        = var.ssh_port    #22 to 22 means, opening ssh protocol
        to_port          = var.ssh_port
        protocol         = var.protocol   
        cidr_blocks      = var.allowed_cidr
    }

    egress {
        from_port        = 0 # from 0 to 0 means, opening all protocols
        to_port          = 0
        protocol         = "-1" # -1 all protocols
        cidr_blocks      = var.allowed_cidr
    }

    tags = {
        Name = "allow_ssh"
        CreatedBy = "chetana"
    }
}
