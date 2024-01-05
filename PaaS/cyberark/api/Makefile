##################################################################
# Makefile for CyberArk template script
##
# Author: John Menerick <code@haxx.ninja>
# Makefile Version: 1.0
# Date: 10/23
# Revision History:
# 1.0 (10/23) - Initial version
#################################################################


### Usage
# install - Set up virtualenv and install dependencies
# deps - Visualize dependencies
# lint - Lint source code
# format - Format source code
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
MAIN := cyberark.py

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
.PHONY: all format install lint test docs clean help

# Default target
all: install format deps lint test


# Setup the python virtual environment
$(VENV):
	$(PYTHON) -m venv $(VENV)


# Install dependencies and application code 
install: $(VENV)
	$(VENV)/bin/pip install -r $(REQ_PROD) --use-pep517
	$(VENV)/bin/pip install pipdeptree pytest pylint mypy pydeps coverage autopep8 bandit cohesion radon ruff yapf

deps:$(VENV)
    #source $(VENV)/bin/activate
	$(VENV)/bin/pipdeptree --freeze --json


# Linting using pylint
lint: $(VENV)
	$(VENV)/bin/pylint --exit-zero --output-format json --reports y --output ${BUILD_DIR}/pylint.json $(SRC)
	-$(VENV)/bin/mypy  --strict $(SRC)
	-$(VENV)/bin/ruff check src/
	$(VENV)/bin/cohesion -d src
	semgrep scan --config auto
	-$(VENV)bin/bandit -r ./

# Format the code and associated items
format: $(VENV)
	$(VENV)/bin/autopep8 --in-place --aggressive --aggressive $(SRC) $(TESTS)
	$(VENV)/bin/yapf $(SRC) $(TESTS)
	$(VENV)/bin/radon mi src/
	$(VENV)/bin/radon cc src/
	$(VENV)/bin/radon raw src/
	$(VENV)/bin/radon hal src/


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
	$(VENV)/bin/coverage run src/cyberark/$(MAIN)
	$(VENV)/bin/coverage report --format=markdown > docs/PythonCoverage.md
	
# Cleanup build artifacts
clean: 
	rm -rf $(BUILD_DIR)/* $(DOCS_OUT)
	rm -rf build/venv
	find . -type d -name '__pycache__' -exec rm -rf {} +


# Help section
help:
	@echo "Makefile for CyberArk"
	@echo
	@echo "Usage:"
	@echo "  make [target]"
	@echo
	@echo "Targets:"
	@echo "  install - Set up virtualenv and install dependencies"
	@echo "  deps - Visualize dependencies" 
	@echo "  lint - Lint source code"
	@echo "  format - Format source code"
	@echo "  docs - Generate documentation"
	@echo "  audit - Audit dependencies"
	@echo "  test - Run tests"
	@echo "  help - Show Help"

	@echo 
	@echo "The default target (make all or make with no arguments) will" 
	@echo "install, visualize deps, format, lint, generate docs, and test."
