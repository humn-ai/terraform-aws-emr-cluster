output "cluster_id" {
  value       = join("", aws_emr_cluster.default.*.id)
  description = "EMR cluster ID"
}

output "master_instance_ids" {
  value       = data.aws_instances.emr_master_instances.ids
  description = "EMR master instance ids"
}

output "core_instance_ids" {
  value       = data.aws_instances.emr_core_instances.ids
  description = "EMR core instance ids"
}


output "cluster_name" {
  value       = join("", aws_emr_cluster.default.*.name)
  description = "EMR cluster name"
}

output "master_public_dns" {
  value       = join("", aws_emr_cluster.default.*.master_public_dns)
  description = "Master public DNS"
}

output "master_security_group_id" {
  value       = join("", aws_security_group.master.*.id)
  description = "Master security group ID"
}

output "slave_security_group_id" {
  value       = join("", aws_security_group.slave.*.id)
  description = "Slave security group ID"
}

output "master_host" {
  value       = module.dns_master.hostname
  description = "Name of the cluster CNAME record for the master nodes in the parent DNS zone"
}

output "ec2_role" {
  value       = join("", aws_iam_role.ec2.*.name)
  description = "Role name of EMR EC2 instances so users can attach more policies"
}
