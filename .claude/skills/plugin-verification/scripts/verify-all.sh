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

script_dir="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd)"
plugin_root="${1:-.}"

echo "[1/4] Manifest validation"
"${script_dir}/verify-manifest.sh" "${plugin_root}/.claude-plugin/plugin.json"

echo "[2/4] Structure validation"
"${script_dir}/verify-structure.sh" "${plugin_root}"

echo "[3/4] Load validation"
"${script_dir}/verify-load.sh" "${plugin_root}"

echo "[4/4] CI-parity Docker smoke test"
"${script_dir}/verify-ci.sh" "${plugin_root}"

echo "OK: All verification levels passed."
