#!/bin/bash

dirs_to_link=(
	".config/dunst/"
	".config/hypr/"
	".config/tofi/"
	".config/waybar/"
	".config/wlogout/"
)

for item in "${dirs_to_link[@]}"; do
	from="$(pwd)/$item"
	to="$HOME/$(dirname "$item")"
	dirname=$(basename "$from")

	mkdir -p "${to}"
	unlink "${to}"/"${dirname}" || echo "skipped unlink"
	ln --symbolic "${from}" --target-directory="${to}" -v
done
