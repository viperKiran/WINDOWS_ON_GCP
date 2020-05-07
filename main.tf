# create default network
resource "google_compute_network" "defaultnetwork" {
name = "defaultnetwork"
auto_create_subnetworks = "true"
}

resource "google_compute_instance" "vm_instance" {
  name         = "windows-server"
  zone         = "us-central1-a"
  machine_type = "c2-standard-4"
  tags = ["my-personal-windows"]
  boot_disk {
    initialize_params {
      image = "windows-server"
	  }
  }
  network_interface {
    network = "default"
    access_config {
      # Allocate a one-to-one NAT IP to the instance
    }
  }
}

output windows-machine-access {
  value = google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip 
}