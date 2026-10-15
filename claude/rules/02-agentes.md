# Agentes y delegación

Estos son los agentes que **existen realmente** en este equipo (`~/.claude/agents/`).
No se inventan nombres de agentes: si uno no está en esta tabla, no se puede invocar.

| Agente | Cuándo |
|--------|--------|
| `planner` | Diseñar un plan de implementación por fases. Nunca escribe código de producción. |
| `architect` | Estructura del proyecto, dependencias, deuda técnica, decisiones de arquitectura (ADR). |
| `tdd-guide` | Funcionalidad nueva o corrección con ciclo test-primero. |
| `build-error-resolver` | Build roto, errores de tipos, imports o dependencias. Cambio mínimo hasta volver a verde. |
| `code-reviewer` | Revisión general de calidad tras terminar un cambio. |
| `security-reviewer` | Código que toca autenticación, entrada de usuario, endpoints o datos sensibles. |
| `database-reviewer` | SQL, migraciones, índices, políticas RLS, rendimiento en Postgres/Supabase. |
| `refactor-cleaner` | Código muerto, exports sin uso, duplicación. Solo en rama de trabajo. |
| `e2e-runner` | Pruebas end-to-end de recorridos críticos. |
| `verify-agent` | Verificación final en contexto limpio: typecheck → lint → build → test. |
| `doc-updater` | Actualizar README y documentación tras un cambio de código. |

Genéricos del sistema: `Explore` (búsqueda amplia de solo lectura), `Plan`,
`general-purpose`, `claude-code-guide` (dudas sobre el propio Claude Code).

## Reglas de delegación

1. **No se lanzan agentes salvo que el usuario lo pida** o la tarea sea una búsqueda
   ancha de solo lectura sobre muchos archivos. Cada agente arranca sin contexto y lo
   vuelve a derivar: es el camino caro.
2. Tareas independientes → en paralelo, en un solo mensaje.
3. Lo que devuelve un agente **no llega al usuario**: hay que resumir lo relevante.
4. Un informe de agente puede equivocarse. Se contrasta antes de darlo por bueno.
