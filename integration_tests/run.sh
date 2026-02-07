#!/usr/bin/env bash

# Copyright 2026 yu-iskw
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Main test runner that orchestrates all test scripts
set -euo pipefail

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "${SCRIPT_DIR}/.." || exit 1

# Parse arguments
SKIP_LOADING=false
MANIFEST_ONLY=false
VERBOSE=false
FAIL_FAST=false

while [[ $# -gt 0 ]]; do
	case "$1" in
	--skip-loading)
		SKIP_LOADING=true
		shift
		;;
	--manifest-only)
		MANIFEST_ONLY=true
		shift
		;;
	--verbose | -v)
		VERBOSE=true
		shift
		;;
	--fail-fast)
		FAIL_FAST=true
		shift
		;;
	--help | -h)
		echo "Usage: $0 [OPTIONS]"
		echo ""
		echo "Options:"
		echo "  --skip-loading      Skip plugin loading tests"
		echo "  --manifest-only     Run only manifest validation"
		echo "  --verbose, -v       Enable verbose output"
		echo "  --fail-fast         Stop on first failure"
		echo "  --help, -h          Show this help message"
		exit 0
		;;
	*)
		echo "Unknown option: $1"
		echo "Run $0 --help for usage information"
		exit 1
		;;
	esac
done

# Track test results
FAILED_TESTS=0
PASSED_TESTS=0

run_test() {
	test_name="$1"
	test_script="$2"

	if [[ ${VERBOSE} == true ]]; then
		echo ""
		echo "=== Running ${test_name} ==="
	fi

	if "${SCRIPT_DIR}/${test_script}"; then
		PASSED_TESTS=$((PASSED_TESTS + 1))
		if [[ ${VERBOSE} == true ]]; then
			echo "? ${test_name} passed"
		fi
		return 0
	else
		FAILED_TESTS=$((FAILED_TESTS + 1))
		echo "? ${test_name} failed"
		if [[ ${FAIL_FAST} == true ]]; then
			exit 1
		fi
		return 1
	fi
}

run_test_nonfatal() {
	set +e
	run_test "$1" "$2"
	set -e
}

echo "Starting integration tests..."

# Test 1: Validate manifest
run_test_nonfatal "Manifest validation" "validate-manifest.sh"

if [[ ${MANIFEST_ONLY} == true ]]; then
	echo ""
	echo "Manifest-only mode: skipping remaining tests"
else
	# Test 2: Plugin loading (unless skipped)
	if [[ ${SKIP_LOADING} == false ]]; then
		run_test_nonfatal "Plugin loading" "test-plugin-loading.sh"
	else
		echo "Skipping plugin loading tests (--skip-loading)"
	fi

	# Test 3: Component discovery
	run_test_nonfatal "Component discovery" "test-component-discovery.sh"
fi

# Summary
echo ""
echo "=== Test Summary ==="
echo "Passed: ${PASSED_TESTS}"
if [[ ${FAILED_TESTS} -gt 0 ]]; then
	echo "Failed: ${FAILED_TESTS}"
	exit 1
else
	echo "All tests passed!"
	exit 0
fi
