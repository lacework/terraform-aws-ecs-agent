terraform {
  required_version = ">= 0.14"
  
  required_providers {   
    aws    = ">= 5.0" 
    random = ">= 2.1"
    
    lacework = {
      source  = "lacework/lacework"
      version = "~> 1.18"
    }
  }
}
