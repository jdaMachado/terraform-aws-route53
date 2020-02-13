variable "zone" {
    type = string
    default = ""
}

variable "ttl" {
    type = string
    default = "3600"
}

variable "create_naked" {
    type = bool
    default = false
}

variable "naked_records" {
    type = list(string)
    default = []
}

variable "hosts" {
    type = list(object({
        name    = string, 
        type    = string, 
        ttl     = string, 
        records = list(string)
    }))
    default = []
}

variable "hosts_with_alias" {
    type = list(object({
        name    = string, 
        type    = string,  
        alias   = map(any)
    }))
    default = []
}
