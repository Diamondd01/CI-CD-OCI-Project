# Provider (OCI)
provider "oci" {
    tenancy_ocid = var.tenancy_ocid
    private_key_path =  var.private_key_path
    region = var.region
}
# Define VCN
resource "oci_core_virtual_network" "CI-CD-VCN"{ 
    cidr_block=var.vcn_cidr_block
    compartment_id= var.compartment_id
}   
# define a compute instance
 resource "oci_core_instance" "cicd_instance"{
    availability_domain =var.availability_domain
    compartment_id = var.compartment_id
    shape = var.shape
    shape_config{
        memory_in_gbs = var.instance_shape_config_memory_in_gbs
        ocpus = var.instance_shape_config_ocpu
    }
    source_details{
        source_id ="ocid1.image.oc1.iad.aaaaaaaa6uqjfy73o5jvx47jvuwhpczh4euram4nxy37744agjoymonbhtrq"
        source_type ="image"
    }
    create_vnic_details{
        assign_public_ip = true
        subnet_id = oci_core_subnet.cicd_vcn_subnet.subnet_id
    }
 }
