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

module "first_role" {
  source = "../.."

  assume_iam_role_policies = [var.list_bucket_policy]
  logical_product_family   = var.logical_product_family
  logical_product_service  = "${var.logical_product_service}_first"
  trusted_role_arns        = var.trusted_role_arns
  trusted_role_services    = var.trusted_role_services

  resource_names_map = {
    iam_role = {
      name = "first-role"
    }
    iam_policy = {
      name = "first-plcy"
    }
  }

  tags = var.tags
}


module "second_role" {
  source = "../.."

  assume_iam_role_policies = [var.get_bucket_location_policy]
  logical_product_family   = var.logical_product_family
  logical_product_service  = "${var.logical_product_service}_second"
  trusted_role_arns        = var.trusted_role_arns
  trusted_role_services    = var.trusted_role_services

  resource_names_map = {
    iam_role = {
      name = "second-role"
    }
    iam_policy = {
      name = "second-plcy"
    }
  }

  tags = var.tags
}
