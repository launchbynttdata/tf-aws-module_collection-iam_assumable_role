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

data "aws_caller_identity" "current" {}

module "iam_assumable_role" {
  source = "../.."

  assume_iam_role_policies = [var.assume_iam_role_policy]
  trusted_role_arns        = var.trusted_role_arns
  trusted_role_services    = var.trusted_role_services
  resource_names_map       = var.resource_names_map

  tags = var.tags
}
