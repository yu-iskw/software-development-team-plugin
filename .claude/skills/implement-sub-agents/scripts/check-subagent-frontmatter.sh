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

agent_file="${1-}"

if [[ -z ${agent_file} ]]; then
	echo "Usage: $0 <path-to-agent.md>" >&2
	exit 1
fi

if [[ ! -f ${agent_file} ]]; then
	echo "ERROR: File not found: ${agent_file}" >&2
	exit 1
fi

if ! rg -q '^---$' "${agent_file}"; then
	echo "ERROR: Missing frontmatter delimiters in ${agent_file}" >&2
	exit 1
fi

if ! rg -q '^name:\s*.+$' "${agent_file}"; then
	echo "ERROR: Missing frontmatter field: name" >&2
	exit 1
fi

if ! rg -q '^description:\s*.+$' "${agent_file}"; then
	echo "ERROR: Missing frontmatter field: description" >&2
	exit 1
fi

echo "OK: Sub-agent frontmatter check passed (${agent_file})."
