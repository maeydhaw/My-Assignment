package test

import (
	"net/http"
	"testing"
	"time"

	"github.com/GoogleCloudPlatform/cloud-foundation-toolkit/infra/blueprint-test/pkg/utils"
)

func TestDeploymentUrl(t *testing.T, url string) error {
	httpRequest, err := http.NewRequest("GET", url, nil)
	if err != nil {
		return err
	}
	maxRetries := 60
	waitBetweenRetries := 4 * time.Second
	assertHttp := utils.NewAssertHTTP(utils.WithHTTPRequestRetries(maxRetries, waitBetweenRetries))
	assertHttp.AssertResponseWithRetry(t, httpRequest, http.StatusOK, "<title>Todo</title>")
	return nil
}
