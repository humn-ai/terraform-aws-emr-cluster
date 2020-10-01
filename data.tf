data "aws_instances" "emr_master_nodes" {
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

data "aws_instances" "emr_slave_nodes" {
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
