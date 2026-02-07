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

plugin_dir="${1:-.}"
manifest_path="${plugin_dir}/.claude-plugin/plugin.json"

if [[ ! -f ${manifest_path} ]]; then
	echo "ERROR: Manifest not found: ${manifest_path}" >&2
	exit 1
fi

if ! command -v claude >/dev/null 2>&1; then
	echo "ERROR: 'claude' CLI is not available in PATH." >&2
	exit 1
fi

if command -v jq >/dev/null 2>&1; then
	plugin_name="$(jq -r '.name' "${manifest_path}")"
else
	plugin_name="$(node -p "require(process.argv[1]).name" "${manifest_path}")"
fi

if [[ -z ${plugin_name} ]] || [[ ${plugin_name} == "null" ]]; then
	echo "ERROR: Unable to resolve plugin name from ${manifest_path}." >&2
	exit 1
fi

tmp_dir="$(mktemp -d)"
trap 'rm -rf "$tmp_dir"' EXIT

# Mirrors CI behavior: prefer install+list if available, always run --plugin-dir fallback.
if claude plugin install --help >/dev/null 2>&1; then
	if ! claude plugin install --scope project "${plugin_dir}" >/dev/null 2>&1; then
		echo "ERROR: Plugin installation failed: 'claude plugin install --scope project ${plugin_dir}' exited non-zero." >&2
		exit 1
	fi

	if ! claude plugin list >"${tmp_dir}/plugin-list.txt" 2>&1; then
		echo "ERROR: Failed to run 'claude plugin list' after install." >&2
		cat "${tmp_dir}/plugin-list.txt" >&2 || true
		exit 1
	fi

	if ! grep -F "${plugin_name}" "${tmp_dir}/plugin-list.txt" >/dev/null; then
		echo "ERROR: Installed plugin '${plugin_name}' was not found in 'claude plugin list' output." >&2
		cat "${tmp_dir}/plugin-list.txt" >&2
		exit 1
	fi
fi

if ! claude --plugin-dir "${plugin_dir}" plugin list >"${tmp_dir}/plugin-dir-list.txt" 2>&1; then
	echo "ERROR: 'claude --plugin-dir ${plugin_dir} plugin list' exited non-zero." >&2
	cat "${tmp_dir}/plugin-dir-list.txt" >&2
	exit 1
fi

if ! grep -F "${plugin_name}" "${tmp_dir}/plugin-dir-list.txt" >/dev/null; then
	echo "ERROR: Plugin '${plugin_name}' not found in '--plugin-dir' plugin list output." >&2
	cat "${tmp_dir}/plugin-dir-list.txt" >&2
	exit 1
fi

echo "OK: Plugin load validation passed for '${plugin_name}'."
