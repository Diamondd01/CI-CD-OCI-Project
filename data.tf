data "oci_identity_availability_domains" "CICD_Instance" {
  compartment_id = var.tenancy_ocid
}