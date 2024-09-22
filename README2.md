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


## Check schema of provider json
go to the direcotry where you have tf files.

```
terraform providers schema --json

{"format_version":"1.0","provider_schemas":{"hashicorp.com/edu/hashicups":{"provider":{"version":0,"block":{"description_kind":"plain"}},"resource_schemas":{"hashicups_coffees":{"version":0,"block":{"attributes":{"configurable_attribute":{"type":"string","description":"Coffees configurable attribute","description_kind":"markdown","optional":true},"defaulted":{"type":"string","description":"Coffees configurable attribute with default value","description_kind":"markdown","optional":true,"computed":true},"id":{"type":"string","description":"Coffees identifier","description_kind":"markdown","computed":true}},"description":"Coffees resource","description_kind":"markdown"}}},"data_source_schemas":{"hashicups_coffees":{"version":0,"block":{"attributes":{"configurable_attribute":{"type":"string","description":"Coffees configurable attribute","description_kind":"markdown","optional":true},"id":{"type":"string","description":"Coffees identifier","description_kind":"markdown","computed":true}},"description":"Coffees data source","description_kind":"markdown"}}}}}}
```