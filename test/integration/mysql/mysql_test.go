package mysql

import (
	"testing"
	"time"

	"github.com/GoogleCloudPlatform/cloud-foundation-toolkit/infra/blueprint-test/pkg/tft"
	test "github.com/GoogleCloudPlatform/terraform-google-three-tier-web-app/test/integration"
	"github.com/stretchr/testify/assert"
)

// Retry if these errors are encountered.
var retryErrors = map[string]string{
	// Error for Cloud SQL not deleting databases.
	".*is being accessed by other users.*": "Database will eventually let you delete it",
	".*SERVICE_DISABLED.*":                 "Service enablement is eventually consistent",
}

func TestMysql(t *testing.T) {
	blueprintTest := tft.NewTFBlueprintTest(t, tft.WithRetryableTerraformErrors(retryErrors, 10, time.Minute))

	blueprintTest.DefineVerify(func(assert *assert.Assertions) {
		// DefaultVerify asserts no resource changes exist after apply.
		// It helps ensure that a second "terraform apply" wouldn't result in resource deletions/replacements.
		blueprintTest.DefaultVerify(assert)

		deploymentUrl := blueprintTest.GetStringOutput("endpoint")
		test.TestDeploymentUrl(t, deploymentUrl)
	})

	blueprintTest.Test()
}
