## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.0, < 0.14.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 2.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | ~> 2.0 |
| <a name="requirement_template"></a> [template](#requirement\_template) | ~> 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_dns_master"></a> [dns\_master](#module\_dns\_master) | git::https://github.com/cloudposse/terraform-aws-route53-cluster-hostname.git?ref=tags/0.5.0 |  |
| <a name="module_label"></a> [label](#module\_label) | git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.19.2 |  |
| <a name="module_label_core"></a> [label\_core](#module\_label\_core) | git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.19.2 |  |
| <a name="module_label_ec2"></a> [label\_ec2](#module\_label\_ec2) | git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.19.2 |  |
| <a name="module_label_ec2_autoscaling"></a> [label\_ec2\_autoscaling](#module\_label\_ec2\_autoscaling) | git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.19.2 |  |
| <a name="module_label_elb"></a> [label\_elb](#module\_label\_elb) | git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.19.2 |  |
| <a name="module_label_emr"></a> [label\_emr](#module\_label\_emr) | git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.19.2 |  |
| <a name="module_label_master"></a> [label\_master](#module\_label\_master) | git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.19.2 |  |
| <a name="module_label_master_managed"></a> [label\_master\_managed](#module\_label\_master\_managed) | git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.19.2 |  |
| <a name="module_label_service_managed"></a> [label\_service\_managed](#module\_label\_service\_managed) | git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.19.2 |  |
| <a name="module_label_slave"></a> [label\_slave](#module\_label\_slave) | git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.19.2 |  |
| <a name="module_label_slave_managed"></a> [label\_slave\_managed](#module\_label\_slave\_managed) | git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.19.2 |  |
| <a name="module_label_task"></a> [label\_task](#module\_label\_task) | git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.19.2 |  |

## Resources

| Name | Type |
|------|------|
| [aws_emr_cluster.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/emr_cluster) | resource |
| [aws_emr_instance_group.task](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/emr_instance_group) | resource |
| [aws_iam_instance_profile.ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_policy.additional_ec2_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.ec2_autoscaling](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.emr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.additional_ec2_role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ec2_autoscaling](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.emr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.existing_ec2_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lb.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.http_forward](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.http_redirect](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_lb_target_group_attachment.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment) | resource |
| [aws_route53_record.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_security_group.alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.managed_master](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.managed_service_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.managed_slave](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.master](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.slave](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.alb_egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.alb_http_ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.alb_https_ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.managed_master_egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.managed_service_access_egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.managed_slave_egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.master_egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.master_ingress_alb_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.master_ingress_security_groups](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.master_ingress_ssh_cidr_blocks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.slave_egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.slave_ingress_cidr_blocks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.slave_ingress_security_groups](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_vpc_endpoint.vpc_endpoint_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_iam_policy_document.assume_role_ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.assume_role_emr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_instances.emr_master_instances](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/instances) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_ec2_role_policy_config"></a> [additional\_ec2\_role\_policy\_config](#input\_additional\_ec2\_role\_policy\_config) | (Optional) - A list of policy objects be created and added to the EMR EC2 Role | <pre>list(object({<br>    name        = string<br>    description = string<br>    path        = string<br>    policy      = string<br>  }))</pre> | n/a | yes |
| <a name="input_applications"></a> [applications](#input\_applications) | A list of applications for the cluster. Valid values are: Flink, Ganglia, Hadoop, HBase, HCatalog, Hive, Hue, JupyterHub, Livy, Mahout, MXNet, Oozie, Phoenix, Pig, Presto, Spark, Sqoop, TensorFlow, Tez, Zeppelin, and ZooKeeper (as of EMR 5.25.0). Case insensitive | `list(string)` | n/a | yes |
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | (Required) - The AWS avaialbility zones (e.g. ap-southeast-2a/b/c). Autoloaded from region.tfvars. | `list(string)` | n/a | yes |
| <a name="input_core_instance_group_ebs_size"></a> [core\_instance\_group\_ebs\_size](#input\_core\_instance\_group\_ebs\_size) | Core instances volume size, in gibibytes (GiB) | `number` | n/a | yes |
| <a name="input_core_instance_group_instance_type"></a> [core\_instance\_group\_instance\_type](#input\_core\_instance\_group\_instance\_type) | EC2 instance type for all instances in the Core instance group | `string` | n/a | yes |
| <a name="input_master_instance_group_ebs_size"></a> [master\_instance\_group\_ebs\_size](#input\_master\_instance\_group\_ebs\_size) | Master instances volume size, in gibibytes (GiB) | `number` | n/a | yes |
| <a name="input_master_instance_group_instance_type"></a> [master\_instance\_group\_instance\_type](#input\_master\_instance\_group\_instance\_type) | EC2 instance type for all instances in the Master instance group | `string` | n/a | yes |
| <a name="input_record_name"></a> [record\_name](#input\_record\_name) | (Required) (Required) The name of the record. | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | VPC subnet ID where you want the job flow to launch. Cannot specify the `cc1.4xlarge` instance type for nodes of a job flow launched in a Amazon VPC | `string` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | A list of subnet IDs to associate with ALB | `list(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID to create the cluster in (e.g. `vpc-a22222ee`) | `string` | n/a | yes |
| <a name="input_additional_info"></a> [additional\_info](#input\_additional\_info) | A JSON string for selecting additional features such as adding proxy information. Note: Currently there is no API to retrieve the value of this argument after EMR cluster creation from provider, therefore Terraform cannot detect drift from the actual EMR cluster if its value is changed outside Terraform | `string` | `null` | no |
| <a name="input_additional_tag_map"></a> [additional\_tag\_map](#input\_additional\_tag\_map) | Additional tags for appending to tags\_as\_list\_of\_maps. Not added to `tags`. | `map(string)` | `{}` | no |
| <a name="input_alb_access_logs_s3_bucket_force_destroy"></a> [alb\_access\_logs\_s3\_bucket\_force\_destroy](#input\_alb\_access\_logs\_s3\_bucket\_force\_destroy) | A boolean that indicates all objects should be deleted from the ALB access logs S3 bucket so that the bucket can be destroyed without error | `bool` | `false` | no |
| <a name="input_alb_allowed_cidr_blocks"></a> [alb\_allowed\_cidr\_blocks](#input\_alb\_allowed\_cidr\_blocks) | List of CIDR blocks to be allowed to access the master instances | `list(string)` | `[]` | no |
| <a name="input_allow_all_access"></a> [allow\_all\_access](#input\_allow\_all\_access) | Set to false to prevent from opening all ports for access to the EMR cluster from allowed CIDR ranges | `bool` | `false` | no |
| <a name="input_allow_http_access"></a> [allow\_http\_access](#input\_allow\_http\_access) | Set to false to prevent from opening HTTPS access to the EMR cluster via the ELB | `bool` | `false` | no |
| <a name="input_allow_https_access"></a> [allow\_https\_access](#input\_allow\_https\_access) | Set to false to prevent from opening HTTPS access to the EMR cluster via the ELB | `bool` | `false` | no |
| <a name="input_allow_ssh_access"></a> [allow\_ssh\_access](#input\_allow\_ssh\_access) | Set to false to prevent from opening SSH access to the EMR cluster from allowed CIDR ranges | `bool` | `false` | no |
| <a name="input_attributes"></a> [attributes](#input\_attributes) | Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | The AWS account id of the provider being deployed to (e.g. 12345678). Autoloaded from account.tfvars | `string` | `""` | no |
| <a name="input_aws_assume_role_arn"></a> [aws\_assume\_role\_arn](#input\_aws\_assume\_role\_arn) | (Optional) - ARN of the IAM role when optionally connecting to AWS via assumed role. Autoloaded from account.tfvars. | `string` | `""` | no |
| <a name="input_aws_assume_role_external_id"></a> [aws\_assume\_role\_external\_id](#input\_aws\_assume\_role\_external\_id) | (Optional) - The external ID to use when making the AssumeRole call. | `string` | `""` | no |
| <a name="input_aws_assume_role_session_name"></a> [aws\_assume\_role\_session\_name](#input\_aws\_assume\_role\_session\_name) | (Optional) - The session name to use when making the AssumeRole call. | `string` | `""` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region (e.g. ap-southeast-2). Autoloaded from region.tfvars. | `string` | `""` | no |
| <a name="input_bootstrap_action"></a> [bootstrap\_action](#input\_bootstrap\_action) | List of bootstrap actions that will be run before Hadoop is started on the cluster nodes | <pre>list(object({<br>    path = string<br>    name = string<br>    args = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_certificate_arn"></a> [certificate\_arn](#input\_certificate\_arn) | The ARN of the default SSL certificate for HTTPS listener | `string` | `""` | no |
| <a name="input_configurations_json"></a> [configurations\_json](#input\_configurations\_json) | A JSON string for supplying list of configurations for the EMR cluster. See https://docs.aws.amazon.com/emr/latest/ReleaseGuide/emr-configure-apps.html for more details | `string` | `""` | no |
| <a name="input_context"></a> [context](#input\_context) | Single object for setting entire context at once.<br>See description of individual variables for details.<br>Leave string and numeric variables as `null` to use default value.<br>Individual variable settings (non-null) override settings in context object,<br>except for attributes, tags, and additional\_tag\_map, which are merged. | <pre>object({<br>    enabled             = bool<br>    namespace           = string<br>    environment         = string<br>    stage               = string<br>    name                = string<br>    delimiter           = string<br>    attributes          = list(string)<br>    tags                = map(string)<br>    additional_tag_map  = map(string)<br>    regex_replace_chars = string<br>    label_order         = list(string)<br>    id_length_limit     = number<br>  })</pre> | <pre>{<br>  "additional_tag_map": {},<br>  "attributes": [],<br>  "delimiter": null,<br>  "enabled": true,<br>  "environment": null,<br>  "id_length_limit": null,<br>  "label_order": [],<br>  "name": null,<br>  "namespace": null,<br>  "regex_replace_chars": null,<br>  "stage": null,<br>  "tags": {}<br>}</pre> | no |
| <a name="input_core_instance_group_autoscaling_policy"></a> [core\_instance\_group\_autoscaling\_policy](#input\_core\_instance\_group\_autoscaling\_policy) | String containing the EMR Auto Scaling Policy JSON for the Core instance group | `string` | `null` | no |
| <a name="input_core_instance_group_bid_price"></a> [core\_instance\_group\_bid\_price](#input\_core\_instance\_group\_bid\_price) | Bid price for each EC2 instance in the Core instance group, expressed in USD. By setting this attribute, the instance group is being declared as a Spot Instance, and will implicitly create a Spot request. Leave this blank to use On-Demand Instances | `string` | `null` | no |
| <a name="input_core_instance_group_ebs_iops"></a> [core\_instance\_group\_ebs\_iops](#input\_core\_instance\_group\_ebs\_iops) | The number of I/O operations per second (IOPS) that the Core volume supports | `number` | `null` | no |
| <a name="input_core_instance_group_ebs_type"></a> [core\_instance\_group\_ebs\_type](#input\_core\_instance\_group\_ebs\_type) | Core instances volume type. Valid options are `gp2`, `io1`, `standard` and `st1` | `string` | `"gp2"` | no |
| <a name="input_core_instance_group_ebs_volumes_per_instance"></a> [core\_instance\_group\_ebs\_volumes\_per\_instance](#input\_core\_instance\_group\_ebs\_volumes\_per\_instance) | The number of EBS volumes with this configuration to attach to each EC2 instance in the Core instance group | `number` | `1` | no |
| <a name="input_core_instance_group_instance_count"></a> [core\_instance\_group\_instance\_count](#input\_core\_instance\_group\_instance\_count) | Target number of instances for the Core instance group. Must be at least 1 | `number` | `1` | no |
| <a name="input_create_task_instance_group"></a> [create\_task\_instance\_group](#input\_create\_task\_instance\_group) | Whether to create an instance group for Task nodes. For more info: https://www.terraform.io/docs/providers/aws/r/emr_instance_group.html, https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-master-core-task-nodes.html | `bool` | `false` | no |
| <a name="input_create_vpc_endpoint_s3"></a> [create\_vpc\_endpoint\_s3](#input\_create\_vpc\_endpoint\_s3) | Set to false to prevent the module from creating VPC S3 Endpoint | `bool` | `true` | no |
| <a name="input_cross_zone_load_balancing_enabled"></a> [cross\_zone\_load\_balancing\_enabled](#input\_cross\_zone\_load\_balancing\_enabled) | A boolean flag to enable/disable cross zone load balancing | `bool` | `true` | no |
| <a name="input_custom_ami_id"></a> [custom\_ami\_id](#input\_custom\_ami\_id) | A custom Amazon Linux AMI for the cluster (instead of an EMR-owned AMI). Available in Amazon EMR version 5.7.0 and later | `string` | `null` | no |
| <a name="input_deletion_protection_enabled"></a> [deletion\_protection\_enabled](#input\_deletion\_protection\_enabled) | A boolean flag to enable/disable deletion protection for ALB | `bool` | `false` | no |
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes`.<br>Defaults to `-` (hyphen). Set to `""` to use no delimiter at all. | `string` | `null` | no |
| <a name="input_deregistration_delay"></a> [deregistration\_delay](#input\_deregistration\_delay) | The amount of time to wait in seconds before changing the state of a deregistering target to unused | `number` | `15` | no |
| <a name="input_ebs_root_volume_size"></a> [ebs\_root\_volume\_size](#input\_ebs\_root\_volume\_size) | Size in GiB of the EBS root device volume of the Linux AMI that is used for each EC2 instance. Available in Amazon EMR version 4.x and later | `number` | `10` | no |
| <a name="input_enable_glacier_transition"></a> [enable\_glacier\_transition](#input\_enable\_glacier\_transition) | Enables the transition of lb logs to AWS Glacier | `bool` | `true` | no |
| <a name="input_enable_route53_record"></a> [enable\_route53\_record](#input\_enable\_route53\_record) | Set to true to create a simple A record for route53 to route traffic to the ALB alias | `bool` | `false` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources | `bool` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment, e.g. 'uw2', 'us-west-2', OR 'prod', 'staging', 'dev', 'UAT' | `string` | `null` | no |
| <a name="input_existing_policy_arns"></a> [existing\_policy\_arns](#input\_existing\_policy\_arns) | (Optional) - A list of existing policy ARNs to associate with the role | `list(string)` | `[]` | no |
| <a name="input_expiration_days"></a> [expiration\_days](#input\_expiration\_days) | Number of days after which to expunge s3 logs | `number` | `90` | no |
| <a name="input_glacier_transition_days"></a> [glacier\_transition\_days](#input\_glacier\_transition\_days) | Number of days after which to move s3 logs to the glacier storage tier | `number` | `60` | no |
| <a name="input_health_check_healthy_threshold"></a> [health\_check\_healthy\_threshold](#input\_health\_check\_healthy\_threshold) | The number of consecutive health checks successes required before considering an unhealthy target healthy | `number` | `2` | no |
| <a name="input_health_check_interval"></a> [health\_check\_interval](#input\_health\_check\_interval) | The duration in seconds in between health checks | `number` | `15` | no |
| <a name="input_health_check_matcher"></a> [health\_check\_matcher](#input\_health\_check\_matcher) | The HTTP response codes to indicate a healthy check | `string` | `"200-399"` | no |
| <a name="input_health_check_path"></a> [health\_check\_path](#input\_health\_check\_path) | The destination for the health check request | `string` | `"/"` | no |
| <a name="input_health_check_timeout"></a> [health\_check\_timeout](#input\_health\_check\_timeout) | The amount of time to wait in seconds before failing a health check request | `number` | `10` | no |
| <a name="input_health_check_unhealthy_threshold"></a> [health\_check\_unhealthy\_threshold](#input\_health\_check\_unhealthy\_threshold) | The number of consecutive health check failures required before considering the target unhealthy | `number` | `2` | no |
| <a name="input_http2_enabled"></a> [http2\_enabled](#input\_http2\_enabled) | A boolean flag to enable/disable HTTP/2 | `bool` | `true` | no |
| <a name="input_http_ingress_prefix_list_ids"></a> [http\_ingress\_prefix\_list\_ids](#input\_http\_ingress\_prefix\_list\_ids) | List of prefix list IDs for allowing access to HTTP ingress security group | `list(string)` | `[]` | no |
| <a name="input_http_port"></a> [http\_port](#input\_http\_port) | The port for the HTTP listener | `number` | `80` | no |
| <a name="input_http_redirect"></a> [http\_redirect](#input\_http\_redirect) | A boolean flag to enable/disable HTTP redirect to HTTPS | `bool` | `false` | no |
| <a name="input_https_ingress_prefix_list_ids"></a> [https\_ingress\_prefix\_list\_ids](#input\_https\_ingress\_prefix\_list\_ids) | List of prefix list IDs for allowing access to HTTPS ingress security group | `list(string)` | `[]` | no |
| <a name="input_https_port"></a> [https\_port](#input\_https\_port) | The port for the HTTPS listener | `number` | `443` | no |
| <a name="input_https_ssl_policy"></a> [https\_ssl\_policy](#input\_https\_ssl\_policy) | The name of the SSL Policy for the listener | `string` | `"ELBSecurityPolicy-2015-05"` | no |
| <a name="input_id_length_limit"></a> [id\_length\_limit](#input\_id\_length\_limit) | Limit `id` to this many characters.<br>Set to `0` for unlimited length.<br>Set to `null` for default, which is `0`.<br>Does not affect `id_full`. | `number` | `null` | no |
| <a name="input_idle_timeout"></a> [idle\_timeout](#input\_idle\_timeout) | The time in seconds that the connection is allowed to be idle | `number` | `60` | no |
| <a name="input_internal"></a> [internal](#input\_internal) | A boolean flag to determine whether the ALB should be internal | `bool` | `false` | no |
| <a name="input_ip_address_type"></a> [ip\_address\_type](#input\_ip\_address\_type) | The type of IP addresses used by the subnets for your load balancer. The possible values are `ipv4` and `dualstack`. | `string` | `"ipv4"` | no |
| <a name="input_keep_job_flow_alive_when_no_steps"></a> [keep\_job\_flow\_alive\_when\_no\_steps](#input\_keep\_job\_flow\_alive\_when\_no\_steps) | Switch on/off run cluster with no steps or when all steps are complete | `bool` | `true` | no |
| <a name="input_kerberos_ad_domain_join_password"></a> [kerberos\_ad\_domain\_join\_password](#input\_kerberos\_ad\_domain\_join\_password) | The Active Directory password for ad\_domain\_join\_user. Terraform cannot perform drift detection of this configuration. | `string` | `null` | no |
| <a name="input_kerberos_ad_domain_join_user"></a> [kerberos\_ad\_domain\_join\_user](#input\_kerberos\_ad\_domain\_join\_user) | Required only when establishing a cross-realm trust with an Active Directory domain. A user with sufficient privileges to join resources to the domain. Terraform cannot perform drift detection of this configuration. | `string` | `null` | no |
| <a name="input_kerberos_cross_realm_trust_principal_password"></a> [kerberos\_cross\_realm\_trust\_principal\_password](#input\_kerberos\_cross\_realm\_trust\_principal\_password) | Required only when establishing a cross-realm trust with a KDC in a different realm. The cross-realm principal password, which must be identical across realms. Terraform cannot perform drift detection of this configuration. | `string` | `null` | no |
| <a name="input_kerberos_enabled"></a> [kerberos\_enabled](#input\_kerberos\_enabled) | Set to true if EMR cluster will use kerberos\_attributes | `bool` | `false` | no |
| <a name="input_kerberos_kdc_admin_password"></a> [kerberos\_kdc\_admin\_password](#input\_kerberos\_kdc\_admin\_password) | The password used within the cluster for the kadmin service on the cluster-dedicated KDC, which maintains Kerberos principals, password policies, and keytabs for the cluster. Terraform cannot perform drift detection of this configuration. | `string` | `null` | no |
| <a name="input_kerberos_realm"></a> [kerberos\_realm](#input\_kerberos\_realm) | The name of the Kerberos realm to which all nodes in a cluster belong. For example, EC2.INTERNAL | `string` | `"EC2.INTERNAL"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | Amazon EC2 key pair that can be used to ssh to the master node as the user called `hadoop` | `string` | `null` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | The naming order of the id output and Name tag.<br>Defaults to ["namespace", "environment", "stage", "name", "attributes"].<br>You can omit any of the 5 elements, but at least one must be present. | `list(string)` | `null` | no |
| <a name="input_lifecycle_rule_enabled"></a> [lifecycle\_rule\_enabled](#input\_lifecycle\_rule\_enabled) | A boolean that indicates whether the s3 log bucket lifecycle rule should be enabled. | `bool` | `false` | no |
| <a name="input_load_balancer_type"></a> [load\_balancer\_type](#input\_load\_balancer\_type) | (Optional) The type of load balancer to create. Possible values are application or network. The default value is network. | `string` | `"application"` | no |
| <a name="input_log_uri"></a> [log\_uri](#input\_log\_uri) | The path to the Amazon S3 location where logs for this cluster are stored | `string` | `null` | no |
| <a name="input_master_allowed_cidr_blocks"></a> [master\_allowed\_cidr\_blocks](#input\_master\_allowed\_cidr\_blocks) | List of CIDR blocks to be allowed to access the master instances | `list(string)` | `[]` | no |
| <a name="input_master_allowed_security_groups"></a> [master\_allowed\_security\_groups](#input\_master\_allowed\_security\_groups) | List of security groups to be allowed to connect to the master instances | `list(string)` | `[]` | no |
| <a name="input_master_dns_name"></a> [master\_dns\_name](#input\_master\_dns\_name) | Name of the cluster CNAME record to create in the parent DNS zone specified by `zone_id`. If left empty, the name will be auto-asigned using the format `emr-master-var.name` | `string` | `null` | no |
| <a name="input_master_instance_group_bid_price"></a> [master\_instance\_group\_bid\_price](#input\_master\_instance\_group\_bid\_price) | Bid price for each EC2 instance in the Master instance group, expressed in USD. By setting this attribute, the instance group is being declared as a Spot Instance, and will implicitly create a Spot request. Leave this blank to use On-Demand Instances | `string` | `null` | no |
| <a name="input_master_instance_group_ebs_iops"></a> [master\_instance\_group\_ebs\_iops](#input\_master\_instance\_group\_ebs\_iops) | The number of I/O operations per second (IOPS) that the Master volume supports | `number` | `null` | no |
| <a name="input_master_instance_group_ebs_type"></a> [master\_instance\_group\_ebs\_type](#input\_master\_instance\_group\_ebs\_type) | Master instances volume type. Valid options are `gp2`, `io1`, `standard` and `st1` | `string` | `"gp2"` | no |
| <a name="input_master_instance_group_ebs_volumes_per_instance"></a> [master\_instance\_group\_ebs\_volumes\_per\_instance](#input\_master\_instance\_group\_ebs\_volumes\_per\_instance) | The number of EBS volumes with this configuration to attach to each EC2 instance in the Master instance group | `number` | `1` | no |
| <a name="input_master_instance_group_instance_count"></a> [master\_instance\_group\_instance\_count](#input\_master\_instance\_group\_instance\_count) | Target number of instances for the Master instance group. Must be at least 1 | `number` | `1` | no |
| <a name="input_name"></a> [name](#input\_name) | Solution name, e.g. 'app' or 'jenkins' | `string` | `null` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp' | `string` | `null` | no |
| <a name="input_noncurrent_version_expiration_days"></a> [noncurrent\_version\_expiration\_days](#input\_noncurrent\_version\_expiration\_days) | Specifies when noncurrent s3 log versions expire | `number` | `90` | no |
| <a name="input_noncurrent_version_transition_days"></a> [noncurrent\_version\_transition\_days](#input\_noncurrent\_version\_transition\_days) | Specifies when noncurrent s3 log versions transition | `number` | `30` | no |
| <a name="input_regex_replace_chars"></a> [regex\_replace\_chars](#input\_regex\_replace\_chars) | Regex to replace chars with empty string in `namespace`, `environment`, `stage` and `name`.<br>If not set, `"/[^a-zA-Z0-9-]/"` is used to remove all characters other than hyphens, letters and digits. | `string` | `null` | no |
| <a name="input_release_label"></a> [release\_label](#input\_release\_label) | The release label for the Amazon EMR release. https://docs.aws.amazon.com/emr/latest/ReleaseGuide/emr-release-5x.html | `string` | `"emr-5.25.0"` | no |
| <a name="input_route_table_id"></a> [route\_table\_id](#input\_route\_table\_id) | Route table ID for the VPC S3 Endpoint when launching the EMR cluster in a private subnet. Required when `subnet_type` is `private` | `string` | `""` | no |
| <a name="input_scale_down_behavior"></a> [scale\_down\_behavior](#input\_scale\_down\_behavior) | The way that individual Amazon EC2 instances terminate when an automatic scale-in activity occurs or an instance group is resized | `string` | `null` | no |
| <a name="input_security_configuration"></a> [security\_configuration](#input\_security\_configuration) | The security configuration name to attach to the EMR cluster. Only valid for EMR clusters with `release_label` 4.8.0 or greater. See https://www.terraform.io/docs/providers/aws/r/emr_security_configuration.html for more info | `string` | `null` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | A list of additional security group IDs to allow access to ALB | `list(string)` | `[]` | no |
| <a name="input_slave_allowed_cidr_blocks"></a> [slave\_allowed\_cidr\_blocks](#input\_slave\_allowed\_cidr\_blocks) | List of CIDR blocks to be allowed to access the slave instances | `list(string)` | `[]` | no |
| <a name="input_slave_allowed_security_groups"></a> [slave\_allowed\_security\_groups](#input\_slave\_allowed\_security\_groups) | List of security groups to be allowed to connect to the slave instances | `list(string)` | `[]` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release' | `string` | `null` | no |
| <a name="input_standard_transition_days"></a> [standard\_transition\_days](#input\_standard\_transition\_days) | Number of days to persist logs in standard storage tier before moving to the infrequent access tier | `number` | `30` | no |
| <a name="input_step_concurrency_level"></a> [step\_concurrency\_level](#input\_step\_concurrency\_level) | The number of steps that can be executed concurrently. You can specify a maximum of 256 steps. Only valid for EMR clusters with release\_label 5.28.0 or greater. | `number` | `null` | no |
| <a name="input_stickiness"></a> [stickiness](#input\_stickiness) | Target group sticky configuration | <pre>object({<br>    cookie_duration = number<br>    enabled         = bool<br>  })</pre> | `null` | no |
| <a name="input_subnet_type"></a> [subnet\_type](#input\_subnet\_type) | Type of VPC subnet ID where you want the job flow to launch. Supported values are `private` or `public` | `string` | `"private"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags (e.g. `map('BusinessUnit','XYZ')` | `map(string)` | `{}` | no |
| <a name="input_target_group_additional_tags"></a> [target\_group\_additional\_tags](#input\_target\_group\_additional\_tags) | The additional tags to apply to the target group | `map(string)` | `{}` | no |
| <a name="input_target_group_name"></a> [target\_group\_name](#input\_target\_group\_name) | The name for the default target group, uses a module label name if left empty | `string` | `""` | no |
| <a name="input_target_group_port"></a> [target\_group\_port](#input\_target\_group\_port) | The port for the default target group | `number` | `80` | no |
| <a name="input_target_group_protocol"></a> [target\_group\_protocol](#input\_target\_group\_protocol) | The protocol for the default target group HTTP or HTTPS | `string` | `"HTTP"` | no |
| <a name="input_target_group_target_type"></a> [target\_group\_target\_type](#input\_target\_group\_target\_type) | The type (`instance`, `ip` or `lambda`) of targets that can be registered with the target group | `string` | `"ip"` | no |
| <a name="input_task_instance_group_autoscaling_policy"></a> [task\_instance\_group\_autoscaling\_policy](#input\_task\_instance\_group\_autoscaling\_policy) | String containing the EMR Auto Scaling Policy JSON for the Task instance group | `string` | `null` | no |
| <a name="input_task_instance_group_bid_price"></a> [task\_instance\_group\_bid\_price](#input\_task\_instance\_group\_bid\_price) | Bid price for each EC2 instance in the Task instance group, expressed in USD. By setting this attribute, the instance group is being declared as a Spot Instance, and will implicitly create a Spot request. Leave this blank to use On-Demand Instances | `string` | `null` | no |
| <a name="input_task_instance_group_ebs_iops"></a> [task\_instance\_group\_ebs\_iops](#input\_task\_instance\_group\_ebs\_iops) | The number of I/O operations per second (IOPS) that the Task volume supports | `number` | `null` | no |
| <a name="input_task_instance_group_ebs_optimized"></a> [task\_instance\_group\_ebs\_optimized](#input\_task\_instance\_group\_ebs\_optimized) | Indicates whether an Amazon EBS volume in the Task instance group is EBS-optimized. Changing this forces a new resource to be created | `bool` | `false` | no |
| <a name="input_task_instance_group_ebs_size"></a> [task\_instance\_group\_ebs\_size](#input\_task\_instance\_group\_ebs\_size) | Task instances volume size, in gibibytes (GiB) | `number` | `10` | no |
| <a name="input_task_instance_group_ebs_type"></a> [task\_instance\_group\_ebs\_type](#input\_task\_instance\_group\_ebs\_type) | Task instances volume type. Valid options are `gp2`, `io1`, `standard` and `st1` | `string` | `"gp2"` | no |
| <a name="input_task_instance_group_ebs_volumes_per_instance"></a> [task\_instance\_group\_ebs\_volumes\_per\_instance](#input\_task\_instance\_group\_ebs\_volumes\_per\_instance) | The number of EBS volumes with this configuration to attach to each EC2 instance in the Task instance group | `number` | `1` | no |
| <a name="input_task_instance_group_instance_count"></a> [task\_instance\_group\_instance\_count](#input\_task\_instance\_group\_instance\_count) | Target number of instances for the Task instance group. Must be at least 1 | `number` | `1` | no |
| <a name="input_task_instance_group_instance_type"></a> [task\_instance\_group\_instance\_type](#input\_task\_instance\_group\_instance\_type) | EC2 instance type for all instances in the Task instance group | `string` | `null` | no |
| <a name="input_termination_protection"></a> [termination\_protection](#input\_termination\_protection) | Switch on/off termination protection (default is false, except when using multiple master nodes). Before attempting to destroy the resource when termination protection is enabled, this configuration must be applied with its value set to false | `bool` | `false` | no |
| <a name="input_type"></a> [type](#input\_type) | (Optional) The record type. Valid values are A, AAAA, CAA, CNAME, MX, NAPTR, NS, PTR, SOA, SPF, SRV and TXT. | `string` | `"A"` | no |
| <a name="input_visible_to_all_users"></a> [visible\_to\_all\_users](#input\_visible\_to\_all\_users) | Whether the job flow is visible to all IAM users of the AWS account associated with the job flow | `bool` | `true` | no |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | Route53 parent zone ID. If provided (not empty), the module will create sub-domain DNS records for the masters and slaves | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | EMR cluster ID |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | EMR cluster name |
| <a name="output_context"></a> [context](#output\_context) | Context of this module to pass to other label modules |
| <a name="output_ec2_role"></a> [ec2\_role](#output\_ec2\_role) | Role name of EMR EC2 instances so users can attach more policies |
| <a name="output_kylin_public_dns"></a> [kylin\_public\_dns](#output\_kylin\_public\_dns) | DNS of Kylin host |
| <a name="output_master_host"></a> [master\_host](#output\_master\_host) | Name of the cluster CNAME record for the master nodes in the parent DNS zone |
| <a name="output_master_instance_ids"></a> [master\_instance\_ids](#output\_master\_instance\_ids) | EMR master instance ids |
| <a name="output_master_public_dns"></a> [master\_public\_dns](#output\_master\_public\_dns) | Master public DNS |
| <a name="output_master_security_group_id"></a> [master\_security\_group\_id](#output\_master\_security\_group\_id) | Master security group ID |
| <a name="output_slave_security_group_id"></a> [slave\_security\_group\_id](#output\_slave\_security\_group\_id) | Slave security group ID |
