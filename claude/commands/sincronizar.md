---
description: Sincroniza la configuración de Claude (skills, reglas, memoria) con el repositorio privado
---

# Sincronizar configuración

Sube los cambios de `~/.claude` al repositorio privado y baja los de otros equipos.

## Qué hacer

1. En Windows: `pwsh -File "$env:USERPROFILE\.claude\bootstrap\sync.ps1"`
   En macOS/Linux: `bash ~/.claude/bootstrap/sync.sh`
2. Si el hook `pre-commit` aborta el commit, **no uses `--no-verify`**: enséñame lo que
   ha detectado y espera instrucción.
3. Si hay conflicto de rebase, muéstrame los archivos en conflicto y para.

## Qué entregar

Dos líneas: qué se ha subido y qué se ha bajado. Si no había cambios, dilo y ya.

$ARGUMENTS
