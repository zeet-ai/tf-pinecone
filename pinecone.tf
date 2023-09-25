terraform {
  required_providers {
    pinecone = {
      source  = "skyscrapr/pinecone"
      version = "0.2.1"
    }
  }
}

variable "index_name" {
  type        = string
  description = "The name of the index"
  default     = 2
}

variable "index_dimension" {
  type        = number
  description = "The dimension of the index. It must be at least 512"
  default     = 512
}

variable "index_metric" {
  type        = string
  description = "The metric of the index"
  default     = "cosine"
}

variable "pods" {
  type        = number
  description = "The number of pods for the index to use, including replicas"
  default     = 2
}

variable "pod_type" {
  type        = string
  description = "The pod type for the project"
  default     = "starter"
}

variable "replicas" {
  type        = number
  description = "The number of replicas"
  default     = 2
}

variable "api_key" {
  type        = string
  description = "The API KEY value"
  default     = ""
}

variable "environment" {
  type        = string
  description = "The account environment paired with API KEY. Check your account"
  default     = ""
}

provider "pinecone" {
  environment = var.environment
  api_key     = var.api_key
}

resource "pinecone_index" "new_index" {
  name      = var.index_name
  dimension = var.index_dimension
  metric    = var.index_metric
  pod_type  = var.pod_type
  replicas  = var.replicas
  pods      = var.pods
}
