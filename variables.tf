variable "domain_name" {
    type = string
    default = ""
}

variable "ttl" {
    type = string
    default = "3600"
}

variable "ipv4" {
    type = string
    default = ""
}

variable "ipv6" {
    type = string
    default = ""
}

variable "hosts" {
    type = list(object({name=string, type=string, ttl=string, records=list(string)}))
    default = []
}

variable "create_naked" {
    type = bool
    default = false
}

variable "naked_records" {
    type = list(string)
    default = []
}
