package common

import (
	"context"
	"testing"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/config"
	"github.com/aws/aws-sdk-go-v2/service/iam"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/launchbynttdata/lcaf-component-terratest/types"
	"github.com/stretchr/testify/require"
)

func TestIamRole(t *testing.T, ctx types.TestContext) {
	iamClient := iam.NewFromConfig(GetAWSConfig(t))

	t.Run("TestDoesSingleRoleExist", func(t *testing.T) {
		ctx.EnabledOnlyForTests(t, "complete")

		roleArn := terraform.Output(t, ctx.TerratestTerraformOptions(), "assumable_iam_role")
		roleName := terraform.Output(t, ctx.TerratestTerraformOptions(), "assumable_iam_role_name")
		policyArns := terraform.OutputList(t, ctx.TerratestTerraformOptions(), "policy_arns")

		CheckRole(t, iamClient, roleName, roleArn)
		CheckPolicies(t, iamClient, roleName, policyArns)
	})

	t.Run("TestDoMultiplePoliciesExist", func(t *testing.T) {
		ctx.EnabledOnlyForTests(t, "multiple_policies")

		roleArn := terraform.Output(t, ctx.TerratestTerraformOptions(), "assumable_iam_role")
		roleName := terraform.Output(t, ctx.TerratestTerraformOptions(), "assumable_iam_role_name")
		policyArns := terraform.OutputList(t, ctx.TerratestTerraformOptions(), "policy_arns")

		CheckRole(t, iamClient, roleName, roleArn)
		CheckPolicies(t, iamClient, roleName, policyArns)
	})

	t.Run("TestDoMultipleRolesExist", func(t *testing.T) {
		ctx.EnabledOnlyForTests(t, "multiple_roles")

		firstRoleArn := terraform.Output(t, ctx.TerratestTerraformOptions(), "first_role_arn")
		secondRoleArn := terraform.Output(t, ctx.TerratestTerraformOptions(), "second_role_arn")
		firstRoleName := terraform.Output(t, ctx.TerratestTerraformOptions(), "first_role_name")
		secondRoleName := terraform.Output(t, ctx.TerratestTerraformOptions(), "second_role_name")
		firstRolePolicyArns := terraform.OutputList(t, ctx.TerratestTerraformOptions(), "first_role_policy_arns")
		secondRolePolicyArns := terraform.OutputList(t, ctx.TerratestTerraformOptions(), "second_role_policy_arns")

		CheckRole(t, iamClient, firstRoleName, firstRoleArn)
		CheckPolicies(t, iamClient, firstRoleName, firstRolePolicyArns)

		CheckRole(t, iamClient, secondRoleName, secondRoleArn)
		CheckPolicies(t, iamClient, secondRoleName, secondRolePolicyArns)
	})
}

func GetAWSConfig(t *testing.T) (cfg aws.Config) {
	cfg, err := config.LoadDefaultConfig(context.TODO())
	require.NoErrorf(t, err, "unable to load SDK config, %v", err)
	return cfg
}

func GetRole(t *testing.T, c *iam.Client, roleName string) *iam.GetRoleOutput {
	output, err := c.GetRole(context.TODO(), &iam.GetRoleInput{
		RoleName: &roleName,
	})

	require.NoErrorf(t, err, "unable to get role, %v", err)
	return output
}

func CheckRole(t *testing.T, c *iam.Client, roleName string, roleArn string) {
	output := GetRole(t, c, roleName)
	require.Equal(t, roleArn, *output.Role.Arn, "Expected ARN to be %s, got %s", roleArn, *output.Role.Arn)
}

func GetAttachedPolicies(t *testing.T, c *iam.Client, roleName string) *iam.ListAttachedRolePoliciesOutput {
	output, err := c.ListAttachedRolePolicies(context.TODO(), &iam.ListAttachedRolePoliciesInput{
		RoleName: &roleName,
	})

	require.NoErrorf(t, err, "unable to list attached role policies, %v", err)
	return output
}

func CheckPolicies(t *testing.T, c *iam.Client, roleName string, policyArns []string) {
	policyOutput := GetAttachedPolicies(t, c, roleName)
	require.Equal(t, len(policyArns), len(policyOutput.AttachedPolicies), "Expected %d policies, got %d", len(policyArns), len(policyOutput.AttachedPolicies))
	for _, policy := range policyOutput.AttachedPolicies {
		require.Contains(t, policyArns, *policy.PolicyArn, "Expected policy %s to be attached, but it was not", *policy.PolicyArn)
	}
}
