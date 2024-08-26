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

output "first_role_arn" {
  description = "Crossaccount assumable IAM Role ARN"
  value       = module.first_role.assumable_iam_role
}

output "first_role_name" {
  description = "Crossaccount assumable IAM Role name"
  value       = module.first_role.assumable_iam_role_name
}

output "first_role_policy_arns" {
  description = "ARNs of the attached IAM policies"
  value       = module.first_role.policy_arns
}

output "second_role_arn" {
  description = "Crossaccount assumable IAM Role ARN"
  value       = module.second_role.assumable_iam_role
}

output "second_role_name" {
  description = "Crossaccount assumable IAM Role name"
  value       = module.second_role.assumable_iam_role_name
}

output "second_role_policy_arns" {
  description = "ARNs of the attached IAM policies"
  value       = module.second_role.policy_arns
}
