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

skill_file="${1-}"

if [[ -z ${skill_file} ]]; then
	echo "Usage: $0 <path-to-SKILL.md>" >&2
	exit 1
fi

if [[ ! -f ${skill_file} ]]; then
	echo "ERROR: File not found: ${skill_file}" >&2
	exit 1
fi

if ! command -v rg >/dev/null 2>&1; then
	echo "ERROR: 'rg' is required for frontmatter checks." >&2
	exit 1
fi

if ! rg -q '^---$' "${skill_file}"; then
	echo "ERROR: Missing frontmatter delimiters in ${skill_file}" >&2
	exit 1
fi

if ! rg -q '^name:\s*.+$' "${skill_file}"; then
	echo "ERROR: Missing required frontmatter field: name" >&2
	exit 1
fi

if ! rg -q '^description:\s*.+$' "${skill_file}"; then
	echo "ERROR: Missing required frontmatter field: description" >&2
	exit 1
fi

echo "OK: Skill frontmatter check passed (${skill_file})."
