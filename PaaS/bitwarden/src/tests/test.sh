#!/bin/bash

# Test Script for BitWarden CLI User Creation Bash Script

# BitWarden CLI Test - Test create a user with defined metadata
# Description: This test script is designed to safely test to add a BitWarden CLI user using a predefined set of commands.
# It includes basic security measures to prevent arbitrary command execution.

# Author: John Menerick
# Organization: Freeside
# Date: 11/2023
# Version: 1.0

#Copyright 2023 code@haxx.ninja

#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# Exit immediately if a command exits with a non-zero status.
set -e

# Treat unset variables as an error when substituting.
set -u

# Make the script exit if any command within a pipeline fails.
set -o pipefail

# Path to the script being tested
SCRIPT="../bitwarden/bitwarden_cli.sh" # Replace with your actual script's filename

# Function to run a test
run_test() {
	local description="$1"
	local expected="$2"

	echo "Testing: $description"
	result=$($SCRIPT 2>&1) # Captures both stdout and stderr

	if [[ "$result" == *"$expected"* ]]; then
		echo "PASS: $description"
	else
		echo "FAIL: $description"
		echo "Expected: '$expected', but got: '$result'"
	fi
}

# Test cases
# Testing the allowed command
run_test "Allowed Command Execution" "Executing command: bw create item '{"organizationId": "3c89a31d-f1cc-4673-8d5a-ae2700f9860d", "collectionIds": ["c4e31257-f3e1-4b13-895a-ae2700f9884e", "fcdd8536-539a-422f-8507-af0001348815"], "folderId": null, "type": 1, "name": "thesorrow", "notes": "John Meneick account information and temp. creds. please force to reset", "favorite": false, "fields": [{"name": "Security Question", "value": "ChangeMePleaseRightNowToYou", "type": 0}], "login": {"uris": [{"match": 0, "uri": "https://bitwarden.localhost/login"}, {"match": 1, "uri": "https://bitwarden.localhost/login"}], "username": "thesorrow", "password": "thisisinsecuresoCHANGEM3!", "totp": null}, "reprompt": 1}'"

# Testing no command provided
run_test "No Command Provided" "Usage: $0"
