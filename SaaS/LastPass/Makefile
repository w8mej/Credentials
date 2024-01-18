##################################################################
# Makefile for LastPass API Python user add script
##
# Author: John Menerick <code@haxx.ninja>
# Makefile Version: 1.0
# Date: 12/23
# Revision History:
# 1.0 (12/23) - Initial version
#################################################################


### Usage
# install - Set up virtualenv and install dependencies
# deps - Visualize dependencies
# lint - Lint source code
# docs - Generate documentation
# audit - Audit dependencies
# test - Run tests
# help - Show Help


# Notes:
#   - Running lint and tests together can hit Python recursion limits  
#   - Documentation build may require network access
#   - If you wish to expand this project, please break into multiple Makefiles

#   - Sphinx (for docs)
#   - pytest (for testing)





##################
## Configuration
# Avoid parallel builds
.NOTPARALLEL: 

# Disable Make's implicit rules and variables
MAKEFLAGS += --no-implicit-rules
MAKEFLAGS += --no-builtin-variables

# Set shell
SHELL := /bin/bash

# Python interpreter
# Can override with `make PYTHON=python3.7` 
PYTHON ?= python3

# Main python file
MAIN := lastpass.py

# Unit test file  
TESTS := src/tests/test.py


# Source files
# Finds all .py files in src/ recursively 
SRC := $(wildcard src/**/*.py)

# Requirements files  
REQ_DEV := requirements-dev.txt
REQ_PROD := requirements.txt

# Build artifacts directory
BUILD_DIR := build

# Virtualenv path 
VENV := ${BUILD_DIR}/venv

# Documentation output
DOCS_OUT := docs 


#####################
## Build and Make
# Phony targets that don't produce files
.PHONY: all install lint test docs clean help

# Default target
all: install deps lint test


# Setup the python virtual environment
$(VENV):
	$(PYTHON) -m venv $(VENV)


# Install dependencies and application code 
install: $(VENV)
	$(VENV)/bin/pip install -r $(REQ_PROD) --use-pep517
	$(VENV)/bin/pip install pipdeptree pytest pylint flake8 mypy pydeps coverage types-requests

deps:$(VENV)
    #source $(VENV)/bin/activate
	$(VENV)/bin/pipdeptree --freeze --json


# Linting using pylint
lint: $(VENV)
	$(VENV)/bin/pylint --exit-zero --output-format json --reports y --output ${BUILD_DIR}/pylint.json $(SRC)
	$(VENV)/bin/flake8 --exit-zero --output-file ${BUILD_DIR}/flake8.json --tee
	$(VENV)/bin/mypy  --strict $(SRC)

# Run tests with pytest 
test: $(VENV) 
	$(VENV)/bin/pytest $(TESTS)
	$(VENV)/bin/$(PYTHON) -m unittest $(TESTS)

# Generate documentation with Sphinx
docs: $(VENV)
#	$(VENV)/bin/sphinx-build docs $(DOCS_OUT)
#	$(VENV)@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

# Audit supply chain
audit:
	$(VENV)/bin/pipdeptree --freeze
	$(VENV)/bin/coverage run --source=src -m pytest $(TESTS)
	$(VENV)/bin/coverage run src/lastpass/$(MAIN)
	$(VENV)/bin/coverage report --format=markdown > docs/PythonCoverage.md
	
# Cleanup build artifacts
clean: 
	rm -rf $(BUILD_DIR)/* $(DOCS_OUT)
	rm -rf build/venv


# Help section
help:
	@echo "Makefile for LastPass"
	@echo
	@echo "Usage:"
	@echo "  make [target]"
	@echo
	@echo "Targets:"
	@echo "  install - Set up virtualenv and install dependencies"
	@echo "  deps - Visualize dependencies" 
	@echo "  lint - Lint source code"
	@echo "  docs - Generate documentation"
	@echo "  audit - Audit dependencies"
	@echo "  test - Run tests"
	@echo "  help - Show Help"

	@echo 
	@echo "The default target (make all or make with no arguments) will" 
	@echo "install, visualize deps, lint, generate docs, and test."
