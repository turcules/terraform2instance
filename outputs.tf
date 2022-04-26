output "react_internal_ip" {
    value = google_compute_instance.react.network_interface.0.network_ip  
}

output "react_external_ip" {
    value = "${google_compute_instance.react.network_interface.0.access_config.0.nat_ip}"
}

output "react2_internal_ip" {
    value = google_compute_instance.react2.network_interface.0.network_ip
}

output "react2_external_ip" {
    value = "${google_compute_instance.react2.network_interface.0.access_config.0.nat_ip}"
  
}