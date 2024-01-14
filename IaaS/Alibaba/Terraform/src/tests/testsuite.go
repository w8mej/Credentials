package test

import (
    "testing"
    "github.com/gruntwork-io/terratest/modules/terraform"
    "github.com/stretchr/testify/assert"
)

func TestAlicloudRAMResources(t *testing.T) {
    t.Parallel()

    terraformOptions := &terraform.Options{
        TerraformDir: "../alibaba_ram/",

        Vars: map[string]interface{}{
        	"ram_user_name": "expected_user_name",
			"ram_access_key_id": "actualRamAccessKeyId",
			"ram_user_groups": "expectedGroups",
			"ram_user_policies": "expectedPolicies"
        },
    }

    defer terraform.Destroy(t, terraformOptions)
    terraform.InitAndApply(t, terraformOptions)

    // Test Case 1: RAM User Creation
    actualRamUserName := terraform.Output(t, terraformOptions, "ram_user_name")
    expectedRamUserName := "expected_user_name" // Replace with expected name
    assert.Equal(t, expectedRamUserName, actualRamUserName)

    // Test Case 2: RAM Access Key Creation
    actualRamAccessKeyId := terraform.Output(t, terraformOptions, "ram_access_key_id")
    assert.NotEmpty(t, actualRamAccessKeyId)

    // Test Case 3: Group Memberships
    // Assuming you have an output that lists groups the user is a member of
    actualGroups := terraform.OutputList(t, terraformOptions, "ram_user_groups")
    expectedGroups := []string{"group1", "group2"} // Replace with expected groups
    assert.ElementsMatch(t, expectedGroups, actualGroups)

    // Test Case 4: Policy Attachments
    // Assuming you have an output that lists policies attached to the user
    actualPolicies := terraform.OutputList(t, terraformOptions, "ram_user_policies")
    expectedPolicies := []string{"policy1", "policy2"} // Replace with expected policies
    assert.ElementsMatch(t, expectedPolicies, actualPolicies)
}
