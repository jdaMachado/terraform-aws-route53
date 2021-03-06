resource "aws_route53_zone" "domain" { 
    name  = var.zone
}

resource "aws_route53_record" "naked_host" {
    count   = var.create_naked ? 1 : 0 
    zone_id = aws_route53_zone.domain.id
    name    = var.zone
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

resource "aws_route53_record" "hosts_with_alias" {
    count   = length(var.hosts_with_alias)
    zone_id = aws_route53_zone.domain.id
    name    = var.hosts_with_alias[count.index]["name"]
    type    = var.hosts_with_alias[count.index]["type"] 
    alias   {
        name                   = var.hosts_with_alias[count.index]["alias"]["name"]
        zone_id                = var.hosts_with_alias[count.index]["alias"]["zone_id"]
        evaluate_target_health = var.hosts_with_alias[count.index]["alias"]["evaluate_target_health"]
    } 
}

    