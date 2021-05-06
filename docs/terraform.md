## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0, < 0.14.0 |
| aws | ~> 2.0 |
| null | ~> 2.0 |
| template | ~> 2.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| additional\_ec2\_role\_policy\_config | (Optional) - A list of policy objects be created and added to the EMR EC2 Role | <pre>list(object({<br>    name        = string<br>    description = string<br>    path        = string<br>    policy      = string<br>  }))</pre> | n/a | yes |
| applications | A list of applications for the cluster. Valid values are: Flink, Ganglia, Hadoop, HBase, HCatalog, Hive, Hue, JupyterHub, Livy, Mahout, MXNet, Oozie, Phoenix, Pig, Presto, Spark, Sqoop, TensorFlow, Tez, Zeppelin, and ZooKeeper (as of EMR 5.25.0). Case insensitive | `list(string)` | n/a | yes |
| availability\_zones | (Required) - The AWS avaialbility zones (e.g. ap-southeast-2a/b/c). Autoloaded from region.tfvars. | `list(string)` | n/a | yes |
| core\_instance\_group\_ebs\_size | Core instances volume size, in gibibytes (GiB) | `number` | n/a | yes |
| core\_instance\_group\_instance\_type | EC2 instance type for all instances in the Core instance group | `string` | n/a | yes |
| master\_instance\_group\_ebs\_size | Master instances volume size, in gibibytes (GiB) | `number` | n/a | yes |
| master\_instance\_group\_instance\_type | EC2 instance type for all instances in the Master instance group | `string` | n/a | yes |
| record\_name | (Required) (Required) The name of the record. | `string` | n/a | yes |
| subnet\_id | VPC subnet ID where you want the job flow to launch. Cannot specify the `cc1.4xlarge` instance type for nodes of a job flow launched in a Amazon VPC | `string` | n/a | yes |
| subnet\_ids | A list of subnet IDs to associate with ALB | `list(string)` | n/a | yes |
| vpc\_id | VPC ID to create the cluster in (e.g. `vpc-a22222ee`) | `string` | n/a | yes |
| additional\_info | A JSON string for selecting additional features such as adding proxy information. Note: Currently there is no API to retrieve the value of this argument after EMR cluster creation from provider, therefore Terraform cannot detect drift from the actual EMR cluster if its value is changed outside Terraform | `string` | `null` | no |
| alb\_access\_logs\_s3\_bucket\_force\_destroy | A boolean that indicates all objects should be deleted from the ALB access logs S3 bucket so that the bucket can be destroyed without error | `bool` | `false` | no |
| alb\_allowed\_cidr\_blocks | List of CIDR blocks to be allowed to access the master instances | `list(string)` | `[]` | no |
| allow\_all\_access | Set to false to prevent from opening all ports for access to the EMR cluster from allowed CIDR ranges | `bool` | `false` | no |
| allow\_http\_access | Set to false to prevent from opening HTTPS access to the EMR cluster via the ELB | `bool` | `false` | no |
| allow\_https\_access | Set to false to prevent from opening HTTPS access to the EMR cluster via the ELB | `bool` | `false` | no |
| allow\_ssh\_access | Set to false to prevent from opening SSH access to the EMR cluster from allowed CIDR ranges | `bool` | `false` | no |
| attributes | (Optional) - Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| aws\_account\_id | The AWS account id of the provider being deployed to (e.g. 12345678). Autoloaded from account.tfvars | `string` | `""` | no |
| aws\_assume\_role\_arn | (Optional) - ARN of the IAM role when optionally connecting to AWS via assumed role. Autoloaded from account.tfvars. | `string` | `""` | no |
| aws\_assume\_role\_external\_id | (Optional) - The external ID to use when making the AssumeRole call. | `string` | `""` | no |
| aws\_assume\_role\_session\_name | (Optional) - The session name to use when making the AssumeRole call. | `string` | `""` | no |
| aws\_region | The AWS region (e.g. ap-southeast-2). Autoloaded from region.tfvars. | `string` | `""` | no |
| bootstrap\_action | List of bootstrap actions that will be run before Hadoop is started on the cluster nodes | <pre>list(object({<br>    path = string<br>    name = string<br>    args = list(string)<br>  }))</pre> | `[]` | no |
| certificate\_arn | The ARN of the default SSL certificate for HTTPS listener | `string` | `""` | no |
| configurations\_json | A JSON string for supplying list of configurations for the EMR cluster. See https://docs.aws.amazon.com/emr/latest/ReleaseGuide/emr-configure-apps.html for more details | `string` | `""` | no |
| core\_instance\_group\_autoscaling\_policy | String containing the EMR Auto Scaling Policy JSON for the Core instance group | `string` | `null` | no |
| core\_instance\_group\_bid\_price | Bid price for each EC2 instance in the Core instance group, expressed in USD. By setting this attribute, the instance group is being declared as a Spot Instance, and will implicitly create a Spot request. Leave this blank to use On-Demand Instances | `string` | `null` | no |
| core\_instance\_group\_ebs\_iops | The number of I/O operations per second (IOPS) that the Core volume supports | `number` | `null` | no |
| core\_instance\_group\_ebs\_type | Core instances volume type. Valid options are `gp2`, `io1`, `standard` and `st1` | `string` | `"gp2"` | no |
| core\_instance\_group\_ebs\_volumes\_per\_instance | The number of EBS volumes with this configuration to attach to each EC2 instance in the Core instance group | `number` | `1` | no |
| core\_instance\_group\_instance\_count | Target number of instances for the Core instance group. Must be at least 1 | `number` | `1` | no |
| create\_task\_instance\_group | Whether to create an instance group for Task nodes. For more info: https://www.terraform.io/docs/providers/aws/r/emr_instance_group.html, https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-master-core-task-nodes.html | `bool` | `false` | no |
| create\_vpc\_endpoint\_s3 | Set to false to prevent the module from creating VPC S3 Endpoint | `bool` | `true` | no |
| cross\_zone\_load\_balancing\_enabled | A boolean flag to enable/disable cross zone load balancing | `bool` | `true` | no |
| custom\_ami\_id | A custom Amazon Linux AMI for the cluster (instead of an EMR-owned AMI). Available in Amazon EMR version 5.7.0 and later | `string` | `null` | no |
| deletion\_protection\_enabled | A boolean flag to enable/disable deletion protection for ALB | `bool` | `false` | no |
| delimiter | (Optional) - Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes` | `string` | `"-"` | no |
| deregistration\_delay | The amount of time to wait in seconds before changing the state of a deregistering target to unused | `number` | `15` | no |
| ebs\_root\_volume\_size | Size in GiB of the EBS root device volume of the Linux AMI that is used for each EC2 instance. Available in Amazon EMR version 4.x and later | `number` | `10` | no |
| enable\_glacier\_transition | Enables the transition of lb logs to AWS Glacier | `bool` | `true` | no |
| enable\_route53\_record | Set to true to create a simple A record for route53 to route traffic to the ALB alias | `bool` | `false` | no |
| enabled | Set to false to prevent the module from creating any resources | `bool` | `true` | no |
| environment | (Optional) - Environment, e.g. 'dev', 'qa', 'staging', 'prod' | `string` | `""` | no |
| expiration\_days | Number of days after which to expunge s3 logs | `number` | `90` | no |
| glacier\_transition\_days | Number of days after which to move s3 logs to the glacier storage tier | `number` | `60` | no |
| health\_check\_healthy\_threshold | The number of consecutive health checks successes required before considering an unhealthy target healthy | `number` | `2` | no |
| health\_check\_interval | The duration in seconds in between health checks | `number` | `15` | no |
| health\_check\_matcher | The HTTP response codes to indicate a healthy check | `string` | `"200-399"` | no |
| health\_check\_path | The destination for the health check request | `string` | `"/"` | no |
| health\_check\_timeout | The amount of time to wait in seconds before failing a health check request | `number` | `10` | no |
| health\_check\_unhealthy\_threshold | The number of consecutive health check failures required before considering the target unhealthy | `number` | `2` | no |
| http2\_enabled | A boolean flag to enable/disable HTTP/2 | `bool` | `true` | no |
| http\_ingress\_prefix\_list\_ids | List of prefix list IDs for allowing access to HTTP ingress security group | `list(string)` | `[]` | no |
| http\_port | The port for the HTTP listener | `number` | `80` | no |
| http\_redirect | A boolean flag to enable/disable HTTP redirect to HTTPS | `bool` | `false` | no |
| https\_ingress\_prefix\_list\_ids | List of prefix list IDs for allowing access to HTTPS ingress security group | `list(string)` | `[]` | no |
| https\_port | The port for the HTTPS listener | `number` | `443` | no |
| https\_ssl\_policy | The name of the SSL Policy for the listener | `string` | `"ELBSecurityPolicy-2015-05"` | no |
| idle\_timeout | The time in seconds that the connection is allowed to be idle | `number` | `60` | no |
| internal | A boolean flag to determine whether the ALB should be internal | `bool` | `false` | no |
| ip\_address\_type | The type of IP addresses used by the subnets for your load balancer. The possible values are `ipv4` and `dualstack`. | `string` | `"ipv4"` | no |
| keep\_job\_flow\_alive\_when\_no\_steps | Switch on/off run cluster with no steps or when all steps are complete | `bool` | `true` | no |
| kerberos\_ad\_domain\_join\_password | The Active Directory password for ad\_domain\_join\_user. Terraform cannot perform drift detection of this configuration. | `string` | `null` | no |
| kerberos\_ad\_domain\_join\_user | Required only when establishing a cross-realm trust with an Active Directory domain. A user with sufficient privileges to join resources to the domain. Terraform cannot perform drift detection of this configuration. | `string` | `null` | no |
| kerberos\_cross\_realm\_trust\_principal\_password | Required only when establishing a cross-realm trust with a KDC in a different realm. The cross-realm principal password, which must be identical across realms. Terraform cannot perform drift detection of this configuration. | `string` | `null` | no |
| kerberos\_enabled | Set to true if EMR cluster will use kerberos\_attributes | `bool` | `false` | no |
| kerberos\_kdc\_admin\_password | The password used within the cluster for the kadmin service on the cluster-dedicated KDC, which maintains Kerberos principals, password policies, and keytabs for the cluster. Terraform cannot perform drift detection of this configuration. | `string` | `null` | no |
| kerberos\_realm | The name of the Kerberos realm to which all nodes in a cluster belong. For example, EC2.INTERNAL | `string` | `"EC2.INTERNAL"` | no |
| key\_name | Amazon EC2 key pair that can be used to ssh to the master node as the user called `hadoop` | `string` | `null` | no |
| label\_order | The naming order of the id output and Name tag.<br>Defaults to ["namespace", "environment", "stage", "name", "attributes"].<br>You can omit any of the 5 elements, but at least one must be present. | `list(string)` | `null` | no |
| lifecycle\_rule\_enabled | A boolean that indicates whether the s3 log bucket lifecycle rule should be enabled. | `bool` | `false` | no |
| load\_balancer\_type | (Optional) The type of load balancer to create. Possible values are application or network. The default value is network. | `string` | `"application"` | no |
| log\_uri | The path to the Amazon S3 location where logs for this cluster are stored | `string` | `null` | no |
| master\_allowed\_cidr\_blocks | List of CIDR blocks to be allowed to access the master instances | `list(string)` | `[]` | no |
| master\_allowed\_security\_groups | List of security groups to be allowed to connect to the master instances | `list(string)` | `[]` | no |
| master\_dns\_name | Name of the cluster CNAME record to create in the parent DNS zone specified by `zone_id`. If left empty, the name will be auto-asigned using the format `emr-master-var.name` | `string` | `null` | no |
| master\_instance\_group\_bid\_price | Bid price for each EC2 instance in the Master instance group, expressed in USD. By setting this attribute, the instance group is being declared as a Spot Instance, and will implicitly create a Spot request. Leave this blank to use On-Demand Instances | `string` | `null` | no |
| master\_instance\_group\_ebs\_iops | The number of I/O operations per second (IOPS) that the Master volume supports | `number` | `null` | no |
| master\_instance\_group\_ebs\_type | Master instances volume type. Valid options are `gp2`, `io1`, `standard` and `st1` | `string` | `"gp2"` | no |
| master\_instance\_group\_ebs\_volumes\_per\_instance | The number of EBS volumes with this configuration to attach to each EC2 instance in the Master instance group | `number` | `1` | no |
| master\_instance\_group\_instance\_count | Target number of instances for the Master instance group. Must be at least 1 | `number` | `1` | no |
| name | (Optional) - Solution name, e.g. 'vault', 'consul', 'keycloak', 'k8s', or 'baseline' | `string` | `""` | no |
| namespace | (Optional) - Namespace, which could be your abbreviated product team, e.g. 'rci', 'mi', 'hp', or 'core' | `string` | `""` | no |
| noncurrent\_version\_expiration\_days | Specifies when noncurrent s3 log versions expire | `number` | `90` | no |
| noncurrent\_version\_transition\_days | Specifies when noncurrent s3 log versions transition | `number` | `30` | no |
| release\_label | The release label for the Amazon EMR release. https://docs.aws.amazon.com/emr/latest/ReleaseGuide/emr-release-5x.html | `string` | `"emr-5.25.0"` | no |
| route\_table\_id | Route table ID for the VPC S3 Endpoint when launching the EMR cluster in a private subnet. Required when `subnet_type` is `private` | `string` | `""` | no |
| scale\_down\_behavior | The way that individual Amazon EC2 instances terminate when an automatic scale-in activity occurs or an instance group is resized | `string` | `null` | no |
| security\_configuration | The security configuration name to attach to the EMR cluster. Only valid for EMR clusters with `release_label` 4.8.0 or greater. See https://www.terraform.io/docs/providers/aws/r/emr_security_configuration.html for more info | `string` | `null` | no |
| security\_group\_ids | A list of additional security group IDs to allow access to ALB | `list(string)` | `[]` | no |
| slave\_allowed\_cidr\_blocks | List of CIDR blocks to be allowed to access the slave instances | `list(string)` | `[]` | no |
| slave\_allowed\_security\_groups | List of security groups to be allowed to connect to the slave instances | `list(string)` | `[]` | no |
| standard\_transition\_days | Number of days to persist logs in standard storage tier before moving to the infrequent access tier | `number` | `30` | no |
| step\_concurrency\_level | The number of steps that can be executed concurrently. You can specify a maximum of 256 steps. Only valid for EMR clusters with release\_label 5.28.0 or greater. | `number` | `null` | no |
| stickiness | Target group sticky configuration | <pre>object({<br>    cookie_duration = number<br>    enabled         = bool<br>  })</pre> | `null` | no |
| subnet\_type | Type of VPC subnet ID where you want the job flow to launch. Supported values are `private` or `public` | `string` | `"private"` | no |
| tags | (Optional) - Additional tags | `map(string)` | `{}` | no |
| target\_group\_additional\_tags | The additional tags to apply to the target group | `map(string)` | `{}` | no |
| target\_group\_name | The name for the default target group, uses a module label name if left empty | `string` | `""` | no |
| target\_group\_port | The port for the default target group | `number` | `80` | no |
| target\_group\_protocol | The protocol for the default target group HTTP or HTTPS | `string` | `"HTTP"` | no |
| target\_group\_target\_type | The type (`instance`, `ip` or `lambda`) of targets that can be registered with the target group | `string` | `"ip"` | no |
| task\_instance\_group\_autoscaling\_policy | String containing the EMR Auto Scaling Policy JSON for the Task instance group | `string` | `null` | no |
| task\_instance\_group\_bid\_price | Bid price for each EC2 instance in the Task instance group, expressed in USD. By setting this attribute, the instance group is being declared as a Spot Instance, and will implicitly create a Spot request. Leave this blank to use On-Demand Instances | `string` | `null` | no |
| task\_instance\_group\_ebs\_iops | The number of I/O operations per second (IOPS) that the Task volume supports | `number` | `null` | no |
| task\_instance\_group\_ebs\_optimized | Indicates whether an Amazon EBS volume in the Task instance group is EBS-optimized. Changing this forces a new resource to be created | `bool` | `false` | no |
| task\_instance\_group\_ebs\_size | Task instances volume size, in gibibytes (GiB) | `number` | `10` | no |
| task\_instance\_group\_ebs\_type | Task instances volume type. Valid options are `gp2`, `io1`, `standard` and `st1` | `string` | `"gp2"` | no |
| task\_instance\_group\_ebs\_volumes\_per\_instance | The number of EBS volumes with this configuration to attach to each EC2 instance in the Task instance group | `number` | `1` | no |
| task\_instance\_group\_instance\_count | Target number of instances for the Task instance group. Must be at least 1 | `number` | `1` | no |
| task\_instance\_group\_instance\_type | EC2 instance type for all instances in the Task instance group | `string` | `null` | no |
| termination\_protection | Switch on/off termination protection (default is false, except when using multiple master nodes). Before attempting to destroy the resource when termination protection is enabled, this configuration must be applied with its value set to false | `bool` | `false` | no |
| type | (Optional) The record type. Valid values are A, AAAA, CAA, CNAME, MX, NAPTR, NS, PTR, SOA, SPF, SRV and TXT. | `string` | `"A"` | no |
| visible\_to\_all\_users | Whether the job flow is visible to all IAM users of the AWS account associated with the job flow | `bool` | `true` | no |
| zone\_id | Route53 parent zone ID. If provided (not empty), the module will create sub-domain DNS records for the masters and slaves | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| cluster\_id | EMR cluster ID |
| cluster\_name | EMR cluster name |
| ec2\_role | Role name of EMR EC2 instances so users can attach more policies |
| master\_host | Name of the cluster CNAME record for the master nodes in the parent DNS zone |
| master\_instance\_ids | EMR master instance ids |
| master\_public\_dns | Master public DNS |
| master\_security\_group\_id | Master security group ID |
| slave\_security\_group\_id | Slave security group ID |

