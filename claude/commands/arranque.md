---
description: Carga todo el contexto del proyecto actual y deja la sesión lista para trabajar
---

# Arranque de proyecto

Prepara la sesión para el proyecto en el que estás. Úsalo si has cambiado de carpeta,
si el hook de inicio no llegó a ejecutarse, o si quieres refrescar el contexto.

## Qué hacer

Ejecuta en paralelo, sin narrar los pasos:

1. `bash ~/.claude/hooks/project-bootstrap.sh` para regenerar el briefing.
2. Lee los documentos del proyecto que existan: `CLAUDE.md`, `README.md`, `DESIGN.md`,
   `plan.md`, y el índice de `docs/` si lo hay.
3. Lee `~/.claude/memory/MEMORY.md` y abre las entradas relacionadas con este proyecto.
4. Si es un repositorio git: `git log --oneline -10` y `git status --short` para saber
   por dónde iba el trabajo.

## Qué entregar

Un resumen de **8 líneas como máximo**:

- Qué es el proyecto y con qué stack está hecho.
- En qué estado está (rama, cambios pendientes, último trabajo).
- Comandos útiles detectados (build, test, dev).
- Qué falta o qué parece el siguiente paso natural.

Si el proyecto no tiene `CLAUDE.md`, ofrécelo en la última línea: «¿Creo un CLAUDE.md
para este proyecto?». No lo crees sin respuesta.

$ARGUMENTS
