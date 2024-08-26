# multiple_roles

Creates multiple IAM assumable roles.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0, <= 1.5.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_first_role"></a> [first\_role](#module\_first\_role) | ../.. | n/a |
| <a name="module_second_role"></a> [second\_role](#module\_second\_role) | ../.. | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_list_bucket_policy"></a> [list\_bucket\_policy](#input\_list\_bucket\_policy) | Custom policy to attach to the assumable role. Document must be valid json. | `string` | `null` | no |
| <a name="input_get_bucket_location_policy"></a> [get\_bucket\_location\_policy](#input\_get\_bucket\_location\_policy) | Custom policy to attach to the assumable role. Document must be valid json. | `string` | `null` | no |
| <a name="input_trusted_role_arns"></a> [trusted\_role\_arns](#input\_trusted\_role\_arns) | ARNs of AWS entities who can assume this role. | `list(string)` | `[]` | no |
| <a name="input_trusted_role_services"></a> [trusted\_role\_services](#input\_trusted\_role\_services) | Names of AWS Services that can assume this role. | `list(string)` | `[]` | no |
| <a name="input_logical_product_family"></a> [logical\_product\_family](#input\_logical\_product\_family) | Logical product family that the resource belongs to. | `string` | `"platform"` | no |
| <a name="input_logical_product_service"></a> [logical\_product\_service](#input\_logical\_product\_service) | Logical product service that the resource belongs to. | `string` | `"service"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to the resources created by the module. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_first_role_arn"></a> [first\_role\_arn](#output\_first\_role\_arn) | Crossaccount assumable IAM Role ARN |
| <a name="output_first_role_name"></a> [first\_role\_name](#output\_first\_role\_name) | Crossaccount assumable IAM Role name |
| <a name="output_first_role_policy_arns"></a> [first\_role\_policy\_arns](#output\_first\_role\_policy\_arns) | ARNs of the attached IAM policies |
| <a name="output_second_role_arn"></a> [second\_role\_arn](#output\_second\_role\_arn) | Crossaccount assumable IAM Role ARN |
| <a name="output_second_role_name"></a> [second\_role\_name](#output\_second\_role\_name) | Crossaccount assumable IAM Role name |
| <a name="output_second_role_policy_arns"></a> [second\_role\_policy\_arns](#output\_second\_role\_policy\_arns) | ARNs of the attached IAM policies |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
