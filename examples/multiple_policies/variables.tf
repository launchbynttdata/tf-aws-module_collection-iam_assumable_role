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

variable "list_bucket_policy" {
  description = "Custom policy to attach to the assumable role. Document must be valid json."
  type        = string
  default     = null
}

variable "get_bucket_location_policy" {
  description = "Custom policy to attach to the assumable role. Document must be valid json."
  type        = string
  default     = null
}

variable "trusted_role_arns" {
  description = "ARNs of AWS entities who can assume this role."
  type        = list(string)
  default     = []
}
variable "trusted_role_services" {
  description = "Names of AWS Services that can assume this role."
  type        = list(string)
  default     = []
}

### TF Module Resource variables
variable "resource_names_map" {
  description = "A map of key to resource_name that will be used by tf-aws-module_collection-iam_assumable_role module to generate resource names"
  type = map(object(
    {
      name       = string
      max_length = optional(number, 60)
    }
  ))
  default = {
    iam_role = {
      name = "iamr"
    }
    iam_policy = {
      name = "iamp"
    }
  }
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A map of tags to add to the resources created by the module."
}
