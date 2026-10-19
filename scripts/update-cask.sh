#!/usr/bin/env bash
set -euo pipefail

repo="${1:?usage: update-cask.sh <owner/repo> <cask> <description> [output]}"
name="${2:?cask name}"
desc="${3:?description}"
out="${4:-Casks/$name.rb}"

if ! tag="$(gh release view -R "$repo" --json tagName --jq .tagName 2>/dev/null)"; then
	echo "no published release in $repo; nothing to do"
	exit 0
fi
version="${tag#v}"
sums="$(gh release download "$tag" -R "$repo" -p checksums.txt -O -)"

sha() {
	local file="${name}_${version}_$1.tar.gz"
	local value
	value="$(printf '%s\n' "$sums" | awk -v f="$file" '$2 == f { print $1 }')"
	if [ -z "$value" ]; then
		echo "checksums.txt of $tag has no $file" >&2
		exit 1
	fi
	printf '%s' "$value"
}

block() {
	printf '    on_%s do\n      sha256 "%s"\n      url "https://github.com/%s/releases/download/v#{version}/%s_#{version}_%s.tar.gz"\n    end\n' "$1" "$(sha "$2")" "$repo" "$name" "$2"
}

mkdir -p "$(dirname "$out")"
{
	printf 'cask "%s" do\n  version "%s"\n\n' "$name" "$version"
	printf '  on_macos do\n'
	block arm darwin_arm64
	block intel darwin_amd64
	printf '  end\n  on_linux do\n'
	block arm linux_arm64
	block intel linux_amd64
	printf '  end\n\n'
	printf '  name "%s"\n  desc "%s"\n  homepage "https://github.com/%s"\n\n' "$name" "$desc" "$repo"
	printf '  livecheck do\n    url :homepage\n    strategy :github_latest\n  end\n\n'
	printf '  binary "%s"\n\n' "$name"
	printf '  postflight do\n    if OS.mac?\n      system_command "/usr/bin/xattr",\n                     args: ["-dr", "com.apple.quarantine", "#{staged_path}/%s"]\n    end\n  end\nend\n' "$name"
} > "$out"
echo "wrote $out for $name $version"
