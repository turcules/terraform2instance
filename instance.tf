resource "google_compute_instance" "default" {
  name         = "instance-for-tests"
  machine_type = "n1-standard-1"
  zone         = "us-west1-a"
  can_ip_forward = true



  boot_disk {
    initialize_params {
      image = "ubuntu-1804-bionic-v20220131"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${file("/home/john/.ssh/id_rsa.pub")}"
    startup-script = "${file("/home/john/terra/user_data.sh")}"
  }
}