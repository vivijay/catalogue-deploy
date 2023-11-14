module "catalogue_instance" {
    source  = "terraform-aws-modules/ec2-instance/aws"
    ami =    data.aws_ami.devops_ami.id 
    instance_type          = "t3.micro"
    vpc_security_group_ids = [data.aws_ssm_parameter.catalogue_sg_id.value]
    # This is optional if we dont give this will be provisioned inside default subnet of default gateway
     subnet_id             = element(split(",",data.aws_ssm_parameter.private_ip.value),0)
 //    user_data = file("catalogue.sh")
    tags = merge(
        {
             Name = "Catalogue-DEV-AMI"
        },
    var.common_tags
    )
    }