provider "google" {
  credentials = "${file("../account.json")}"
  project = "thrashingcorecode"
  region = "us-west1"
}

provider "aws" {
  region = "eu-west-1"
}

provider "azurerm" {
  subscription_id = "0"
  client_id = "1"
  client_secret = "2"
  tenant_id = "3"
}