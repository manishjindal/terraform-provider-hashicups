# Testing the provider locally

## Setting up `.terraformrc` 

vi ~/.terraformrc

```
provider_installation {

  dev_overrides {
      "hashicorp.com/edu/hashicups" = "/Users/<user>/go/bin"
  }

  # For all other providers, install them directly from their origin provider
  # registries as normal. If you omit this, Terraform will _only_ use
  # the dev_overrides block, and so no other providers will be available.
  direct {}
}
```


## Setup GOPATH

```
export GOBIN=$(go env GOPATH)/bin
export PATH="$PATH:$(go env GOPATH)/bin"
```

## install

```
go install
```
After the install the provider binary should be available in GOBIN

```
ls /Users/<user>/go/bin/terraform-provider-hashicups                            
/Users/<user>/go/bin/terraform-provider-hashicups
```

## Test the provider

- Create a directory `example/provider-install-verification` 
- Create `main.tf` with folloing content

```
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

```