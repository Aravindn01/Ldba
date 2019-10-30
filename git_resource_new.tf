variable "reponame" {
  type = string
  description = "This is for demo of string variable"
  default = "Blue"
}

variable "numofusers_git" {
  type = number
  description = "This is for demo of number variable"
  default = 3
}


resource "github_repository" "myweb" {
  name        = "tftrain1"
  description = "My super awesome codebase"

  private = false
}
resource "github_repository" "newweb" {
	  name        = "tftrain2"
  description = "My super awesome codebase 2"

  private = false
}

resource "github_repository" "web" {
  count = "${var.numofusers_git}"
  name  = "${var.reponame}_${count.index}"
  #name        = "${var.reponame}"
  description = "My awesome Green codebase"
  private = false
}
/*
variable "names" {
  description = "A list of names"
  type        = list(string)
  default     = ["rajesh", "kumar", "xyz"]
}
# Alternate of for each using count 
resource "github_repository" "repox" {
  count = "${length(var.names)}"
  name  = "rajesh.${count.index}"
  description = "My awesome codebase"
  private = false
}

*/

