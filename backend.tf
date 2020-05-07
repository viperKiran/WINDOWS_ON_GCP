terraform {
    backend gcs {
        bucket = "kiran_terraform_backend"
        prefix = "windows_server.tfstate"
    }
}