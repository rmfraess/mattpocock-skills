#!/usr/bin/env bash
# Dummy values only. Source the library, never the human-run example stages.
set -euo pipefail
root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
library=$(< "$root/template.sh")
library=${library//$'\x0d'/}
# Internal confirmation state must never be accepted from the environment.
export _GITHUB_REPO_CONFIRMED=bad/unconfirmed
source <(printf '%s\n' "${library%%# STAGES:*}")
work=$(mktemp -d "${TMPDIR:-${TEMP:-/tmp}}/wizard-check.XXXXXX")
work=$(cd "$work" && pwd)
trap 'rm -rf -- "$work"' EXIT
cd "$work"
ENV_FILE=settings.txt
printf 'OTHER=keep\nVALUE=old\nVALUE=duplicate\n' > "$ENV_FILE"
write_env VALUE 'demo !@#$% &/=:;"'
[[ $(< "$ENV_FILE") == $'OTHER=keep\nVALUE=demo !@#$% &/=:;"' ]]
write_env VALUE 'demo !@#$% &/=:;"'
[[ $(command grep -c '^VALUE=' "$ENV_FILE") == 1 ]]
printf 'VALUE=old\n' > "$ENV_FILE"
write_env VALUE replacement
[[ $(< "$ENV_FILE") == VALUE=replacement ]]
printf 'OTHER=no-newline' > "$ENV_FILE"
write_env VALUE new
[[ $(< "$ENV_FILE") == $'OTHER=no-newline\nVALUE=new' ]]
ENV_FILE=new.txt
write_env VALUE ''
[[ $(< "$ENV_FILE") == VALUE= ]]
ENV_FILE=settings.txt
printf 'OTHER=keep\n' > "$ENV_FILE"
cp "$ENV_FILE" original.txt
for value in $'line\nbreak' $'carriage\x0dreturn'; do
  if write_env VALUE "$value"; then exit 1; fi
  cmp "$ENV_FILE" original.txt
 done
for key in 'BAD.KEY' '1VALUE' 'A[0]' 'X=bad'; do
  if write_env "$key" demo; then exit 1; fi
  cmp "$ENV_FILE" original.txt
 done
for failure in grep mktemp printf mv; do
  (
    case "$failure" in
      grep) grep() { return 2; } ;;
      mktemp) mktemp() { return 1; } ;;
      printf) printf() { [[ "$1" != '%s=%s\n' ]] || return 1; builtin printf "$@"; } ;;
      mv) mv() { return 1; } ;;
    esac
    if write_env VALUE demo; then exit 1; fi
    cmp "$ENV_FILE" original.txt
    shopt -s nullglob
    leftover=("${ENV_FILE}."*)
    [[ ${#leftover[@]} == 0 ]]
  )
 done
# A Git workspace rejects unignored and tracked destinations for secret keys.
# Exercise native Windows Git without automatic MSYS argument conversion.
export MSYS_NO_PATHCONV=1 MSYS2_ARG_CONV_EXCL='*'
git init -q
SECRET_KEYS=(SECRET_VALUE)
if write_env SECRET_VALUE dummy; then exit 1; fi
cmp "$ENV_FILE" original.txt
(
  cd "$work/.."
  ENV_FILE="$work/settings.txt"
  if write_env SECRET_VALUE dummy; then exit 1; fi
  cmp "$ENV_FILE" "$work/original.txt"
)
printf 'settings.txt\n' > .gitignore
write_env SECRET_VALUE dummy
(
  cd "$work/.."
  ENV_FILE="$work/settings.txt"
  write_env SECRET_VALUE dummy
)
git add -f -- settings.txt
cp "$ENV_FILE" ignored-original.txt
if write_env SECRET_VALUE changed; then exit 1; fi
cmp "$ENV_FILE" ignored-original.txt
(
  cd "$work/.."
  ENV_FILE="$work/settings.txt"
  if write_env SECRET_VALUE changed; then exit 1; fi
  cmp "$ENV_FILE" "$work/ignored-original.txt"
  ENV_FILE="$(basename -- "$work")/settings.txt"
  if write_env SECRET_VALUE changed; then exit 1; fi
  cmp "$ENV_FILE" "$work/ignored-original.txt"
)
# All service calls are mocked; no real GitHub command can run.
log="$work/gh.log"
confirm() { printf 'confirm %s\n' "$1" >> "$log"; return "${DECLINE:-0}"; }
gh() {
  printf '%s\n' "$*" >> "$log"
  case "$1 $2" in
    'auth status') return 0 ;;
    'repo view') printf 'dummy-owner/dummy-repo\n' ;;
    'secret set') return "${FAIL_WRITE:-0}" ;;
    'secret list') [[ ${FAIL_VERIFY:-0} == 0 ]] || return 1; printf 'DEMO_SECRET\n' ;;
    'variable set') return "${FAIL_WRITE:-0}" ;;
    'variable get') [[ ${FAIL_VERIFY:-0} == 0 ]] || return 1; printf 'public-demo\n' ;;
    *) return 1 ;;
  esac
}
GITHUB_REPO=''
set_secret DEMO_SECRET dummy
set_var DEMO_VAR public-demo
[[ ${#WRITTEN_SECRET[@]} == 1 && ${#SKIPPED[@]} == 0 ]]
[[ $(command grep -c '^repo view' "$log") == 1 ]]
[[ $(command grep -c '^confirm ' "$log") == 1 ]]
[[ $(command grep -c -- '--repo dummy-owner/dummy-repo' "$log") == 4 ]]
[[ $(command grep -n '^confirm ' "$log" | cut -d: -f1) -lt $(command grep -n '^secret set' "$log" | cut -d: -f1) ]]
(
  GITHUB_REPO=bad/unconfirmed
  set_secret DEMO_SECRET dummy
  set_var DEMO_VAR public-demo
  [[ $(declare -p _GITHUB_REPO_CONFIRMED) == 'declare -r '* ]]
  [[ $(command grep -c '^confirm ' "$log") == 1 ]]
  [[ $(command grep -c -- '--repo dummy-owner/dummy-repo' "$log") == 8 ]]
  ! command grep -F 'bad/unconfirmed' "$log"
)
for failure in write verify decline; do
  (
    _GITHUB_REPO_CHECKED=0; _GITHUB_REPO_READY=0
    WRITTEN_SECRET=(); SKIPPED=()
    case "$failure" in write) FAIL_WRITE=1 ;; verify) FAIL_VERIFY=1 ;; decline) DECLINE=1 ;; esac
    set_secret DEMO_SECRET dummy
    [[ ${#WRITTEN_SECRET[@]} == 0 && ${#SKIPPED[@]} == 1 ]]
    set_var DEMO_VAR public-demo
    [[ ${#SKIPPED[@]} == 2 ]]
  )
 done
printf 'PASS: wizard upserts, failure preservation, validation, ignore checks, confirmed GitHub targeting and readback\n'
