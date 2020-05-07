variable google_project {
    type= string
    description = "Provide your google project ID"
    default = ""
}
provider "google" {
    version = "~> 3.0"
    project     = var.google_project
    region      = "us-central1"
}