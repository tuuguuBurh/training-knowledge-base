#!/usr/bin/env bash
set -euo pipefail

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
DIM='\033[2m'
RESET='\033[0m'

EXERCISES=(
  "Web Fundamentals"
  "Semantic HTML + Forms"
  "CSS Responsive Grid"
  "JavaScript Core (ES6+)"
  "Fetch API App"
  "Git / Merge Conflict"
)

status_icon() {
  local s="$1"
  if   [[ "$s" == *"Дууссан"* ]];     then echo "✅  Дууссан"
  elif [[ "$s" == *"Хянагдаж"* ]];    then echo "🔄  Хянагдаж байна"
  else                                      echo "⏳  Хүлээгдэж байна"
  fi
}

echo ""
echo -e "${CYAN}${BOLD}"
echo "  ╔═══════════════════════════════════════════════════╗"
echo "  ║   📊  NT Training — Progress Dashboard           ║"
echo "  ╚═══════════════════════════════════════════════════╝"
echo -e "${RESET}"

FOUND=0

for trainee_dir in trainee/*/; do
  [ -d "$trainee_dir" ] || continue
  [[ "$trainee_dir" == "trainee/_template/" ]] && continue

  README="${trainee_dir}README.md"
  [ -f "$README" ] || continue

  TRAINEE_NAME=$(basename "$trainee_dir")
  FOUND=$((FOUND + 1))

  echo -e "  ${YELLOW}${BOLD}👤  $TRAINEE_NAME${RESET}"
  echo -e "  ${DIM}┌──────────────────────────────────┬────────────────────────────┐${RESET}"
  printf "  ${DIM}│${RESET} ${BOLD}%-33s${RESET}${DIM}│${RESET} ${BOLD}%-27s${RESET}${DIM}│${RESET}\n" " Дасгал" " Байдал"
  echo -e "  ${DIM}├──────────────────────────────────┼────────────────────────────┤${RESET}"

  DONE=0; REVIEW=0; PENDING=0; ROW=0

  while IFS= read -r line; do
    if [[ "$line" =~ ^\|[[:space:]]*[0-9]+[[:space:]]*\| ]]; then
      STATUS=$(echo "$line" | awk -F'|' '{gsub(/^[ \t]+|[ \t]+$/, "", $5); print $5}')
      EXERCISE="${EXERCISES[$ROW]:-—}"
      ICON=$(status_icon "$STATUS")

      if   [[ "$STATUS" == *"Дууссан"* ]];   then DONE=$((DONE + 1))
      elif [[ "$STATUS" == *"Хянагдаж"* ]];  then REVIEW=$((REVIEW + 1))
      else                                         PENDING=$((PENDING + 1))
      fi

      printf "  ${DIM}│${RESET} %-33s ${DIM}│${RESET} %-27s ${DIM}│${RESET}\n" " $EXERCISE" " $ICON"
      ROW=$((ROW + 1))
    fi
  done < "$README"

  echo -e "  ${DIM}└──────────────────────────────────┴────────────────────────────┘${RESET}"
  echo -e "     ${GREEN}✅ $DONE${RESET}  🔄 $REVIEW  ⏳ $PENDING"
  echo ""
done

if [ "$FOUND" -eq 0 ]; then
  echo -e "  ${YELLOW}⚠️   Trainee олдсонгүй.${RESET}"
  echo ""
fi
