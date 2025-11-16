# main.tf in test-endpoint module
data "http" "test_endpoint" {
url = var.endpoint
}
data "http" "test_endpoint_not_found" {
  url = "${var.endpoint}/does-not-exist"
}


output "status_code" {
value = data.http.test_endpoint.status_code
}
output "response_body" {
value = data.http.test_endpoint.response_body
}