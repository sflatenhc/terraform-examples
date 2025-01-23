locals {
    
}

terraform {
  required_version = ">= 1.6"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "=2.5.2"
    }
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=4.16.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "db50385e-4701-4aae-b499-4915d59caeaa"
  ## Set-Item -Path "Env:\ARM_SUBSCRIPTION_ID" -Value "db50385e-4701-4aae-b499-4915d59caeaa"
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}