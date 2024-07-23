variable "tenancy_ocid" {
  description = "ocid1.tenancy.oc1..aaaaaaaa52c7qr7y3rm5qveso7y4jn3evpgk6bss6nndfzoqum3tftibwuhq"
}
variable "private_key_path"{
    description ="C:\Users\dijewell\Downloads\ssh-key-2024-07-23.key"
}
variable "region"{
    description= "us-auburn-1"
}

variable "compartment_id"{
    description="ocid1.compartment.oc1..aaaaaaaaigecoxnads2k7fooq2rqzehiss5up6wgyqs46i73wvqz7qxuzujq"
}
variable "availability_domain"{
    description="us-auburn-1.AD-1"
}
variable "shape"{
    description= "VM.Standard.E4.Flex"
}
variable "vcn_cidr_block"{
    description="10.0.0.0/16"
}
variable "subnet_cidr_block"{
    description="10.0.0.0/24"
}
variable "vcn_id"{
    description="ocid1.vcn.oc1.iad.amaaaaaajtkboyqa74szdvgnfl2os7rx54oakv3bbyxmnna52qlosg7uwrgq"
}