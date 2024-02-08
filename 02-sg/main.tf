module "mongodb" {
    sg_description = "sg for mongodb"
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_name = "mongodb"
    #sg_ingress_rules = var.sg_ingress_rules_mongodb
}
module "catalogue" {
    sg_description = "sg for catalogue"
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_name = "catalogue"
    
}
module "user" {
    sg_description = "sg for user"
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_name = "user"
    
}
resource "aws_security_group_rule" "mongodb_catalogue" {
    source_security_group_id = module.catalogue.sg_id
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  security_group_id = module.mongodb.sg_id
}
resource "aws_security_group_rule" "mongodb_user" {
    source_security_group_id = module.user.sg_id
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  security_group_id = module.mongodb.sg_id
}
module "redis" {
    sg_description = "sg for redis"
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_name = "redis"
    
}
module "mysql" {
    sg_description = "sg for mysql"
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_name = "mysql"
    
}
module "rabbitmq" {
    sg_description = "sg for rabbitmq"
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_name = "rabbitmq"
    
}
module "cart" {
    sg_description = "sg for cart"
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_name = "cart"
    
}
module "shipping" {
    sg_description = "sg for shipping"
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_name = "shipping"
    
}
module "payment" {
    sg_description = "sg for payment"
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_name = "payment"
    
}
module "web" {
    sg_description = "sg for web"
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_name = "web"
    
}
resource "aws_security_group_rule" "redis_user" {
    source_security_group_id = module.user.sg_id
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  security_group_id = module.redis.sg_id
}
resource "aws_security_group_rule" "redis_cart" {
    source_security_group_id = module.cart.sg_id
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  security_group_id = module.redis.sg_id
}
