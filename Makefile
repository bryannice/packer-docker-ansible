# -----------------------------------------------------------------------------
# Packer Build
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# Internal Variables
# -----------------------------------------------------------------------------

BOLD :=$(shell tput bold)
RED :=$(shell tput setaf 1)
GREEN :=$(shell tput setaf 2)
YELLOW :=$(shell tput setaf 3)
RESET :=$(shell tput sgr0)

# -----------------------------------------------------------------------------
# Checking If Required Environment Variables Were Set
# -----------------------------------------------------------------------------


# -----------------------------------------------------------------------------
# Packer Variables
# -----------------------------------------------------------------------------

TIMESTAMP := $(shell date +%s)

# -----------------------------------------------------------------------------
# Git Variables
# -----------------------------------------------------------------------------

GIT_BRANCH := $(shell git rev-parse --abbrev-ref HEAD)
GIT_REPOSITORY_NAME := $(shell git config --get remote.origin.url | rev | cut -d"." -f2 | cut -d"/" -f1 | rev )
GIT_ACCOUNT_NAME := $(shell git config --get remote.origin.url | rev | cut -d"." -f2 | cut -d"/" -f2 | cut -d":" -f1 | rev)
GIT_SHA := $(shell git log --pretty=format:'%H' -n 1)
GIT_TAG ?= $(shell git describe --always --tags | awk -F "-" '{print $$1}')
GIT_TAG_END ?= HEAD
GIT_VERSION := $(shell git describe --always --tags --long --dirty | sed -e 's/\-0//' -e 's/\-g.......//')
GIT_VERSION_LONG := $(shell git describe --always --tags --long --dirty)

# -----------------------------------------------------------------------------
# Image Variables
# -----------------------------------------------------------------------------

.EXPORT_ALL_VARIABLES:
PKR_VAR_ansible_playbook_path ?= $(ANSIBLE_PLAYBOOK_PATH)
PKR_VAR_base_container_image ?= $(BASE_CONTAINER_IMAGE)
PKR_VAR_container_entrypoint ?= $(CONTAINER_ENTRYPOINT)
PKR_VAR_container_image_repository ?= $(CONTAINER_IMAGE_REPOSITORY)
PKR_VAR_container_image_tag ?= $(CONTAINER_IMAGE_TAG)
PKR_VAR_container_registry_password ?= $(CONTAINER_REGISTRY_PASSWORD)
PKR_VAR_container_registry_server ?= $(CONTAINER_REGISTRY_SERVER)
PKR_VAR_container_registry_username ?= $(CONTAINER_REGISTRY_USERNAME)
PKR_VAR_container_working_directory ?= $(CONTAINER_WORKING_DIRECTORY)

# -----------------------------------------------------------------------------
# FUNCTIONS
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# The first "make" target runs as default.
# -----------------------------------------------------------------------------

.PHONY: help
help:
	@echo "Perform a Packer build."
	@echo 'Usage:'
	@echo '  make <target>'
	@echo
	@echo 'Where:'
	@echo '  target = amazon-ebs, virtualbox-iso, or vmware-iso'

# -----------------------------------------------------------------------------
# Build specific images.
# -----------------------------------------------------------------------------

.PHONY: docker-ansible
docker-ansible:
	packer build -only=docker-ansible .

# -----------------------------------------------------------------------------
# Clean up targets.
# -----------------------------------------------------------------------------

.PHONY: clean
clean:
	rm -rf output-*
	rm -rf packer_cache