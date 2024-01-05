##################################################################
# Makefile for BitWarden CLI script
##
# Author: John Menerick <code@haxx.ninja>
# Makefile Version: 1.0
# Date: 10/23
# Revision History:
# 1.0 (10/23) - Initial version
#################################################################


### Usage
# install - Set up and install dependencies
# deps - Visualize dependencies
# lint - Lint source code
# format - Format source code
# docs - Generate documentation
# audit - Audit dependencies
# test - Run tests
# help - Show Help


# Notes:
#   - Running lint and tests together can hit recursion limits  
#   - Documentation build may require network access
#   - If you wish to expand this project, please break into multiple Makefiles

#   - Sphinx (for docs)






##################
## Configuration
# Avoid parallel builds
.NOTPARALLEL: 

# Disable Make's implicit rules and variables
MAKEFLAGS += --no-implicit-rules
MAKEFLAGS += --no-builtin-variables

# Set shell
SHELL := /bin/bash


# Main file
MAIN := cyberark_cli.sh

# Unit test file  
TESTS := src/tests/test.sh


# Source files
# Finds all .py files in src/ recursively 
SRC := $(wildcard src/**/*.sh)


# Build artifacts directory
BUILD_DIR := build

# Documentation output
DOCS_OUT := docs 


#####################
## Build and Make
# Phony targets that don't produce files
.PHONY: all format install lint test docs clean help

# Default target
all: install format deps lint test


# Install dependencies and application code 
install: $()
	brew install shfmt

deps:$()



# Linting
lint: $()
	-shellcheck --enable=all $(SRC)

# Format the code and associated items
format: $()
	shfmt -l -w .


# Run tests with pytest 
test: $() 
	$(TESTS)

# Generate documentation with Sphinx
docs: $()
#	$()/bin/sphinx-build docs $(DOCS_OUT)
#	$()@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

# Audit supply chain
audit:

	
# Cleanup build artifacts
clean: 
	rm -rf $(BUILD_DIR)/* $(DOCS_OUT)
	rm -rf build/


# Help section
help:
	@echo "Makefile for BitWarden CLI"
	@echo
	@echo "Usage:"
	@echo "  make [target]"
	@echo
	@echo "Targets:"
	@echo "  install - Set up  and install dependencies"
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
