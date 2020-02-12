# terraform-aws-route53

A Terraform module to create a domain zone in AWS and add hosts to DNS.

## Usage
```hcl
provider "aws" {
  ...
}

module "new_zone_com" {

  source = "github.com/jdaMachado/terraform-aws-route53"
  
  domain_name = "new-zone.com"
  create_naked = true
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
```
**domain_name (string)**:The name for your zone  
**create_naked (bool)**:Indicate whether you want to create a naked A host for your zone  
**naked_records (list(string))**:List of records for the naked host  
**hosts (list(object))**:  
&nbsp;&nbsp;&nbsp;&nbsp;**name (string)**:The name for the host record  
&nbsp;&nbsp;&nbsp;&nbsp;**type (string)**:The type of the host record  
&nbsp;&nbsp;&nbsp;&nbsp;**ttl (string)**:TTL for the DNS host record  
&nbsp;&nbsp;&nbsp;&nbsp;**records (list(string))**:List of records for the host record  
