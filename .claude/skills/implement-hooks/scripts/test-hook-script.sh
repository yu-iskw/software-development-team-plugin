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

script_path="${1-}"

if [[ -z ${script_path} ]]; then
	echo "Usage: $0 <script-path>" >&2
	exit 1
fi

if [[ ! -f ${script_path} ]]; then
	echo "ERROR: Script not found: ${script_path}" >&2
	exit 1
fi

if [[ ! -x ${script_path} ]]; then
	echo "ERROR: Script is not executable: ${script_path}" >&2
	exit 1
fi

if ! "${script_path}" >/dev/null 2>&1; then
	echo "ERROR: Script execution failed: ${script_path}" >&2
	exit 1
fi

echo "OK: Hook script smoke test passed (${script_path})."
