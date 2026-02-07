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

config_path="${1:-team-config.json}"

if [[ ! -f ${config_path} ]]; then
	echo "ERROR: Team config file not found: ${config_path}" >&2
	exit 1
fi

if ! command -v jq >/dev/null 2>&1; then
	echo "ERROR: 'jq' is required for team config checks." >&2
	exit 1
fi

if ! jq -e . "${config_path}" >/dev/null; then
	echo "ERROR: Invalid JSON in team config: ${config_path}" >&2
	exit 1
fi

if ! jq -e '.teamName | type == "string" and length > 0' "${config_path}" >/dev/null; then
	echo "ERROR: teamName must be a non-empty string." >&2
	exit 1
fi

if ! jq -e '.members | type == "array" and length > 0' "${config_path}" >/dev/null; then
	echo "ERROR: members must be a non-empty array." >&2
	exit 1
fi

echo "OK: Team config check passed (${config_path})."
