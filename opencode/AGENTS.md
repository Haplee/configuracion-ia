# Reglas globales de opencode — equipo de Tu Nombre

## Infraestructura de despliegue disponible en este equipo

**Coolify 4.1.2** está instalado y operativo de forma local, y sirve para desplegar apps,
bases de datos y servicios de cualquier repositorio (actual o futuro).

### Dónde vive y cómo arranca

- Se ejecuta en **WSL2**, distro `Ubuntu-24.04`, con su **propio Docker Engine 29.7.2**
  (independiente de Docker Desktop).
- Panel web: **http://localhost:8000** (solo acceso local; la instancia NO es pública).
- Para arrancarla tras un reinicio del equipo: `wsl -d Ubuntu-24.04` — systemd levanta
  Docker y los contenedores de Coolify se inician solos (restart policy).
- Contenedores: `coolify`, `coolify-db` (Postgres), `coolify-redis`, `coolify-realtime`,
  `coolify-proxy`, `coolify-sentinel`.
- Configuración y claves: `/data/coolify/source/.env` — aconsejable hacer copia de seguridad.

### Cómo se usa

- Conectar repos: `Settings → Sources` (GitHub/GitLab) → `Projects → + New → Application`
  → elegir repo → `Deploy`. Auto-deploy con cada `git push`.
- Bases de datos: `+ New → Database` (Postgres/MySQL/Redis). Servicios: `+ New → One-click Services`.
- Alternativa gestionada (sin servidor propio): **Coolify Cloud** en https://app.coolify.io,
  con la misma cuenta de GitHub.

### Avisos importantes

- Dentro de la distro WSL, `docker` debe resolver a **`/usr/bin/docker`** (el motor de
  Ubuntu), nunca al CLI de Windows de Docker Desktop (`/mnt/c/Program Files/Docker/...`).
  Verificar con `command -v docker`; si apunta a `/mnt/c`, usar un PATH Linux limpio
  (`export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin`) o ignorar la
  integración de Docker Desktop.
- Docker Desktop y el motor de WSL son independientes: no usarlos a la vez para lo mismo.
- Todo el entorno de trabajo es en español.

<!-- antislop:start -->
## antislop (global)

Aplica siempre `antislop` cuando el trabajo sea UI, copy, layout responsive, accesibilidad
o comentarios de código, para no generar salidas genéricas. Carga la skill que corresponda:
`antislop` (core, siempre) y, según la tarea, `antislop-ui`, `antislop-copywriting`,
`antislop-human`, `antislop-layoutmobile` o `antislop-code`.

- Instalado global (v3.2.20) para Claude Code, Codex, OpenCode, Cursor, Cline, Gemini CLI,
  Antigravity, GitHub Copilot, Pi y Hermes. Los `SKILL.md` globales están, por ejemplo, en
  `C:\Users\usuario\.config\opencode\skills\<skill>\SKILL.md`.
- Modo: `during` (preferencia global en `%APPDATA%\antislop\settings.json`). Anuncia
  `antislop active: during (global preference).` una vez. Una elección de sesión
  (during/after) tiene prioridad.
- Antes de entregar UI o copy, ejecuta el Delivery Gate del core (informe PASS/FAIL).
- Actualizar: `npx antislop-ai --update`. Quitar: borrar las carpetas `skills\antislop*` de
  cada carpeta global de agente y este bloque.
<!-- antislop:end -->
