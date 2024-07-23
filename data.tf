data "oci_identity_availability_domains" "cicd_instance" {
  compartment_id = var.tenancy_ocid
}