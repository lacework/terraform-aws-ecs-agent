terraform {
  required_version = ">= 0.12.31"

  required_providers {   
    aws    = ">= 5.0" 
    random = ">= 2.1"
    
    lacework = {
      source  = "lacework/lacework"
      version = "~> 2.0"
    }
  }
}
