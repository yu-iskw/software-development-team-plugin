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

set -euo pipefail

hooks_path="${1:-hooks/hooks.json}"

if [[ ! -f ${hooks_path} ]]; then
	echo "ERROR: Hook config not found at '${hooks_path}'." >&2
	exit 1
fi

if ! command -v jq >/dev/null 2>&1; then
	echo "ERROR: 'jq' is required to validate hooks JSON." >&2
	exit 1
fi

if ! jq -e . "${hooks_path}" >/dev/null; then
	echo "ERROR: Invalid JSON in '${hooks_path}'." >&2
	exit 1
fi

if ! jq -e '.version == "1"' "${hooks_path}" >/dev/null; then
	echo "ERROR: hooks version must be '1'." >&2
	exit 1
fi

if ! jq -e '.hooks | type == "array"' "${hooks_path}" >/dev/null; then
	echo "ERROR: hooks must be an array." >&2
	exit 1
fi

if ! jq -e '.hooks | length == 0 or (all(.[]; has("event") and has("hooks")))' "${hooks_path}" >/dev/null; then
	echo "ERROR: each hook entry must include 'event' and 'hooks' when hooks are configured." >&2
	exit 1
fi

echo "OK: Hook configuration validation passed (${hooks_path})."
