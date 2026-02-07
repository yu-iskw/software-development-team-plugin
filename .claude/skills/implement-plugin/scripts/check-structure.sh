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

plugin_root="${1:-.}"
manifest_path="${plugin_root}/.claude-plugin/plugin.json"

if [[ ! -f ${manifest_path} ]]; then
	echo "ERROR: Missing manifest at ${manifest_path}." >&2
	exit 1
fi

for d in skills agents hooks; do
	if [[ ! -d "${plugin_root}/${d}" ]]; then
		echo "ERROR: Missing required directory '${d}/' at plugin root." >&2
		exit 1
	fi
done

if [[ ! -f "${plugin_root}/hooks/hooks.json" ]]; then
	echo "ERROR: Missing hooks registry at hooks/hooks.json." >&2
	exit 1
fi

# Common mistake: component directories nested under .claude-plugin/
for d in skills agents hooks commands; do
	if [[ -d "${plugin_root}/.claude-plugin/${d}" ]]; then
		echo "ERROR: Misplaced '${d}/' under .claude-plugin/. Move it to plugin root." >&2
		exit 1
	fi
done

# Every skill directory should contain SKILL.md.
if [[ -d "${plugin_root}/skills" ]]; then
	for skill_dir in "${plugin_root}/skills"/*; do
		if [[ ! -d ${skill_dir} ]]; then
			continue
		fi
		if [[ ! -f "${skill_dir}/SKILL.md" ]]; then
			echo "ERROR: Skill '${skill_dir}' is missing SKILL.md." >&2
			exit 1
		fi
	done

	# Detect misplaced top-level skill markdown files.
	for bad_file in "${plugin_root}/skills"/*.md; do
		if [[ ! -f ${bad_file} ]]; then
			continue
		fi
		echo "ERROR: Misplaced skill file '${bad_file}'. Expected skills/<name>/SKILL.md." >&2
		exit 1
	done
fi

# Agent definitions should be markdown files.
if [[ -d "${plugin_root}/agents" ]]; then
	for bad_file in "${plugin_root}/agents"/*; do
		if [[ ! -f ${bad_file} || ${bad_file} == *.md ]]; then
			continue
		fi
		echo "ERROR: Non-markdown file in agents/: ${bad_file}" >&2
		exit 1
	done
fi

echo "OK: Directory structure checks passed (${plugin_root})."
