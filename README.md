# terraform-aws-route53

A Terraform module to create a domain zone in AWS and add hosts to DNS.

## Usage
```hcl
provider "aws" {
  ...
}

module "new_zone_com" {

  source        = "github.com/jdaMachado/terraform-aws-route53"
  
  zone          = "new-zone.com"
  create_naked  = true
  naked_records = ["1.2.3.4"]
  hosts = [
    {
      name    = "www"
      type    = "CNAME"        
      ttl     = "3600"        
      records = ["new-zone.com"]
    }
  ]
}


module "another_zone_net" {
  source  = "github.com/jdaMachado/terraform-aws-route53"
  zone    = "another-zone.net"
  hosts   = [
  {
    name    = "another-zone.net"
    type    = "TXT"        
    ttl     = "3600"        
    records = [local.google_site_verification_record]
  }]

  hosts_with_alias = [
  {
    name    = "another-zone.net"
    type    = "A"
    alias = {
      name                   = data.aws_lb.my_lb.dns_name
      zone_id                = data.aws_lb.my_lb.zone_id
      evaluate_target_health = "false"
    }
  },
  {
    name    = "www"
    type    = "CNAME"
    alias = {
      name                   = data.aws_lb.my_lb.dns_name
      zone_id                = data.aws_lb.my_lb.zone_id
      evaluate_target_health = "false"
    }
  }]
}
```
**zone (string)**:The name for your zone  
**create_naked (bool)**:Indicate whether you want to create a naked A host for your zone  
**naked_records (list(string))**:List of records for the naked host  
**hosts (list(object))**:  
&nbsp;&nbsp;&nbsp;&nbsp;**name (string)**:The name for the host record  
&nbsp;&nbsp;&nbsp;&nbsp;**type (string)**:The type of the host record  
&nbsp;&nbsp;&nbsp;&nbsp;**ttl (string)**:TTL for the DNS host record  
&nbsp;&nbsp;&nbsp;&nbsp;**records (list(string))**:List of records for the host record  
**hosts_with_alias (list(object))**:  
&nbsp;&nbsp;&nbsp;&nbsp;**name (string)**:The name for the host record  
&nbsp;&nbsp;&nbsp;&nbsp;**type (string)**:The type of the host record  
&nbsp;&nbsp;&nbsp;&nbsp;**alias (map(string))**:  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**name (string)**:The name of the host we want an alias of  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**zone_id (string)**:The zone_id of that host  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**evaluate_target_health (string)**: Whether we want a health check for that host  
