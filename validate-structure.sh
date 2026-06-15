#!/usr/bin/env bash
set -euo pipefail

# ─────────────────────────────────────────────
#   Colors
# ─────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

EXPECTED_PHASE1_FOLDERS=(
  "01-web-fundamentals"
  "02-semantic-html"
  "03-css-layout"
  "04-javascript-core"
  "05-fetch-api"
  "06-git-practice"
)

echo ""
echo -e "${CYAN}${BOLD}"
echo "  ╔══════════════════════════════════════════╗"
echo "  ║   🎓  NT Training — Structure Check  🎓  ║"
echo "  ╚══════════════════════════════════════════╝"
echo -e "${RESET}"

# ─────────────────────────────────────────────
#   Check trainee/ root exists
# ─────────────────────────────────────────────
if [ ! -d "trainee" ]; then
  echo -e "  ${RED}✗  trainee/ folder is missing at repo root.${RESET}"
  echo ""
  echo -e "  ${RED}${BOLD}❌  Validation failed.${RESET}"
  echo ""
  exit 1
fi

ERRORS=0
CHECKED=0

for trainee_dir in trainee/*/; do
  [ -d "$trainee_dir" ] || continue
  [[ "$trainee_dir" == "trainee/_template/" ]] && continue

  TRAINEE_NAME=$(basename "$trainee_dir")
  echo -e "  ${YELLOW}👤  Checking trainee: ${BOLD}${TRAINEE_NAME}${RESET}"

  # README check
  if [ ! -f "${trainee_dir}README.md" ]; then
    echo -e "    ${RED}✗  README.md missing (checkpoint table)${RESET}"
    ERRORS=$((ERRORS + 1))
  else
    echo -e "    ${GREEN}✔  README.md found${RESET}"
  fi

  # phase-1 check
  if [ ! -d "${trainee_dir}phase-1" ]; then
    echo -e "    ${RED}✗  phase-1/ folder missing${RESET}"
    ERRORS=$((ERRORS + 1))
  else
    echo -e "    ${GREEN}✔  phase-1/ found${RESET}"
    for folder in "${EXPECTED_PHASE1_FOLDERS[@]}"; do
      if [ ! -d "${trainee_dir}phase-1/${folder}" ]; then
        echo -e "      ${RED}✗  phase-1/${folder}/ missing${RESET}"
        ERRORS=$((ERRORS + 1))
      else
        echo -e "      ${GREEN}✔  phase-1/${folder}/${RESET}"
      fi
    done
  fi

  CHECKED=$((CHECKED + 1))
  echo ""
done

# ─────────────────────────────────────────────
#   Result
# ─────────────────────────────────────────────
if [ "$CHECKED" -eq 0 ]; then
  echo -e "  ${YELLOW}⚠️   No trainee folders found (only _template exists). Skipping.${RESET}"
  echo ""
  exit 0
fi

if [ "$ERRORS" -gt 0 ]; then
  echo -e "  ${RED}${BOLD}❌  Validation failed — $ERRORS error(s) found.${RESET}"
  echo ""
  exit 1
fi

echo -e "  ${GREEN}${BOLD}✅  All good! Structure looks perfect.${RESET}"
echo ""
