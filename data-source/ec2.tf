resource "aws_instance" "db" {

    ami = data.aws_ami.ami_info.id
    vpc_security_group_ids = ["sg-035be4e538db0b944"]
    instance_type = "t3.micro"
    tags = {
        Name = "data-source-practice"
    }
}
