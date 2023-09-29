name: Validate changes

on:
  push:
    branches-ignore:
      - 'main'

jobs:
  fmt-check:
    runs-on: ubuntu-latest
    name: Check formatting of terraform files
    steps:
      - name: Checkout
        uses: actions/checkout@v3

      - name: terraform fmt
        uses: dflook/terraform-fmt-check@v1
        with:
          path: terraform

  validate:
    runs-on: ubuntu-latest
    name: Validate terraform configuration
    steps:
      - name: Checkout
        uses: actions/checkout@v3

      - name: terraform validate
        uses: dflook/terraform-validate@v1
        with:
          path: terraform