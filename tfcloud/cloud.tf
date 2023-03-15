terraform {
  cloud {
    organization = "KMT"

    workspaces {
      name = "my-example"
    }
  }
}
