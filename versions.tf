terraform {
  required_version = ">= 0.14"
  
  required_providers {    
    lacework = {
      source  = "lacework/lacework"
      version = "~> 1.18"
    }
  }
}
