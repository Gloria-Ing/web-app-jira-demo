terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4.0"
    }
  }
}

provider "local" {}

# 2️⃣ Store your app code in a local variable
locals {
  app_code = <<EOT
console.log("Hello from Terraform-created Node.js app!");
EOT
}

# 3️⃣ Create the index.js file inside webapp/src/
resource "local_file" "webapp_app" {
  filename = "${path.module}/webapp/src/index.js"
  content  = local.app_code
}

# 4️⃣ Output the path to the created file
output "webapp_file_path" {
  value       = local_file.webapp_app.filename
  description = "The full path to the web application's index.js file."
}
