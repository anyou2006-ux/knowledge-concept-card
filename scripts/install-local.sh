#!/usr/bin/env sh
set -eu

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
source_dir=$(CDPATH= cd -- "$script_dir/.." && pwd)
skills_dir=${COLA_SKILLS_DIR:-"$HOME/.cola/skills"}
target="$skills_dir/knowledge-concept-card"

mkdir -p "$skills_dir"

if [ -L "$target" ]; then
  current_target=$(readlink "$target")
  if [ "$current_target" = "$source_dir" ]; then
    printf "Already installed: %s -> %s\n" "$target" "$source_dir"
    exit 0
  fi
  printf "Refusing to replace existing symlink: %s -> %s\n" "$target" "$current_target" >&2
  exit 1
fi

if [ -e "$target" ]; then
  printf "Refusing to replace existing file or directory: %s\n" "$target" >&2
  exit 1
fi

ln -s "$source_dir" "$target"
printf "Installed: %s -> %s\n" "$target" "$source_dir"
printf "Start a new conversation to load the Skill.\n"
