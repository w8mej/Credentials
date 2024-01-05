#!/bin/bash

# CyberArk CLI - create a user with defined metadata
# Description: This script is designed to safely add a CyberArk CLI user using a predefined set of commands.
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

# Function: run_command
# Description: Executes a command if it is in the list of allowed commands.  Not secure and easily bypassed but does the job against script kiddies
# Arguments:
#   $1 - The command to execute.
run_command() {
	local command="$1"

	# Define a list of allowed commands for execution.
	local allowed_commands=("pac user add -u thesorrow -p thisisinsecuresoCHANGEM3! -f FirstName -l LastName -g GroupName")

	# Check if the command is in the allowed list
	# If the command is allowed, execute it.
	# If not, print an error message and exit with status 1.
	if [[ " ${allowed_commands[*]} " == *" $command "* ]]; then
		echo "Executing command"
		$command
	else
		echo "Error: Command not allowed."
		exit 1
	fi
}

# Function: main
# Description: Main function to handle script execution logic.
# It takes a command as an argument and passes it to run_command function.
# Arguments:
#   $1 - The command to be executed.
main() {
	# Check if a command argument is provided.
	# If no argument is provided, print the usage message and exit with status 1.
	if [ "$#" -eq 0 ]; then
		echo "Usage: $0 " # add this section after modifying to run in sensitive environments and workloads:  <command>"
		#echo "Allowed commands are: ls, date, whoami, uptime" see above comment about sensitive environments.
		exit 1
	fi

	# Call run_command with the provided argument.
	run_command "pac user add -u thesorrow -p thisisinsecuresoCHANGEM3! -f FirstName -l LastName -g GroupName"
}

# Starting point of the script.
# Calls the main function with the first script argument.
main "$0"
