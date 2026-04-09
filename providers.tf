#############################################
# Providers compatibles con HCP Terraform
# No requieren red, credenciales ni endpoints
#############################################

terraform {
  required_version = "~> 1.14.0"

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }

    time = {
      source  = "hashicorp/time"
      version = "~> 0.11"
    }

    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }

    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }

  cloud {
    organization = "Hyrule-Nexus"

    workspaces {
      name = "Demo01"
    }
  }
}

#############################################
# Providers sin configuración adicional
# (todos funcionan en HCP sin problemas)
#############################################

provider "random" {}

provider "tls" {}

provider "time" {}

provider "null" {}

provider "local" {}