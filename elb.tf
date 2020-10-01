resource "aws_security_group" "alb" {
  description = "Controls access to the ALB (HTTP/HTTPS)"
  vpc_id      = var.vpc_id
  name        = module.label_elb.id
  tags        = module.label_elb.tags
}

resource "aws_security_group_rule" "alb_egress" {
  type              = "egress"
  from_port         = "0"
  to_port           = "0"
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.alb.id
}

resource "aws_security_group_rule" "alb_http_ingress" {
  count             = var.allow_http_access ? 1 : 0
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = var.alb_allowed_cidr_blocks
  prefix_list_ids   = var.http_ingress_prefix_list_ids
  security_group_id = aws_security_group.alb.id
}

resource "aws_security_group_rule" "alb_https_ingress" {
  count             = var.allow_https_access ? 1 : 0
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = var.alb_allowed_cidr_blocks
  prefix_list_ids   = var.https_ingress_prefix_list_ids
  security_group_id = aws_security_group.alb.id
}

# module "access_logs" {
#   source                             = "git::https://github.com/cloudposse/terraform-aws-lb-s3-bucket.git?ref=tags/0.7.0"
#   enabled                            = var.access_logs_enabled
#   name                               = var.name
#   namespace                          = var.namespace
#   stage                              = var.stage
#   environment                        = var.environment
#   attributes                         = compact(concat(var.attributes, ["alb", "access", "logs"]))
#   delimiter                          = var.delimiter
#   tags                               = var.tags
#   region                             = var.access_logs_region
#   lifecycle_rule_enabled             = var.lifecycle_rule_enabled
#   enable_glacier_transition          = var.enable_glacier_transition
#   expiration_days                    = var.expiration_days
#   glacier_transition_days            = var.glacier_transition_days
#   noncurrent_version_expiration_days = var.noncurrent_version_expiration_days
#   noncurrent_version_transition_days = var.noncurrent_version_transition_days
#   standard_transition_days           = var.standard_transition_days
#   force_destroy                      = var.alb_access_logs_s3_bucket_force_destroy
# }

resource "aws_lb" "default" {
  name               = module.label_elb.id
  tags               = module.label_elb.tags
  internal           = var.internal
  load_balancer_type = "application"

  security_groups = compact(
    concat(var.security_group_ids, [aws_security_group.alb.id]),
  )

  subnets                          = var.subnet_ids
  enable_cross_zone_load_balancing = var.cross_zone_load_balancing_enabled
  enable_http2                     = var.http2_enabled
  idle_timeout                     = var.idle_timeout
  ip_address_type                  = var.ip_address_type
  enable_deletion_protection       = var.deletion_protection_enabled

  #   access_logs {
  #     bucket  = module.access_logs.bucket_id
  #     prefix  = var.access_logs_prefix
  #     enabled = var.access_logs_enabled
  #   }
}

resource "aws_lb_target_group" "default" {
  name                 = var.target_group_name == "" ? module.label_elb.id : var.target_group_name
  port                 = var.target_group_port
  protocol             = var.target_group_protocol
  vpc_id               = var.vpc_id
  target_type          = var.target_group_target_type
  deregistration_delay = var.deregistration_delay

  health_check {
    protocol            = var.target_group_protocol
    path                = var.health_check_path
    timeout             = var.health_check_timeout
    healthy_threshold   = var.health_check_healthy_threshold
    unhealthy_threshold = var.health_check_unhealthy_threshold
    interval            = var.health_check_interval
    matcher             = var.health_check_matcher
  }

  dynamic "stickiness" {
    for_each = var.stickiness == null ? [] : [var.stickiness]
    content {
      type            = "lb_cookie"
      cookie_duration = stickiness.value.cookie_duration
      enabled         = var.target_group_protocol == "TCP" ? false : stickiness.value.enabled
    }
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    module.label_elb.tags,
    var.target_group_additional_tags
  )
}

resource "aws_lb_target_group_attachment" "default" {
  count            = length(data.aws_instances.*.ids)
  target_group_arn = aws_lb_target_group.default.arn
  target_id        = data.aws_instances.*.ids
  port             = var.target_group_protocol

  depends_on = [
    data.aws_instances.emr_master_nodes
  ]
}

resource "aws_lb_listener" "http_forward" {
  count             = var.allow_http_access && var.http_redirect != true ? 1 : 0
  load_balancer_arn = aws_lb.default.arn
  port              = var.http_port
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.default.arn
    type             = "forward"
  }
}

resource "aws_lb_listener" "http_redirect" {
  count             = var.allow_http_access && var.http_redirect == true ? 1 : 0
  load_balancer_arn = aws_lb.default.arn
  port              = var.http_port
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.default.arn
    type             = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "https" {
  count             = var.allow_https_access ? 1 : 0
  load_balancer_arn = aws_lb.default.arn

  port            = var.https_port
  protocol        = "HTTPS"
  ssl_policy      = var.https_ssl_policy
  certificate_arn = var.certificate_arn

  default_action {
    target_group_arn = aws_lb_target_group.default.arn
    type             = "forward"
  }
}
