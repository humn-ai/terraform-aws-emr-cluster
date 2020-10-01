data "aws_instances" "emr_master_nodes" {
  instance_tags = {
    Name = "dev-humnai-kylin"
  }

  filter {
    name   = "tag:aws:elasticmapreduce:instance-group-role"
    values = ["MASTER"]
  }

  instance_state_names = ["running", "stopped"]

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

  instance_state_names = ["running", "stopped"]

  depends_on = [
    aws_emr_cluster.default
  ]
}
