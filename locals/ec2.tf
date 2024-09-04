#locals are same as vars, by using locals creating ec2

resource "aws_instance" "db" {

    ami =  local.ami_id
    vpc_security_group_ids = [local.sg_id]      #we call by using local
    instance_type = local.instance_type
    tags = local.tags
}
