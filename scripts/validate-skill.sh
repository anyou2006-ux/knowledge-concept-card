#!/usr/bin/env sh
set -eu

root_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
skill_file="$root_dir/SKILL.md"

fail() {
  printf "Validation failed: %s\n" "$1" >&2
  exit 1
}

require_file() {
  [ -s "$root_dir/$1" ] || fail "missing or empty file: $1"
}

require_heading() {
  file=$1
  heading=$2
  grep -Fqx "$heading" "$root_dir/$file" || fail "missing required heading in $file: $heading"
}

require_file "SKILL.md"
require_file "README.md"
require_file "CONTRIBUTING.md"
require_file "RELEASE.md"
require_file "LICENSE"
require_file "examples/input-output.md"
require_file "references/card-schema.md"
require_file "scripts/install-local.sh"

for subject in english-vocabulary c-language high-school-chinese high-school-math; do
  profile="references/$subject.md"
  require_file "$profile"
  require_heading "$profile" "## Required Content"
  require_heading "$profile" "## Teaching Notes"
  require_heading "$profile" "## Visual Pattern"
  require_heading "$profile" "## Card Layout"
  grep -Fq "subject: $subject" "$root_dir/examples/input-output.md" || fail "no acceptance example for $subject"
done

[ "$(sed -n "1p" "$skill_file")" = "---" ] || fail "SKILL.md must begin with YAML frontmatter"
frontmatter_end=$(awk "NR > 1 && \$0 == "---" { print NR; exit }" "$skill_file")
[ -n "$frontmatter_end" ] || fail "SKILL.md frontmatter is not closed"
frontmatter=$(sed -n "1,${frontmatter_end}p" "$skill_file")
skill_name=$(printf "%s\n" "$frontmatter" | sed -n "s/^name: //p" | head -n 1)
[ "$skill_name" = "knowledge-concept-card" ] || fail "Skill name must be knowledge-concept-card"
printf "%s\n" "$skill_name" | grep -Eq "^[a-z0-9]+(-[a-z0-9]+)*$" || fail "Skill name must use lowercase letters, digits, and single hyphens"
[ "${#skill_name}" -le 64 ] || fail "Skill name exceeds 64 characters"
description_line_number=$(printf "%s\n" "$frontmatter" | awk "/^description:/{ print NR; exit }")
[ -n "$description_line_number" ] || fail "SKILL.md must declare a description"
description_value=$(printf "%s\n" "$frontmatter" | sed -n "s/^description:[[:space:]]*//p" | head -n 1)
[ -n "$description_value" ] || fail "SKILL.md description must not be empty"
[ "$(wc -l < "$skill_file" | tr -d " ")" -lt 500 ] || fail "SKILL.md should remain under 500 lines"

for mode in content-spec card card-and-html; do
  grep -Fq "$mode" "$root_dir/examples/input-output.md" || fail "examples do not mention output mode: $mode"
done

for doc in CONTRIBUTING.md RELEASE.md LICENSE; do
  grep -Fq "]($doc)" "$root_dir/README.md" || fail "README does not link to $doc"
done

[ -f "$root_dir/.github/workflows/validate.yml" ] || fail "missing GitHub Actions workflow"
[ -f "$root_dir/.gitignore" ] || fail "missing .gitignore"

printf "Validation passed: knowledge-concept-card is ready for local installation and GitHub CI.\n"
