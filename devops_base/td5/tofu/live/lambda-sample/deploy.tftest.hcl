run "deploy" {
  command = apply
  module {
    source = "./"
  }
}

run "validate" {
  command = apply

  
  module {
    source = "../../modules/test-endpoint"
  }

  variables {
    endpoint = run.deploy.api_endpoint
  }
  assert {
    condition     = data.http.test_endpoint.status_code == 200
    error_message = "Expected status 200 but got ${data.http.test_endpoint.status_code}"
  }

  assert {
    condition     = jsondecode(data.http.test_endpoint.response_body).message == "Hello from JSON!"
    error_message = "Unexpected JSON body: ${data.http.test_endpoint.response_body}"
  }
 
  assert {
    condition     = data.http.test_endpoint_not_found.status_code == 404
    error_message = "Expected 404 for non-existent path, got ${data.http.test_endpoint_not_found.status_code}"
  }

  assert {
    condition     = jsondecode(data.http.test_endpoint_not_found.response_body).error == "Resource not found"
    error_message = "Unexpected error response: ${data.http.test_endpoint_not_found.response_body}"
  }
}
