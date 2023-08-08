###########
# Docker
###########
variable "registry" {
  description = "Registry Name to push the Image"
  type        = string
  default     = "registry-1.docker.io"
}

variable "name" {
  description = "A unique name for your Image"
  type        = string
}

variable "tag" {
  description = "A tag for your Image"
  type        = string
  default     = "latest"
}

variable "keep_locally" {
  description = "If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation."
  type        = bool
  default     = false
}

variable "force_remove" {
  description = " If true, then the image is removed forcibly when the resource is destroyed."
  type        = bool
  default     = false
}

variable "push" {
  description = "If true, then the Image will be pushed to the registry"
  type        = bool
  default     = true
}

###########
# Build Variables
###########
variable "dockerfile" {
  description = "A directory containing your Dockerfile"
  type        = string
  default     = "Dockerfile"
}

variable "context" {
  description = "Value to specify the build context. Currently, only a PATH context is supported."
  type        = string
  default     = null
}

variable "labels" {
  description = "A map of labels to add to the Image"
  type        = map(string)
  default     = {}
}

###########
# Build Variables - Triggers
###########
variable "dynamic_build" {
  description = "If true, will force the docker_image resource to be replaced. This can be used to rebuild an image when contents of source code folders change."
  type        = bool
  default     = true
}

variable "dynamic_build_attach_source" {
  description = "If true, will force the docker_image resource to be replaced when contents of source code folders change."
  type        = bool
  default     = true
}

variable "dynamic_build_source_dir" {
  description = "A directory containing your source code. This variable will be used in dynamic build when var.dynamic_build_attach_source is true."
  type        = string
  default     = "src"
}

variable "dynamic_build_attach_dockerfile" {
  description = "If true, will force the docker_image resource to be replaced when dockerfile changes."
  type        = bool
  default     = true
}

variable "dynamic_build_attach_dockerignore" {
  description = "If true, will force the docker_image resource to be replaced when docker ignore file changes."
  type        = bool
  default     = true
}

variable "dynamic_build_extra" {
  description = "A map of arbitrary strings that, when changed, will force the docker_image resource to be replaced"
  type        = map(string)
  default     = null
}
