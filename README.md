# Overview
This repo contains the smallest possible (that I'm aware of) example of a Terraform module that can
integrate with the patterns outlined in https://github.com/Azure/caf-terraform-landingzones

CAF Terraform provide a very flexible landingzone in the form of 'caf_solution'. However, if you
would like to deploy your own module/landingzone (from here on these terms are used
interchangeably), it can be tricky to know where to start. While you can just drop any module in and
deploy it with Rover, this repo aims to serve two purposes:

* Highlight how to integrate with the CAF/Rover patterns, including working with remote state.
* Serve as a learning tool for those trying to understand how things hang together.

# Usage
From within a Rover environment:

```
git clone https://github.com/brk3/terraform-landingzone-template landingzones/terraform-landingzone-template
/tf/rover/rover.sh \
  -lz /tf/caf/landingzones/terraform-landingzone-template/landingzones \
  -var-folder /tf/caf/landingzones/terraform-landingzone-template/configuration \
  -level level1 \
  -env demo \
  -a plan
```
