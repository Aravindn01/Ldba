
variable "AWS_OS" {
 default = "rhel"
}

variable "AMIS" {
  type = map(string)
  default = {
    ubuntu = "ami-0123b531fc646552f"
    suse = "ami-0a2a94baf8854e9ee"
    rhel     = "ami-0a74bfeb190bd404f"
  }
}


variable "numofusers" {
  type = number
  description = "This is for demo of number variable"
  default=2
}

variable "names" {
    type    = "list"
    default = ["Red", "Blue", "Green"]
    description = "This is for demo of list variable"
}
