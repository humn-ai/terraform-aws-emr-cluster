data "aws_instances" "emr_master_instances" {
  instance_tags = {
    Name = "dev-humnai-kylin"
  }

  filter {
    name   = "tag:aws:elasticmapreduce:instance-group-role"
    values = ["MASTER"]
  }

  depends_on = [
    aws_emr_cluster.default
  ]
}

data "aws_instances" "emr_core_instances" {
  instance_tags = {
    Name = "dev-humnai-kylin"
  }

  filter {
    name   = "tag:aws:elasticmapreduce:instance-group-role"
    values = ["SLAVE"]
  }

  depends_on = [
    aws_emr_cluster.default
  ]
}
