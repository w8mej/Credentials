package test

import (
    "testing"
    "github.com/gruntwork-io/terratest/modules/terraform"
    "github.com/stretchr/testify/assert"
)

func TestCloudflareUserResource(t *testing.T) {
    t.Parallel()

    terraformOptions := &terraform.Options{
        // The path to where your Terraform code is located
        TerraformDir: "../cloudflare",

        Vars: map[string]interface{}{
            "account_id": "your_cloudflare_account_id",
            "user_email": "user@example.com",
            "status":     "pending",
            "role_ids":   []string{"role_id1", "role_id2"},
        },
    }

    defer terraform.Destroy(t, terraformOptions)
    terraform.InitAndApply(t, terraformOptions)

    // Test Case 1: Verify Cloudflare Account Member Email
    actualUserEmail := terraform.Output(t, terraformOptions, "user_email")
    expectedUserEmail := "user@example.com"
    assert.Equal(t, expectedUserEmail, actualUserEmail)

    // Test Case 2: Verify Cloudflare Account Member Status
    actualStatus := terraform.Output(t, terraformOptions, "status")
    expectedStatus := "pending"  // Replace with the expected status
    assert.Equal(t, expectedStatus, actualStatus)

    // Test Case 3: Verify Cloudflare Account Member Role IDs
    actualRoleIds := terraform.OutputList(t, terraformOptions, "role_ids")
    expectedRoleIds := []string{"role_id1", "role_id2"}  // Replace with the expected role IDs
    assert.ElementsMatch(t, expectedRoleIds, actualRoleIds)
}
