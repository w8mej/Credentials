package test

import (
    "testing"
    "github.com/gruntwork-io/terratest/modules/terraform"
    "github.com/stretchr/testify/assert"
)

func TestOCIUserResources(t *testing.T) {
    t.Parallel()

    terraformOptions := &terraform.Options{
        // The path to where your Terraform code is located
        TerraformDir: "../oci/",

        Vars: map[string]interface{}{
            "oci_user_name":     "thesorrow",
            "oci_user_comments": "Test user",
            "oci_user_email":    "thesorrow@example.com",
            "oci_user_groups":   []string{"group_ocid1", "group_ocid2"},
            "ssh_key":           "ssh-rsa AAAAB3Nza...",
            "compartment_id":    "ocid1.compartment.oc1..example",
        },
    }

    defer terraform.Destroy(t, terraformOptions)
    terraform.InitAndApply(t, terraformOptions)

    // Test Case 1: OCI User Creation
    actualUserName := terraform.Output(t, terraformOptions, "oci_user_name")
    expectedUserName := "thesorrow"
    assert.Equal(t, expectedUserName, actualUserName)

    // Test Case 2: OCI User Group Membership
    actualGroups := terraform.OutputList(t, terraformOptions, "oci_user_groups")
    expectedGroups := []string{"group_ocid1", "group_ocid2"}
    assert.ElementsMatch(t, expectedGroups, actualGroups)

    // Test Case 3: OCI API Key Creation
    // Since the actual API key value is sensitive, we might just check if the output is not empty
    actualAPIKey := terraform.Output(t, terraformOptions, "oci_api_key")
    assert.NotEmpty(t, actualAPIKey)
}
