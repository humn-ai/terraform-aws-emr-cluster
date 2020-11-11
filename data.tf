data "aws_instances" "emr_master_instances" {
  instance_tags = {
    Name = "${var.environment}-humnai-kylin"
  }

  filter {
    name   = "tag:aws:elasticmapreduce:instance-group-role"
    values = ["MASTER"]
  }

  depends_on = [
    aws_emr_cluster.default
  ]
}