module "label" {
  source             = "git::https://github.com/Callumccr/tf-mod-label.git?ref=master"
  namespace          = var.namespace
  environment        = var.environment
  name               = var.name
  attributes         = var.attributes
  delimiter          = var.delimiter
  additional_tag_map = {} /* Additional attributes (e.g. 1) */
  label_order        = ["environment", "namespace", "name", "attributes"]
}

module "label_emr" {
  source     = "git::https://github.com/callumccr/tf-mod-label.git?ref=master"
  enabled    = var.enabled
  context    = module.label.context
  attributes = compact(concat(module.label.attributes, list("emr")))
}

module "label_ec2" {
  source     = "git::https://github.com/callumccr/tf-mod-label.git?ref=master"
  enabled    = var.enabled
  context    = module.label.context
  attributes = compact(concat(module.label.attributes, list("ec2")))
}

module "label_ec2_autoscaling" {
  source     = "git::https://github.com/callumccr/tf-mod-label.git?ref=master"
  enabled    = var.enabled
  context    = module.label.context
  attributes = compact(concat(module.label.attributes, list("ec2", "autoscaling")))
}

module "label_master" {
  source     = "git::https://github.com/callumccr/tf-mod-label.git?ref=master"
  enabled    = var.enabled
  context    = module.label.context
  attributes = compact(concat(module.label.attributes, list("master")))
}

module "label_slave" {
  source     = "git::https://github.com/callumccr/tf-mod-label.git?ref=master"
  enabled    = var.enabled
  context    = module.label.context
  attributes = compact(concat(module.label.attributes, list("slave")))
}

module "label_core" {
  source     = "git::https://github.com/callumccr/tf-mod-label.git?ref=master"
  enabled    = var.enabled
  context    = module.label.context
  attributes = compact(concat(module.label.attributes, list("core")))
}

module "label_task" {
  source     = "git::https://github.com/callumccr/tf-mod-label.git?ref=master"
  enabled    = var.enabled && var.create_task_instance_group
  context    = module.label.context
  attributes = compact(concat(module.label.attributes, list("task")))
}

module "label_master_managed" {
  source     = "git::https://github.com/callumccr/tf-mod-label.git?ref=master"
  enabled    = var.enabled
  context    = module.label.context
  attributes = compact(concat(module.label.attributes, list("master", "managed")))
}

module "label_slave_managed" {
  source     = "git::https://github.com/callumccr/tf-mod-label.git?ref=master"
  enabled    = var.enabled
  context    = module.label.context
  attributes = compact(concat(module.label.attributes, list("slave", "managed")))
}

module "label_service_managed" {
  source     = "git::https://github.com/callumccr/tf-mod-label.git?ref=master"
  enabled    = var.enabled
  context    = module.label.context
  attributes = compact(concat(module.label.attributes, list("service", "managed")))
}


module "label_elb" {
  source     = "git::https://github.com/callumccr/tf-mod-label.git?ref=master"
  enabled    = var.enabled
  context    = module.label.context
  attributes = compact(concat(module.label.attributes, list("elb")))
}
