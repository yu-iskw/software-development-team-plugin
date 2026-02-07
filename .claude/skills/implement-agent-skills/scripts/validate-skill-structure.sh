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

skills_root="${1:-skills}"

if [[ ! -d ${skills_root} ]]; then
	echo "ERROR: Skills directory not found: ${skills_root}" >&2
	exit 1
fi

for skill_dir in "${skills_root}"/*; do
	if [[ ! -d ${skill_dir} ]]; then
		continue
	fi
	if [[ ! -f "${skill_dir}/SKILL.md" ]]; then
		echo "ERROR: Missing SKILL.md in '${skill_dir}'." >&2
		exit 1
	fi
done

echo "OK: Skill structure validation passed (${skills_root})."
