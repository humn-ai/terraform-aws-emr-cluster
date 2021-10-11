data "aws_instances" "emr_master_instances" {
  instance_tags = {
    Name = module.label.id
  }

  filter {
    name   = "tag:aws:elasticmapreduce:instance-group-role"
    values = ["MASTER"]
  }

  depends_on = [
    aws_emr_cluster.default
  ]
}