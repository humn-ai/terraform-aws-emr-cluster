resource "aws_security_group" "alb" {
  count       = var.enable_alb ? 1 : 0
  description = "Controls access to the ALB (HTTP/HTTPS)"
  vpc_id      = var.vpc_id
  name        = module.label_elb.id
  tags        = module.label_elb.tags
}

resource "aws_security_group_rule" "alb_egress" {
  count             = var.enable_alb ? 1 : 0
  type              = "egress"
  from_port         = "0"
  to_port           = "0"
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.alb.*.id
}

resource "aws_security_group_rule" "alb_http_ingress" {
  count             = var.enable_alb && var.allow_http_access ? 1 : 0
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = var.alb_allowed_cidr_blocks
  prefix_list_ids   = var.http_ingress_prefix_list_ids
  security_group_id = aws_security_group.alb.*.id
}

resource "aws_security_group_rule" "alb_https_ingress" {
  count             = var.enable_alb && var.allow_https_access ? 1 : 0
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = var.alb_allowed_cidr_blocks
  prefix_list_ids   = var.https_ingress_prefix_list_ids
  security_group_id = aws_security_group.alb.*.id
}


resource "aws_lb" "default" {
  count              = var.enable_alb ? 1 : 0
  name               = module.label_elb.id
  tags               = module.label_elb.tags
  internal           = var.internal
  load_balancer_type = var.load_balancer_type

  security_groups = var.load_balancer_type == "network" ? [] : compact(
    concat(var.security_group_ids, [aws_security_group.alb.id]),
  )

  subnets                          = var.subnet_ids
  enable_cross_zone_load_balancing = var.cross_zone_load_balancing_enabled
  enable_http2                     = var.load_balancer_type == "network" ? null : var.http2_enabled
  idle_timeout                     = var.load_balancer_type == "network" ? null : var.idle_timeout
  ip_address_type                  = var.ip_address_type
  enable_deletion_protection       = var.deletion_protection_enabled

resource "aws_route53_record" "default" {
  count   = var.enable_alb ? 1 : 0
  zone_id = var.zone_id
  name    = "${var.environment}-${var.record_name}"
  type    = var.type

  alias {
    name                   = aws_lb.default.*.dns_name
    zone_id                = aws_lb.default.*.zone_id
    evaluate_target_health = true
  }
}

resource "aws_lb_target_group" "default" {
  count                = var.enable_alb ? 1 : 0
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

  stickiness {
    enabled = false
    type    = "lb_cookie"
  }


  # dynamic "stickiness" {
  #   for_each = var.stickiness == null ? [] : [var.stickiness]
  #   content {
  #     type            = "lb_cookie"
  #     cookie_duration = stickiness.value.cookie_duration
  #     enabled         = var.target_group_protocol == "TCP" ? false : stickiness.value.enabled
  #   }
  # }

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    module.label_elb.tags,
    var.target_group_additional_tags
  )
}

resource "aws_lb_target_group_attachment" "default" {
  count            = var.enable_alb && var.master_instance_group_instance_count < 0 ? var.master_instance_group_instance_count : 0
  target_group_arn = aws_lb_target_group.default.*.arn
  target_id        = element(data.aws_instances.emr_master_instances.ids, count.index)
  port             = var.target_group_port

  depends_on = [
    data.aws_instances.emr_master_instances,
    aws_emr_cluster.default
  ]
}

resource "aws_lb_listener" "http_forward" {
  count             = var.allow_http_access && var.http_redirect != true ? 1 : 0
  load_balancer_arn = aws_lb.default.*.arn
  port              = var.http_port
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.default.*.arn
    type             = "forward"
  }
}

resource "aws_lb_listener" "http_redirect" {
  count             = var.allow_http_access && var.http_redirect == true ? 1 : 0
  load_balancer_arn = aws_lb.default.*.arn
  port              = var.http_port
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.default.*.arn
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
