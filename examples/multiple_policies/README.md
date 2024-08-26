# multiple_policies

Creates an IAM assumable role with multiple policies.

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
| <a name="module_iam_assumable_role"></a> [iam\_assumable\_role](#module\_iam\_assumable\_role) | ../.. | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_list_bucket_policy"></a> [list\_bucket\_policy](#input\_list\_bucket\_policy) | Custom policy to attach to the assumable role. Document must be valid json. | `string` | `null` | no |
| <a name="input_get_bucket_location_policy"></a> [get\_bucket\_location\_policy](#input\_get\_bucket\_location\_policy) | Custom policy to attach to the assumable role. Document must be valid json. | `string` | `null` | no |
| <a name="input_trusted_role_arns"></a> [trusted\_role\_arns](#input\_trusted\_role\_arns) | ARNs of AWS entities who can assume this role. | `list(string)` | `[]` | no |
| <a name="input_trusted_role_services"></a> [trusted\_role\_services](#input\_trusted\_role\_services) | Names of AWS Services that can assume this role. | `list(string)` | `[]` | no |
| <a name="input_resource_names_map"></a> [resource\_names\_map](#input\_resource\_names\_map) | A map of key to resource\_name that will be used by tf-aws-module\_collection-iam\_assumable\_role module to generate resource names | <pre>map(object(<br>    {<br>      name       = string<br>      max_length = optional(number, 60)<br>    }<br>  ))</pre> | <pre>{<br>  "iam_policy": {<br>    "name": "iamp"<br>  },<br>  "iam_role": {<br>    "name": "iamr"<br>  }<br>}</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to the resources created by the module. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_assumable_iam_role"></a> [assumable\_iam\_role](#output\_assumable\_iam\_role) | Crossaccount assumable IAM Role ARN |
| <a name="output_assumable_iam_role_name"></a> [assumable\_iam\_role\_name](#output\_assumable\_iam\_role\_name) | Crossaccount assumable IAM Role name |
| <a name="output_policy_arns"></a> [policy\_arns](#output\_policy\_arns) | ARNs of the attached IAM policies |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
