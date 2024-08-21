// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

module "iam_policies" {
  source = "git::https://github.com/launchbynttdata/tf-aws-module_collection-iam_policy.git?ref=1.0.0"

  count = length(var.assume_iam_role_policies)

  policy    = var.assume_iam_role_policies[count.index]
  role_name = module.resource_names["iam_role"].standard

  naming_prefix      = var.naming_prefix
  environment        = var.environment
  environment_number = var.environment_number
  region             = var.region
  resource_number    = var.resource_number

  resource_names_map = {
    iam_policy = {
      name = "${var.resource_names_map["iam_policy"].name}_${count.index}"
    }
  }

  tags = var.tags
}

module "iam_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "~> 5.22.0"

  create_role            = true
  role_name              = module.resource_names["iam_role"].standard
  allow_self_assume_role = var.allow_self_assume_role
  role_requires_mfa      = false

  trusted_role_arns       = var.trusted_role_arns
  trusted_role_services   = var.trusted_role_services
  role_sts_externalid     = var.role_sts_externalid
  custom_role_policy_arns = module.iam_policies.*.arn

  tags = merge(local.tags, { resource_name = module.resource_names["iam_role"].standard })
}

module "resource_names" {
  source = "git::https://github.com/launchbynttdata/tf-launch-module_library-resource_name.git?ref=1.0.0"

  for_each = var.resource_names_map

  logical_product_family  = var.logical_product_family
  logical_product_service = var.logical_product_service
  region                  = join("", split("-", var.region))
  class_env               = var.environment
  cloud_resource_type     = each.value.name
  instance_env            = var.environment_number
  instance_resource       = var.resource_number
  maximum_length          = each.value.max_length
}
