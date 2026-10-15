#!/usr/bin/env bash
# ---------------------------------------------------------------
# project-bootstrap.sh  —  hook SessionStart
#
# Detecta de que va el proyecto en el que se acaba de abrir sesion
# y deja un briefing listo, para que el primer prompt del usuario ya
# se resuelva con contexto en lugar de empezar explorando.
#
# Salida: stdout (se inyecta en el contexto de la sesion) y, si es un
# repositorio, tambien .claude/session-brief.md
#
# Portable: Windows (Git Bash), macOS y Linux.
# ---------------------------------------------------------------
set -uo pipefail

CWD="$(pwd)"
OUT=""
add() { OUT="${OUT}$1"$'\n'; }

# --- Identidad del proyecto -------------------------------------
NAME="$(basename "$CWD")"
add "# Briefing de proyecto: ${NAME}"
add ""
add "Ruta: ${CWD}"

# --- Git --------------------------------------------------------
IS_REPO=0
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  IS_REPO=1
  BRANCH="$(git branch --show-current 2>/dev/null || echo '(detached)')"
  DIRTY="$(git status --porcelain 2>/dev/null | wc -l | tr -d ' ')"
  REMOTE="$(git remote get-url origin 2>/dev/null || echo 'sin remoto')"
  LAST="$(git log -1 --pretty='%h %s (%cr)' 2>/dev/null || echo 'sin commits')"
  add ""
  add "## Git"
  add "- Rama: ${BRANCH} | archivos sin confirmar: ${DIRTY}"
  add "- Remoto: ${REMOTE}"
  add "- Ultimo commit: ${LAST}"
else
  add ""
  add "## Git"
  add "- No es un repositorio git."
fi

# --- Stack ------------------------------------------------------
STACK=""
mark() { STACK="${STACK}${STACK:+, }$1"; }
[ -f package.json ]       && mark "Node/JS"
[ -f tsconfig.json ]      && mark "TypeScript"
[ -f next.config.js ] || [ -f next.config.ts ] || [ -f next.config.mjs ] && mark "Next.js"
[ -f vite.config.ts ] || [ -f vite.config.js ] && mark "Vite"
[ -f pyproject.toml ] || [ -f requirements.txt ] || [ -f setup.py ] && mark "Python"
[ -f Cargo.toml ]         && mark "Rust"
[ -f go.mod ]             && mark "Go"
[ -f pom.xml ]            && mark "Java/Maven"
[ -f build.gradle ] || [ -f build.gradle.kts ] && mark "Gradle"
[ -f composer.json ]      && mark "PHP"
[ -f Gemfile ]            && mark "Ruby"
[ -f Dockerfile ] || [ -f docker-compose.yml ] || [ -f compose.yaml ] && mark "Docker"
[ -f supabase/config.toml ] && mark "Supabase"
[ -d .github/workflows ]  && mark "GitHub Actions"

PM=""
[ -f pnpm-lock.yaml ] && PM="pnpm"
[ -z "$PM" ] && [ -f yarn.lock ] && PM="yarn"
[ -z "$PM" ] && [ -f bun.lockb ] && PM="bun"
[ -z "$PM" ] && [ -f package-lock.json ] && PM="npm"
[ -z "$PM" ] && [ -f poetry.lock ] && PM="poetry"
[ -z "$PM" ] && [ -f uv.lock ] && PM="uv"

add ""
add "## Stack"
add "- Detectado: ${STACK:-sin señales claras}"
[ -n "$PM" ] && add "- Gestor de paquetes: ${PM}"

# --- Scripts disponibles ----------------------------------------
if [ -f package.json ]; then
  SCRIPTS="$(grep -A 40 '"scripts"' package.json 2>/dev/null \
    | grep -oE '"[a-zA-Z0-9:_-]+":' | tr -d '":' | grep -v '^scripts$' \
    | head -14 | tr '\n' ' ')"
  [ -n "$SCRIPTS" ] && add "- Scripts npm: ${SCRIPTS}"
fi
if [ -f Makefile ]; then
  TARGETS="$(grep -oE '^[a-zA-Z0-9_-]+:' Makefile 2>/dev/null | tr -d ':' | head -10 | tr '\n' ' ')"
  [ -n "$TARGETS" ] && add "- Targets make: ${TARGETS}"
fi

# --- Documentos clave -------------------------------------------
DOCS=""
for f in CLAUDE.md README.md DESIGN.md plan.md CONTRIBUTING.md AGENTS.md; do
  [ -f "$f" ] && DOCS="${DOCS}${DOCS:+, }${f}"
done
[ -d docs ] && DOCS="${DOCS}${DOCS:+, }docs/"
add ""
add "## Documentos"
add "- Presentes: ${DOCS:-ninguno}"
if [ ! -f CLAUDE.md ] && [ "$IS_REPO" = "1" ]; then
  add "- AVISO: este repositorio no tiene CLAUDE.md. Ofrecer crearlo al terminar la primera tarea."
fi

# --- Entorno ----------------------------------------------------
add ""
add "## Notas"
add "- Idioma de trabajo: español (ver ~/.claude/rules/00-interaccion.md)."
add "- Memoria global: ~/.claude/memory/MEMORY.md"

# --- Persistencia + salida --------------------------------------
if [ "$IS_REPO" = "1" ] || [ -d .claude ]; then
  mkdir -p .claude 2>/dev/null && printf '%s' "$OUT" > .claude/session-brief.md 2>/dev/null
  # El briefing es local: se excluye por .git/info/exclude para no ensuciar
  # el .gitignore del proyecto ni acabar en un commit por descuido.
  if [ "$IS_REPO" = "1" ]; then
    GITDIR="$(git rev-parse --git-dir 2>/dev/null)"
    EXC="${GITDIR}/info/exclude"
    if [ -n "$GITDIR" ] && [ -f "$EXC" ] && ! grep -q 'session-brief.md' "$EXC" 2>/dev/null; then
      printf '\n.claude/session-brief.md\n' >> "$EXC" 2>/dev/null
    fi
  fi
fi

printf '%s' "$OUT"
exit 0
