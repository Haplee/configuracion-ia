# 🧠 Configuración IA

Mi setup completo de agentes de IA en un solo repositorio: **skills**, **subagentes**, **comandos**, **reglas** y **configuración global**, tal como los tengo instalados.

> **Repositorio saneado.** No contiene credenciales ni datos personales. Los valores propios aparecen como marcadores (`<tu-usuario>`, `tu-proyecto-*`, `TuNombre`, `Tu Ciudad`…). Sustitúyelos por los tuyos para reutilizarlo.

---

## 📁 Estructura

| Carpeta | Qué es | Origen |
|---|---|---|
| `opencode` | OpenCode: subagentes, skills, `AGENTS.md` y configuración | `~/.config/opencode` |
| `claude` | Claude Code: skills, subagentes, comandos, reglas, hooks y ajustes | `~/.claude` |
| `codex` | Codex: skills, reglas, `AGENTS.md`, `config.toml` | `~/.codex` |
| `cursor` | Cursor: skills, reglas, `mcp.json` | `~/.cursor` |
| `cline` | Cline: skills, reglas, `mcp.json` | `~/.cline` |
| `gemini` | Gemini CLI: skills, reglas, `GEMINI.md` | `~/.gemini` |
| `antigravity` | Antigravity: skills globales + `mcp_config.json` | `~/.gemini/config` |
| `agents-compartido` | Skills compartidas (Copilot, Kimi, Codex global) | `~/.agents` |
| `copilot` | GitHub Copilot: skills, hooks, configuración | `~/.copilot` |
| `pi` | Pi: skills | `~/.pi/agent` |
| `hermes` | Hermes: skills | `~/.hermes` |
| `globales` | Ficheros de instrucciones globales del usuario | `C:\Users\<usuario>` |

## 📦 Inventario

| Carpeta | Skills | Subagentes | Comandos | Reglas |
|---|---:|---:|---:|---:|
| `opencode` | 17 | 18 | — | — |
| `claude` | 78 | 11 | 37 | 12 |
| `codex` | 17 | — | — | 1 |
| `cursor` | 6 | — | — | 1 |
| `cline` | 6 | — | — | 1 |
| `gemini` | 42 | — | — | 1 |
| `antigravity` | 62 | — | — | — |
| `agents-compartido` | 37 | — | — | — |
| `copilot` | 38 | — | — | — |
| `pi` | 26 | — | — | — |
| `hermes` | 28 | — | — | — |

Total: ~5.185 ficheros, ~53 MB.

## 🛠 Cómo reutilizarlo

Cada agente lee sus skills de una carpeta global distinta. Copia la carpeta que te interese en la ruta del agente:

| Agente | Ruta global |
|---|---|
| Claude Code | `~/.claude/skills/` |
| Codex | `~/.codex/skills/` |
| OpenCode | `~/.config/opencode/skills/` |
| Cursor | `~/.cursor/skills/` |
| Cline | `~/.cline/skills/` |
| Gemini CLI | `~/.gemini/skills/` |
| Antigravity | `~/.gemini/config/skills/` |
| GitHub Copilot | `~/.copilot/skills/` |
| Pi | `~/.pi/agent/skills/` |
| Hermes | `~/.hermes/skills/` |
| Compartido | `~/.agents/skills/` |

Las **skills** son autocontenidas (cada una es una carpeta con su `SKILL.md`). Los **subagentes**, **comandos** y **reglas** van en sus carpetas homólogas del agente.

---

## 🧩 Skills por agente

### opencode (17)
antislop, antislop-code, antislop-copywriting, antislop-human, antislop-layoutmobile, antislop-ui, hyperframes, hyperframes-animation, hyperframes-audio, hyperframes-cli, hyperframes-core, hyperframes-creative, hyperframes-keyframes, hyperframes-registry, media-use, product-launch-video, roast

### claude (78)
animate, animate-expo, animation-vocabulary, antislop, antislop-code, antislop-copywriting, antislop-human, antislop-layoutmobile, antislop-ui, apple-design, ask-sonner, blind-spot-pass, brandkit, brutalist-skill, build-system, cache-components, cc-dev-agent, continuous-learning-v2, controlling-mobile-devices, debugging-strategies, dependency-upgrade, developing-mobile-apps, emil-design-eng, eval-harness, evaluating-code-models, evaluating-llms-harness, extract-errors, find-animation-opportunities, frontend-code-review, gpt-tasteskill, hyperframes, hyperframes-animation, hyperframes-audio, hyperframes-cli, hyperframes-core, hyperframes-creative, hyperframes-keyframes, hyperframes-registry, image-to-code-skill, imagegen-frontend-mobile, imagegen-frontend-web, impeccable, improve-animations, job-scout, loop-forge, manage-skills, media-use, minimalist-skill, output-skill, pick-ui-library, product-launch-video, prompts-chat, prototype, redesign-skill, review-animations, roast, security-compliance, security-pipeline, session-wrap, skill-factory, soft-skill, stitch-skill, strategic-compact, stride-analysis-patterns, summarize, taste-skill, taste-skill-v1, team-orchestrator, using-mobai-cli, using-superpowers, vercel-optimize, vercel-react-native-skills, vercel-react-view-transitions, verification-engine, verify-implementation, web-design-guidelines, write-swift, writing-guidelines

### codex (17)
.system, antislop, antislop-code, antislop-copywriting, antislop-human, antislop-layoutmobile, antislop-ui, hyperframes, hyperframes-animation, hyperframes-audio, hyperframes-cli, hyperframes-core, hyperframes-creative, hyperframes-keyframes, hyperframes-registry, media-use, product-launch-video

### cursor (6)
antislop, antislop-code, antislop-copywriting, antislop-human, antislop-layoutmobile, antislop-ui

### cline (6)
antislop, antislop-code, antislop-copywriting, antislop-human, antislop-layoutmobile, antislop-ui

### gemini (42)
accidental-data-loss-prevention, antislop, antislop-code, antislop-copywriting, antislop-human, antislop-layoutmobile, antislop-ui, bigquery-ai-ml, bigquery-bigframes, bigquery-data-transfer-service, bigquery-graph, bigquery-sql, building-data-apps, data-autocleaning, dataform-bigquery, dbt-bigquery, discovering-gcp-data-assets, enforcing-resource-attribution, federate-lakehouse-catalog, gcloud-auth-verification, gcp-composer-troubleshooting, gcp-data-pipelines, gcp-dataflow, gcp-managed-airflow-migrations, gcp-pipeline-orchestration, gcp-pipeline-resource-provisioning, gcp-spark, gcs-security-assessment, hyperframes, hyperframes-animation, hyperframes-audio, hyperframes-cli, hyperframes-core, hyperframes-creative, hyperframes-keyframes, hyperframes-registry, managing-python-dependencies, media-use, ml-best-practices, notebook-guidance, product-launch-video, skill-repair

### antigravity (62)
accidental-data-loss-prevention, alloydb-omni-access-control, alloydb-omni-container, alloydb-omni-data, alloydb-omni-health, alloydb-omni-kubernetes, alloydb-omni-monitor, alloydb-omni-optimize, alloydb-omni-performance, alloydb-omni-replication, alloydb-postgres-access-management, alloydb-postgres-admin, alloydb-postgres-data, alloydb-postgres-health, alloydb-postgres-monitor, alloydb-postgres-optimize, alloydb-postgres-replication, antislop, antislop-code, antislop-copywriting, antislop-human, antislop-layoutmobile, antislop-ui, bigquery, bigquery-data-transfer-service, building-data-apps, cloud-sql-mysql-admin, cloud-sql-mysql-data, cloud-sql-mysql-lifecycle, cloud-sql-mysql-monitor, cloud-sql-postgres-admin, cloud-sql-postgres-data, cloud-sql-postgres-health, cloud-sql-postgres-lifecycle, cloud-sql-postgres-monitor, cloud-sql-postgres-replication, cloud-sql-postgres-vectorassist, cloud-sql-postgres-view-config, cloud-sql-sqlserver-admin, cloud-sql-sqlserver-data, cloud-sql-sqlserver-lifecycle, cloud-sql-sqlserver-monitor, data-autocleaning, dataform-bigquery, dbt-bigquery, discovering-gcp-data-assets, federate-lakehouse-catalog, firestore-data, gcloud-auth-verification, gcp-composer-troubleshooting, gcp-data-pipelines, gcp-dataflow, gcp-managed-airflow-migrations, gcp-pipeline-orchestration, gcp-pipeline-resource-provisioning, gcp-spark, gcs-security-assessment, managing-python-dependencies, ml-best-practices, notebook-guidance, skill-repair, spanner-data

### agents-compartido (37)
animate, animate-expo, animation-vocabulary, antislop, antislop-code, antislop-copywriting, antislop-human, antislop-layoutmobile, antislop-ui, apple-design, ask-sonner, controlling-mobile-devices, developing-mobile-apps, emil-design-eng, find-animation-opportunities, find-skills, hyperframes, hyperframes-animation, hyperframes-audio, hyperframes-cli, hyperframes-core, hyperframes-creative, hyperframes-keyframes, hyperframes-registry, improve-animations, media-use, pick-ui-library, product-launch-video, prototype, review-animations, roast, vercel-optimize, vercel-react-native-skills, vercel-react-view-transitions, web-design-guidelines, write-swift, writing-guidelines

### copilot (38)
accidental-data-loss-prevention, bigquery-ai-ml, bigquery-bigframes, bigquery-data-transfer-service, bigquery-graph, bigquery-sql, building-data-apps, controlling-mobile-devices, data-autocleaning, dataform-bigquery, dbt-bigquery, developing-mobile-apps, discovering-gcp-data-assets, enforcing-resource-attribution, federate-lakehouse-catalog, gcloud-auth-verification, gcp-composer-troubleshooting, gcp-data-pipelines, gcp-dataflow, gcp-managed-airflow-migrations, gcp-pipeline-orchestration, gcp-pipeline-resource-provisioning, gcp-spark, gcs-security-assessment, hyperframes, hyperframes-animation, hyperframes-audio, hyperframes-cli, hyperframes-core, hyperframes-creative, hyperframes-keyframes, hyperframes-registry, managing-python-dependencies, media-use, ml-best-practices, notebook-guidance, product-launch-video, skill-repair

### pi (26)
animate, animate-expo, animation-vocabulary, antislop, antislop-code, antislop-copywriting, antislop-human, antislop-layoutmobile, antislop-ui, apple-design, ask-sonner, emil-design-eng, find-animation-opportunities, hyperframes, hyperframes-animation, hyperframes-cli, hyperframes-core, hyperframes-creative, hyperframes-keyframes, hyperframes-registry, improve-animations, media-use, pick-ui-library, prototype, review-animations, write-swift

### hermes (28)
animate, animate-expo, animation-vocabulary, antislop, antislop-code, antislop-copywriting, antislop-human, antislop-layoutmobile, antislop-ui, apple-design, ask-sonner, emil-design-eng, find-animation-opportunities, hyperframes, hyperframes-animation, hyperframes-audio, hyperframes-cli, hyperframes-core, hyperframes-creative, hyperframes-keyframes, hyperframes-registry, improve-animations, media-use, pick-ui-library, product-launch-video, prototype, review-animations, write-swift

---

## 🤖 Subagentes, comandos y reglas

### OpenCode — subagentes (`opencode/agents`, 18)
`ai-citation-strategist`, `ai-generated-code-security-auditor`, `brand-guardian`, `code-reviewer`, `content-creator`, `devops-automator`, `feedback-synthesizer`, `frontend-developer`, `instagram-curator`, `offer-lead-gen-strategist`, `outbound-strategist`, `proposal-strategist`, `rapid-prototyper`, `seo-specialist`, `technical-writer`, `ui-designer`, `ux-researcher`, `whimsy-injector`

### Claude Code — subagentes (`claude/agents`, 11)
`architect`, `build-error-resolver`, `code-reviewer`, `database-reviewer`, `doc-updater`, `e2e-runner`, `planner`, `refactor-cleaner`, `security-reviewer`, `tdd-guide`, `verify-agent`

### Claude Code — comandos (`claude/commands`, 37)
`agent-router`, `arranque`, `auto`, `build-fix`, `checkpoint`, `code-review`, `commit-push-pr`, `e2e`, `eval`, `explore`, `forge-update`, `guide`, `handoff-verify`, `init-project`, `learn`, `loop-forge`, `next-task`, `orchestrate`, `plan`, `pull`, `quick-commit`, `refactor-clean`, `security-review`, `show-setup`, `sincronizar`, `suggest-automation`, `sync`, `sync-docs`, `tdd`, `test-coverage`, `update-codemaps`, `update-docs`, `verify-loop`, `web-checklist`, `worktree-cleanup`, `worktree-start`, `debugging-strategies/`

### Claude Code — reglas (`claude/rules`, 12)
`00-interaccion.md`, `01-principios.md`, `02-agentes.md`, `03-verificacion.md`, `04-git.md`, `artemis.md`, `coding-style.md`, `date-calculation.md`, `git-workflow-v2.md`, `security.md`, `testing.md`, `unknowns-lens.md`

### Reglas por agente
- `codex/rules/default.rules`
- `cursor/rules/artemis.mdc`
- `cline/rules/artemis.md`
- `gemini/rules/` (1 fichero)

## 🌍 Globales (`globales/`)

Instrucciones que varias IAs leen al arrancar una sesión:

- `AGENTS.md` — Codex, Antigravity, OpenCode, Cursor, Cline, Amp, Hermes, Copilot, Kimi, Pi
- `CLAUDE.md` — Claude Code
- `GEMINI.md` — Gemini CLI
- `.clinerules`, `.cursorrules`

---

## 🔐 Seguridad

- **Sin credenciales.** No se incluyen `auth.json`, `oauth_creds.json`, `.credentials.json` ni ficheros de servicio con contraseñas.
- **Sanitizado.** Se redactaron identificadores personales (usuario del sistema, cuenta de GitHub, email, teléfono, LinkedIn, ciudad, ruta del CV, refs de Supabase, nombres de repos y descripciones de proyectos). Los valores se sustituyeron por marcadores.
- **Clave pública de terceros.** `skills/media-use/.../telemetry.mjs` incluye una clave de ingesta de PostHog de la propia skill (pública por diseño, solo envía eventos).
- `.gitignore` bloquea `.env`, claves (`*.key`, `*.pem`) y credenciales para futuros commits.

## 📜 Contenido de terceros

Muchas de las skills incluidas son **de terceros** (anti-slop, HyperFrames, impeccable, taste-skill, skills de Google Cloud, etc.) y pertenecen a sus autores. Consulta la licencia de cada skill antes de redistribuirla.

## 📝 Notas

- Hay **duplicación entre agentes**: la misma skill suele estar en varios (por ejemplo, anti-slop está en todos). Es esperado: cada agente mantiene su propia copia.
- Este repositorio es un **archivo / copia**. Para cambiar la configuración real, edita la carpeta original del agente.
- **Para re-personalizar**: busca los marcadores (`<tu-usuario>`, `tu-proyecto-*`, `TuNombre`, `Tu Ciudad`, `tu-email@example.com`…) y sustitúyelos por tus datos.
