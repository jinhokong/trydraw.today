resource "aws_route53_record" "web" {
  zone_id = "${var.route53_zone_id}"
  name    = "trydraw.today"
  type    = "A"

  alias {
    name                   = "${aws_cloudfront_distribution.web.domain_name}"
    zone_id                = "${aws_cloudfront_distribution.web.hosted_zone_id}"
    evaluate_target_health = false
  }
}
