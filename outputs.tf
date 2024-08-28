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

output "assumable_iam_role" {
  description = "Cross-account assumable IAM Role ARN"
  value       = module.iam_role.iam_role_arn
}

output "assumable_iam_role_name" {
  description = "Cross-account assumable IAM Role name"
  value       = module.iam_role.iam_role_name
}

output "policy_arns" {
  description = "ARNs of the attached IAM policies"
  value       = module.iam_policies[*].arn
}
