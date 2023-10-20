# multiple_roles

Creates multiple IAM assumable roles.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

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
| <a name="input_role_sts_externalid"></a> [role\_sts\_externalid](#input\_role\_sts\_externalid) | STS ExternalId condition values to use with this role. | `list(string)` | `[]` | no |
| <a name="input_trusted_role_arns"></a> [trusted\_role\_arns](#input\_trusted\_role\_arns) | ARNs of AWS entities who can assume this role. | `list(string)` | `[]` | no |
| <a name="input_trusted_role_services"></a> [trusted\_role\_services](#input\_trusted\_role\_services) | Names of AWS Services that can assume this role. | `list(string)` | `[]` | no |
| <a name="input_naming_prefix"></a> [naming\_prefix](#input\_naming\_prefix) | Prefix for the provisioned resources. | `string` | `"platform"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment in which the resource should be provisioned like dev, qa, prod etc. | `string` | `"dev"` | no |
| <a name="input_environment_number"></a> [environment\_number](#input\_environment\_number) | The environment count for the respective environment. Defaults to 000. Increments in value of 1 | `string` | `"000"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS Region in which the infra needs to be provisioned | `string` | `"us-east-2"` | no |
| <a name="input_resource_number"></a> [resource\_number](#input\_resource\_number) | The resource count for the respective resource. Defaults to 000. Increments in value of 1 | `string` | `"000"` | no |
| <a name="input_resource_names_map"></a> [resource\_names\_map](#input\_resource\_names\_map) | A map of key to resource\_name that will be used by tf-aws-wrapper\_module-iam\_assumable\_role module to generate resource names | <pre>map(object(<br>    {<br>      name       = string<br>      max_length = optional(number, 60)<br>    }<br>  ))</pre> | <pre>{<br>  "iam_policy": {<br>    "name": "iamp"<br>  },<br>  "iam_role": {<br>    "name": "iamr"<br>  }<br>}</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to the resources created by the module. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_first_role_arn"></a> [first\_role\_arn](#output\_first\_role\_arn) | Crossaccount assumable IAM Role ARN |
| <a name="output_second_role_arn"></a> [second\_role\_arn](#output\_second\_role\_arn) | Crossaccount assumable IAM Role ARN |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
