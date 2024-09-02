instance_type = "t3.small" #overrides the default values in variable
#we can give file name anything with .tfvars extension but we have to call it by using --->terraform plan -var-file."<filename.tfvars>"
#if we give file name like terraform.tfvars ---> we can call directly --->terraform plan