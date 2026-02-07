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
image_tag="claude-plugin-template-smoke-local"

dockerfile_path="${plugin_root}/integration_tests/Dockerfile"
if [[ ! -f ${dockerfile_path} ]]; then
	echo "ERROR: Missing Dockerfile at ${dockerfile_path}." >&2
	exit 1
fi

if ! command -v docker >/dev/null 2>&1; then
	echo "ERROR: 'docker' is required for Level 4 verification." >&2
	exit 1
fi

if ! docker build -f "${dockerfile_path}" -t "${image_tag}" "${plugin_root}"; then
	echo "ERROR: Docker smoke image build failed." >&2
	exit 1
fi

if ! docker run --rm "${image_tag}"; then
	echo "ERROR: Docker smoke container run failed." >&2
	exit 1
fi

echo "OK: CI-parity Docker smoke test passed."
