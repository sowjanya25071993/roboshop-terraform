module "mongodb" {
    sg_description = "sg for mongodb"
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_name = "mongodb"
    sg_ingress_rules = var.sg_ingress_rules
}
module "catalogue" {
    sg_description = "sg for catalogue"
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_name = "catalogue"
    sg_ingress_rules = var.sg_ingress_rules
}