terraform {
  required_providers {
    hashicups = {
      source = "hashicorp.com/edu/hashicups"
    }
  }
}

provider "hashicups" {}

resource "hashicups_coffees" "example" {}
data "hashicups_coffees" "example" {}
