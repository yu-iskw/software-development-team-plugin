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

manifest_path="${1:-.claude-plugin/plugin.json}"

if ! command -v jq >/dev/null 2>&1; then
	echo "ERROR: 'jq' is required but not installed." >&2
	exit 1
fi

if [[ ! -f ${manifest_path} ]]; then
	echo "ERROR: Manifest not found at '${manifest_path}'." >&2
	exit 1
fi

if ! jq -e . "${manifest_path}" >/dev/null; then
	echo "ERROR: Invalid JSON structure in ${manifest_path}." >&2
	exit 1
fi

# Mirrors integration_tests/Dockerfile and integration workflow checks.
for field in name version description; do
	if ! jq -e --arg field "${field}" '.[$field] | type == "string" and length > 0' "${manifest_path}" >/dev/null; then
		echo "ERROR: Missing required non-empty string field '${field}' in ${manifest_path}." >&2
		exit 1
	fi
done

plugin_name="$(jq -r '.name' "${manifest_path}")"
if ! jq -e '.name | test("^[a-z0-9-]+$")' "${manifest_path}" >/dev/null; then
	echo "ERROR: Invalid plugin name '${plugin_name}'. Name must match ^[a-z0-9-]+$ (kebab-case)." >&2
	exit 1
fi

echo "OK: Manifest validation passed (${manifest_path})."
