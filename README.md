
# Hello Cloud on Azure 🚀

This project demonstrates deploying a simple Flask web app to **Azure App Service** using **Terraform** and a **Docker container**.

## 🗂️ Project Structure

```
.
├── .terraform/                  # Terraform internal files 
├── app.py                       # Flask application
├── Dockerfile                   # Docker image definition
├── main.tf                      # Terraform configuration
├── terraform.tfstate            # Terraform state
├── terraform.lock.hcl           # Terraform dependency lock
```

---
### 1. Set your Azure Subscribtion ID 

To deploy to **Azure subscription**, update the `main.tf` file:

```hcl
provider "azurerm" {
  features {}
  subscription_id = "your-subscription-id-here"
}
```

Find your subscription ID using the Azure CLI:
```bash
az account show --query id -o tsv
or
az account list --output table
```


### 2. Initialize Terraform
```bash
terraform init
```

### 3. Apply your infrastructure
```bash
terraform apply
```

---

## 🧱 Flask App

A simple web app returns a greeting:

```python
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello Cloud from Azure!"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
```


## 🌐 Access the Web App

Once deployed, open your browser to:

```
http://hello-cloud-app.azurewebsites.net
```


