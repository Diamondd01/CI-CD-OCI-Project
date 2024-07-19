# Provider (OCI)
provider "oci" {
    tenancy_ocid = "ocid1.tenancy.oc1..aaaaaaaa52c7qr7y3rm5qveso7y4jn3evpgk6bss6nndfzoqum3tftibwuhq"
    private_key_path =  "C:\Users\dijewell\Downloads\ssh-key-2024-07-19.key.crdownload"
    region = "US East (Ashburn)"
}
# Define VCN
resource "oci_core_virtual_network" "CI-CD-VCN"{ 
    cidr_block: "10.0.0.0/16"
}
# define a subnet within vcn 
resource "oci_core_virtual_subnet" "public subnet-CI-CD-VCN" { 
    cidr_block = "10.0.0.0/24"
    compartment_id = "ocid1.compartment.oc1..aaaaaaaarlony4tu43mq25zkj6frzk3zid43hox5wwmiyfciebe6szqo7cvq"
    vcn_id = "ocid1.vcn.oc1.iad.amaaaaaajtkboyqa74szdvgnfl2os7rx54oakv3bbyxmnna52qlosg7uwrgq"
    display_name =  "public subnet-CI-CD-VCN"
}    
# define a compute instance
 resource "oci_core_instance" "instance-CICD-OCI"{
    availability_domain ="AD-1"
    compartment_id = "ocid1.compartment.oc1..aaaaaaaarlony4tu43mq25zkj6frzk3zid43hox5wwmiyfciebe6szqo7cvq"
    shape = "VM.Standard.E4.Flex"
    subnet_id = "ocid1.subnet.oc1.iad.aaaaaaaampdltxvfftn2s7ljyxv7f6rxs7lc2rktqq7uglog37d2yqgyqfhq"

# metadata for the instance 
    metadata {
        ssh_authorized_keys: "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCx+V+Z0D/eaxICN3heR3f3OyFTkQ2NaUTlMtY3cv7MA"
    }
 }
