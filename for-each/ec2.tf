#for loop is used for maps
#by using for_each creating 3ec2 instance 

resource "aws_instance" "expense" {
    for_each =var.instance_names                                    #gives 2 vars each.key and each.value
    ami = data.aws_ami.ami_info.id  
    vpc_security_group_ids =["sg-035be4e538db0b944"]               #resource-type and name
    #instance_type = var.instance_names[count.index] == "db" ? "t3.small" : "t3.micro"
    instance_type = each.value

    tags = merge(
        var.common_tags,
        {
            Name = each.key
            Module = each.value
        }
    )
}
