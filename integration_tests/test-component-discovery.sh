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

# Validate component directory structure (skills, agents, commands, hooks)
set -euo pipefail

errors=0
warnings=0

echo "Testing component discovery..."

# Check that at least one component directory exists
if [[ ! -d "skills" ]] && [[ ! -d "agents" ]] && [[ ! -d "commands" ]] && [[ ! -d "hooks" ]]; then
	echo "WARNING: No component directories found (skills/, agents/, commands/, hooks/)"
	warnings=$((warnings + 1))
fi

# Verify skills directory structure if it exists
if [[ -d "skills" ]]; then
	skill_count=$(find skills -name "SKILL.md" -type f 2>/dev/null | wc -l | tr -d ' ')
	if [[ ${skill_count} -eq 0 ]]; then
		echo "WARNING: No SKILL.md files found in skills/ directory"
		warnings=$((warnings + 1))
	else
		echo "Found ${skill_count} skill(s)"
	fi
fi

# Verify agents directory structure if it exists
if [[ -d "agents" ]]; then
	agent_count=$(find agents -name "*.md" -type f 2>/dev/null | wc -l | tr -d ' ')
	if [[ ${agent_count} -eq 0 ]]; then
		echo "WARNING: No agent files found in agents/ directory"
		warnings=$((warnings + 1))
	else
		echo "Found ${agent_count} agent(s)"
	fi
fi

# Verify commands directory structure if it exists
if [[ -d "commands" ]]; then
	command_count=$(find commands -name "*.md" -type f 2>/dev/null | wc -l | tr -d ' ')
	if [[ ${command_count} -eq 0 ]]; then
		echo "WARNING: No command files found in commands/ directory"
		warnings=$((warnings + 1))
	else
		echo "Found ${command_count} command file(s)"
	fi
fi

# Verify hooks configuration if it exists
if [[ -f "hooks/hooks.json" ]]; then
	if command -v jq >/dev/null 2>&1; then
		if ! jq -e . hooks/hooks.json >/dev/null 2>&1; then
			echo "ERROR: Invalid JSON in hooks/hooks.json"
			errors=$((errors + 1))
		else
			echo "Hooks configuration is valid"
		fi
	elif command -v node >/dev/null 2>&1; then
		if ! node -e "require('./hooks/hooks.json')" >/dev/null 2>&1; then
			echo "ERROR: Invalid JSON in hooks/hooks.json"
			errors=$((errors + 1))
		else
			echo "Hooks configuration is valid"
		fi
	else
		echo "WARNING: Cannot validate hooks/hooks.json (neither jq nor node available)"
		warnings=$((warnings + 1))
	fi
fi

if [[ ${errors} -gt 0 ]]; then
	echo "Component discovery found ${errors} error(s)"
	exit 1
fi

if [[ ${warnings} -gt 0 ]]; then
	echo "Component discovery completed with ${warnings} warning(s)"
else
	echo "Component discovery test passed"
fi

exit 0
