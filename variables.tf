variable "token"{
        type = "string"
        default = "56e4ff7f91587363e24884654ca2be719a0876de8e33d98be5ef5835f6a2af2b"
}

variable "region" {
        default = "sfo2"
}

variable "do_cluster_name"{
        default = "miprimercluster"
}

variable "kuber_version"{
        default = "1.14.1-do.2"
}
variable "pvt"{
	default = "digitalocen"	
}

variable "default_port"{
	default = "80"
}	

variable "default_protocol"{
	default = "http"
}	
