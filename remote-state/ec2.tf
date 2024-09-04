#creating s3 bucket and dynamodb

resource "aws_instance" "db" {

    ami = "ami-09c813fb71547fc4f"
    vpc_security_group_ids = ["sg-035be4e538db0b944"] #resource-type and name
    instance_type = "t3.micro"

    tags = {
        Name = "db"
    }
}