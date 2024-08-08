provider "google" {
  project = var.project
  region  = "us-central1"
}

variable "project" {
  description = "The project ID to deploy resources"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC network"
  type        = string
}

variable "region" {
  description = "The region for the resources"
  type        = string
}

variable "router_name" {
  description = "The name of the router"
  type        = string
}

variable "nat_name" {
  description = "The name of the NAT gateway"
  type        = string
}

variable "subnet_configs" {
  description = "A list of subnet configurations"
  type = list(object({
    name = string
    cidr = string
  }))
}

variable "firewalls" {
  description = "A list of firewall rules"
  type = list(object({
    name          = string
    direction     = string
    priority      = number
    protocol      = string
    ports         = list(string)
    source_ranges = list(string)
  }))
}