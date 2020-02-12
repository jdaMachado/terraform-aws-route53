resource "aws_route53_zone" "domain" { 
    name  = var.domain_name
}

resource "aws_route53_record" "naked_host" {
    count   = var.create_naked ? 1 : 0 
    zone_id = aws_route53_zone.domain.id
    name    = var.domain_name
    type    = "A"
    ttl     = var.ttl
    records = var.naked_records
}

resource "aws_route53_record" "hosts" {
    count   = length(var.hosts)
    zone_id = aws_route53_zone.domain.id
    name    = var.hosts[count.index]["name"]
    type    = var.hosts[count.index]["type"] 
    ttl     = var.hosts[count.index]["ttl"]
    records = var.hosts[count.index]["records"]
}
