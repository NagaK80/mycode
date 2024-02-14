terraform {
  cloud {
    organization = "NVMK"

    workspaces {
      name = "my-example"
    }
  }
}
