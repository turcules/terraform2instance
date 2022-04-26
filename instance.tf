resource "google_compute_firewall" "web" {
  name          = "web-acces"
  network       = "default"
  source_ranges = ["0.0.0.0/0"]
   allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["80", "22", "8080", "443"]
  }
}

resource "google_compute_instance" "react" {
  name           = "react"
  machine_type   = "n1-standard-1"
  zone           = "us-west1-a"
  can_ip_forward = true



  boot_disk {
    initialize_params {
      size  = "15"
      image = "ubuntu-1804-bionic-v20220131"
    }
  }



  network_interface {
    network = "default"

    access_config {

    }
  }

  metadata = {
    ssh-keys       = "ubuntu:${file("/home/john/.ssh/id_rsa.pub")}"
    startup-script = "${file("/home/john/terra/user_data.sh")}"
  }
}

resource "google_compute_instance" "react2" {
  name           = "react2"
  machine_type   = "n1-standard-1"
  zone           = "us-west1-a"
  can_ip_forward = true
  boot_disk {
    initialize_params {
      size  = "20"
      image = "ubuntu-1804-bionic-v20220131"
    }
  }

  network_interface {
    network = "default"
    access_config {

    }


  }

  metadata = {
    ssh-keys       = "ubuntu:${file("/home/john/.ssh/id_rsa.pub")}"
    startup-script = "${file("/home/john/terra/user_data.sh")}"
  }


}