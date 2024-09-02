resource "aws_instance" "db" {

    ami = var.image_id   #var.variable.id --> declaring variable
    instance_type = var.instance_name == "db" ? "t3.small" : "t3.micro" #condition expression
}    

