#!/usr/bin/env bash
set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

# ─────────────────────────────────────────────
#   Args
# ─────────────────────────────────────────────
NAME="${1:-}"
BUDDY="${2:-}"

if [[ -z "$NAME" || -z "$BUDDY" ]]; then
  echo ""
  echo -e "  ${RED}Хэрэглэх заавар: $0 <username> <@buddy-handle>${RESET}"
  echo -e "  ${RED}Жишээ:           $0 bat @saran${RESET}"
  echo -e "  ${RED}  → branch: trainee/nt-bat${RESET}"
  echo ""
  exit 1
fi

# Strip any existing nt- prefix so it's always applied exactly once
NAME="${NAME#nt-}"
NT_NAME="nt-$NAME"
BRANCH="trainee/$NT_NAME"
TRAINEE_DIR="trainee/$NT_NAME"
NAME_DISPLAY="$(tr '[:lower:]' '[:upper:]' <<< "${NAME:0:1}")${NAME:1}"

echo ""
echo -e "${CYAN}${BOLD}"
echo "  ╔══════════════════════════════════════════╗"
echo "  ║   🎓  NT Training — Шинэ Trainee Setup  ║"
echo "  ╚══════════════════════════════════════════╝"
echo -e "${RESET}"
echo -e "  ${CYAN}Trainee:${RESET} $NAME_DISPLAY"
echo -e "  ${CYAN}Buddy:  ${RESET} $BUDDY"
echo ""

# ─────────────────────────────────────────────
#   1. Switch to main and pull latest
# ─────────────────────────────────────────────
CURRENT=$(git rev-parse --abbrev-ref HEAD)
if [[ "$CURRENT" != "main" ]]; then
  echo -e "  ${YELLOW}↩️   main branch рүү шилжиж байна...${RESET}"
  git checkout main
fi
echo -e "  ${CYAN}⬇️   main-ийг татаж байна...${RESET}"
git pull origin main --quiet

# ─────────────────────────────────────────────
#   2. Create trainee branch
# ─────────────────────────────────────────────
if git show-ref --quiet "refs/heads/$BRANCH"; then
  echo -e "  ${RED}✗  '$BRANCH' branch аль хэдийн байна. Зогслоо.${RESET}"
  echo ""
  exit 1
fi

echo -e "  ${CYAN}🌿  Branch үүсгэж байна: ${BOLD}$BRANCH${RESET}"
git checkout -b "$BRANCH"

# ─────────────────────────────────────────────
#   3. Copy scaffold from _template
# ─────────────────────────────────────────────
echo -e "  ${CYAN}📁  Scaffold хуулж байна...${RESET}"
mkdir -p "$TRAINEE_DIR"
cp -r trainee/_template/. "$TRAINEE_DIR/"

# ─────────────────────────────────────────────
#   4. Fill in placeholders in README
# ─────────────────────────────────────────────
echo -e "  ${CYAN}✏️   Мэдээллийг бөглөж байна...${RESET}"
START_DATE="$(date +%Y-%m-%d)"
perl -i -pe "s/\[Нэр\]/$NAME_DISPLAY/g"                   "$TRAINEE_DIR/README.md"
perl -i -pe "s/\@buddy-github-handle/$BUDDY/g"             "$TRAINEE_DIR/README.md"
perl -i -pe "s|trainee/\[нэр\]|trainee/$NT_NAME|g"        "$TRAINEE_DIR/README.md"
perl -i -pe "s/\[ОГНОО\]/$START_DATE/g"                   "$TRAINEE_DIR/README.md"

# ─────────────────────────────────────────────
#   5. Register buddy in CODEOWNERS
# ─────────────────────────────────────────────
echo -e "  ${CYAN}🔑  CODEOWNERS-д бүртгэж байна...${RESET}"
echo "trainee/$NT_NAME/   $BUDDY" >> .github/CODEOWNERS

# ─────────────────────────────────────────────
#   5b. Log trainee in TRAINEES.md
# ─────────────────────────────────────────────
echo -e "  ${CYAN}📋  TRAINEES.md-д бүртгэж байна...${RESET}"
echo "| $NAME_DISPLAY | $BUDDY | $START_DATE | — | 1-р шат | 🔄 Идэвхтэй |" >> TRAINEES.md

# ─────────────────────────────────────────────
#   6. Commit
# ─────────────────────────────────────────────
git add "trainee/$NT_NAME/" .github/CODEOWNERS TRAINEES.md
git commit -m "chore: scaffold trainee/$NT_NAME (buddy: $BUDDY)"

# ─────────────────────────────────────────────
#   7. Push
# ─────────────────────────────────────────────
echo -e "  ${CYAN}🚀  Origin-руу push хийж байна...${RESET}"
git push -u origin "$BRANCH"

echo ""
echo -e "  ${GREEN}${BOLD}✅  Бэлэн боллоо!${RESET}"
echo ""
echo -e "  ${GREEN}  Branch:   $BRANCH${RESET}"
echo -e "  ${GREEN}  Buddy:    $BUDDY (автоматаар reviewer болно)${RESET}"
echo ""
echo -e "  ${YELLOW}  $NAME_DISPLAY-д хэлэх команд:${RESET}"
echo -e "  ${BOLD}  git clone <repo-url> && git checkout $BRANCH${RESET}"
echo ""
