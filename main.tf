resource "juju_model" "test" {
  name = var.model_name
}

resource "juju_application" "mongodb-k8s" {
  name = "mongodb-k8s"
  model = juju_model.test.name

  charm {
    name = "mongodb-k8s"
    channel = var.channel
    base = "ubuntu@22.04"
  }

  units = 1
  trust = true
}
