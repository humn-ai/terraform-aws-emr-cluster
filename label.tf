#
# ONLY EDIT THIS FILE IN github.com/cloudposse/terraform-null-label
# All other instances of this file should be a copy of that one
#
#
# Copy this file from https://github.com/cloudposse/terraform-null-label/blob/master/exports/context.tf
# and then place it in your Terraform module to automatically get
# Cloud Posse's standard configuration inputs suitable for passing
# to Cloud Posse modules.
#
# Modules should access the whole context as `module.label.context`
# to get the input variables with nulls for defaults,
# for example `context = module.label.context`,
# and access individual variables as `module.label.<var>`,
# with final values filled in.
#
# For example, when using defaults, `module.label.context.delimiter`
# will be null, and `module.label.delimiter` will be `-` (hyphen).
#

module "label" {
  source = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.25.0"

  enabled             = var.enabled
  namespace           = var.namespace
  environment         = var.environment
  stage               = var.stage
  name                = var.name
  delimiter           = var.delimiter
  attributes          = var.attributes
  tags                = var.tags
  additional_tag_map  = var.additional_tag_map
  label_order         = var.label_order
  regex_replace_chars = var.regex_replace_chars
  id_length_limit     = var.id_length_limit

  context = var.context
}

# Copy contents of cloudposse/terraform-null-label/variables.tf here

variable "context" {
  type = object({
    enabled             = bool
    namespace           = string
    environment         = string
    stage               = string
    name                = string
    delimiter           = string
    attributes          = list(string)
    tags                = map(string)
    additional_tag_map  = map(string)
    regex_replace_chars = string
    label_order         = list(string)
    id_length_limit     = number
  })
  default = {
    enabled             = true
    namespace           = null
    environment         = null
    stage               = null
    name                = null
    delimiter           = null
    attributes          = []
    tags                = {}
    additional_tag_map  = {}
    regex_replace_chars = null
    label_order         = []
    id_length_limit     = null
  }
  description = <<-EOT
    Single object for setting entire context at once.
    See description of individual variables for details.
    Leave string and numeric variables as `null` to use default value.
    Individual variable settings (non-null) override settings in context object,
    except for attributes, tags, and additional_tag_map, which are merged.
  EOT
}

variable "enabled" {
  type        = bool
  default     = null
  description = "Set to false to prevent the module from creating any resources"
}

variable "namespace" {
  type        = string
  default     = null
  description = "Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp'"
}

variable "environment" {
  type        = string
  default     = null
  description = "Environment, e.g. 'uw2', 'us-west-2', OR 'prod', 'staging', 'dev', 'UAT'"
}

variable "stage" {
  type        = string
  default     = null
  description = "Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release'"
}

variable "name" {
  type        = string
  default     = null
  description = "Solution name, e.g. 'app' or 'jenkins'"
}

variable "delimiter" {
  type        = string
  default     = null
  description = <<-EOT
    Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes`.
    Defaults to `-` (hyphen). Set to `""` to use no delimiter at all.
  EOT
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "Additional attributes (e.g. `1`)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit','XYZ')`"
}

variable "additional_tag_map" {
  type        = map(string)
  default     = {}
  description = "Additional tags for appending to tags_as_list_of_maps. Not added to `tags`."
}

variable "label_order" {
  type        = list(string)
  default     = null
  description = <<-EOT
    The naming order of the id output and Name tag.
    Defaults to ["namespace", "environment", "stage", "name", "attributes"].
    You can omit any of the 5 elements, but at least one must be present.
  EOT
}

variable "regex_replace_chars" {
  type        = string
  default     = null
  description = <<-EOT
    Regex to replace chars with empty string in `namespace`, `environment`, `stage` and `name`.
    If not set, `"/[^a-zA-Z0-9-]/"` is used to remove all characters other than hyphens, letters and digits.
  EOT
}

variable "id_length_limit" {
  type        = number
  default     = null
  description = <<-EOT
    Limit `id` to this many characters.
    Set to `0` for unlimited length.
    Set to `null` for default, which is `0`.
    Does not affect `id_full`.
  EOT
}

#### End of copy of cloudposse/terraform-null-label/variables.tf


module "label_emr" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.25.0"
  enabled    = var.enabled
  context    = module.label.context
  attributes = compact(concat(module.label.attributes, tolist(["emr"])))
}

module "label_ec2" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.25.0"
  enabled    = var.enabled
  context    = module.label.context
  attributes = compact(concat(module.label.attributes, tolist(["ec2"])))
}

module "label_ec2_autoscaling" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.25.0"
  enabled    = var.enabled
  context    = module.label.context
  attributes = compact(concat(module.label.attributes, tolist(["ec2", "autoscaling"])))
}

module "label_master" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.25.0"
  enabled    = var.enabled
  context    = module.label.context
  attributes = compact(concat(module.label.attributes, tolist(["master"])))
}

module "label_slave" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.25.0"
  enabled    = var.enabled
  context    = module.label.context
  attributes = compact(concat(module.label.attributes, tolist(["slave"])))
}

module "label_core" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.25.0"
  enabled    = var.enabled
  context    = module.label.context
  attributes = compact(concat(module.label.attributes, tolist(["core"])))
}

module "label_task" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.25.0"
  enabled    = var.enabled && var.create_task_instance_group
  context    = module.label.context
  attributes = compact(concat(module.label.attributes, tolist(["task"])))
}

module "label_master_managed" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.25.0"
  enabled    = var.enabled
  context    = module.label.context
  attributes = compact(concat(module.label.attributes, tolist(["master", "managed"])))
}

module "label_slave_managed" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.25.0"
  enabled    = var.enabled
  context    = module.label.context
  attributes = compact(concat(module.label.attributes, tolist(["slave", "managed"])))
}

module "label_service_managed" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.25.0"
  enabled    = var.enabled
  context    = module.label.context
  attributes = compact(concat(module.label.attributes, tolist(["service", "managed"])))
}


module "label_alb" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.25.0"
  enabled    = var.enabled
  context    = module.label.context
  attributes = compact(concat(module.label.attributes, tolist([var.use_wrong_loadbalancer_name ? "elb" : "alb"])))
}
