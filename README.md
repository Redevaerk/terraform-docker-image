# Terraform Docker Build & Push Module

Simplify your Docker image deployment process with our Terraform module! 
This module automates the building and pushing of Docker images to your desired container registry. 
Easily define your image source, repository details, and registry settings using Terraform's declarative syntax. 

## Usage

```terraform
module "docker_image" {
  source  = "Redevaerk/image/docker"
  version = "x.x.x"
  name    = var.name
}
```

## Examples

- [Simple](https://github.com/redevaerk/terraform-docker-image/tree/main/examples/simple) - This example will build and push Docker images with default settings.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_docker"></a> [docker](#requirement\_docker) | >=3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_docker"></a> [docker](#provider\_docker) | >=3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [docker_image.this](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/image) | resource |
| [docker_registry_image.this](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/registry_image) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_context"></a> [context](#input\_context) | Value to specify the build context. Currently, only a PATH context is supported. | `string` | `null` | no |
| <a name="input_create"></a> [create](#input\_create) | Controls whether resources should be created | `bool` | `true` | no |
| <a name="input_dockerfile"></a> [dockerfile](#input\_dockerfile) | A directory containing your Dockerfile | `string` | `"Dockerfile"` | no |
| <a name="input_dynamic_build"></a> [dynamic\_build](#input\_dynamic\_build) | If true, will force the docker\_image resource to be replaced. This can be used to rebuild an image when contents of source code folders change. | `bool` | `true` | no |
| <a name="input_dynamic_build_attach_dockerfile"></a> [dynamic\_build\_attach\_dockerfile](#input\_dynamic\_build\_attach\_dockerfile) | If true, will force the docker\_image resource to be replaced when dockerfile changes. | `bool` | `true` | no |
| <a name="input_dynamic_build_attach_dockerignore"></a> [dynamic\_build\_attach\_dockerignore](#input\_dynamic\_build\_attach\_dockerignore) | If true, will force the docker\_image resource to be replaced when docker ignore file changes. | `bool` | `true` | no |
| <a name="input_dynamic_build_attach_source"></a> [dynamic\_build\_attach\_source](#input\_dynamic\_build\_attach\_source) | If true, will force the docker\_image resource to be replaced when contents of source code folders change. | `bool` | `true` | no |
| <a name="input_dynamic_build_extra"></a> [dynamic\_build\_extra](#input\_dynamic\_build\_extra) | A map of arbitrary strings that, when changed, will force the docker\_image resource to be replaced | `map(string)` | `null` | no |
| <a name="input_dynamic_build_source_dir"></a> [dynamic\_build\_source\_dir](#input\_dynamic\_build\_source\_dir) | A directory containing your source code. This variable will be used in dynamic build when var.dynamic\_build\_attach\_source is true. | `string` | `"src"` | no |
| <a name="input_force_remove"></a> [force\_remove](#input\_force\_remove) | If true, then the image is removed forcibly when the resource is destroyed. | `bool` | `false` | no |
| <a name="input_keep_locally"></a> [keep\_locally](#input\_keep\_locally) | If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation. | `bool` | `false` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | A map of labels to add to the Image | `map(string)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | A unique name for your Image | `string` | n/a | yes |
| <a name="input_push"></a> [push](#input\_push) | If true, then the Image will be pushed to the registry | `bool` | `true` | no |
| <a name="input_registry"></a> [registry](#input\_registry) | Registry Name to push the Image | `string` | `"registry-1.docker.io"` | no |
| <a name="input_tag"></a> [tag](#input\_tag) | A tag for your Image | `string` | `"latest"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License

Apache 2 Licensed. See [LICENSE](https://github.com/redevaerk/terraform-docker-image/tree/main/LICENSE) for full details.

