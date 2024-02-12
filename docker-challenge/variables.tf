variable "container_name" {
  description = "Value of the name for the Simplegoservice container"
  type        = string
  default     = "Alta3ResearchWebService"

  validation {
     condition     = length(var.container_name) == 23 && var.container_name == "Alta3ResearchWebService"
     error_message = "The container_name must be Alta3ResearchWebService"
  }
}

variable "intport" {
  description = "This defines the internal port" 
  type = number 
  default = 9876 
} 

variable "extport" {
  description = "This defines the external port"
  type = number 
  default = 5432 
} 
