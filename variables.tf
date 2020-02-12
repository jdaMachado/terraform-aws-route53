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
    type = list(map(any))
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
