#!/usr/bin/env bash
set -euo pipefail

plugin_root="${CLAUDE_PLUGIN_ROOT:-$(pwd)}"
log_file="${plugin_root}/.claude-plugin/hook-events.log"
mkdir -p "$(dirname "${log_file}")"

timestamp="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
echo "${timestamp} command hook invoked" >>"${log_file}"
