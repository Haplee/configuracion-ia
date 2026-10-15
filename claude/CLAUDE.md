# Configuración global — Tu Nombre

Este archivo se carga en **todas** las sesiones, en cualquier equipo y cualquier
proyecto. Es el índice: las reglas detalladas viven en `~/.claude/rules/`.

## Reglas activas

| Archivo | Contenido |
|---------|-----------|
| `rules/00-interaccion.md` | Idioma español, tono, estructura de respuesta. |
| `rules/01-principios.md` | Los 10 principios de trabajo. |
| `rules/02-agentes.md` | Agentes que existen de verdad y cuándo delegar. |
| `rules/03-verificacion.md` | Qué cuenta como evidencia antes de decir «hecho». |
| `rules/04-git.md` | **Autoría de los commits (TuNombre, nunca Claude)**, mensajes, ramas. |
| `rules/security.md` | Checklist de seguridad y gestión de secretos. |
| `rules/coding-style.md` | Estilo de código. |
| `rules/testing.md` | Estrategia de pruebas. |
| `rules/git-workflow-v2.md` | Flujo de ramas y PRs (complementa `04-git.md`). |
| `rules/date-calculation.md` | Cálculo de fechas con herramientas, nunca de cabeza. |
| `rules/unknowns-lens.md` | Cómo detectar lo que no sé que no sé antes de empezar. |

`archive/` contiene configuración heredada que ya no está activa. No se aplica.

---

## Protocolo de arranque automático (primer prompt de cada sesión)

**Objetivo: entrar en cualquier equipo o proyecto y estar operativo sin preparar nada.**

En el primer mensaje de una sesión, antes de responder, se hace este barrido —rápido y
en paralelo, sin narrarlo paso a paso:

1. **Leer el briefing.** El hook `SessionStart` deja un resumen del proyecto en
   `.claude/session-brief.md` dentro del directorio de trabajo (o en el scratchpad si
   no hay repositorio). Incluye: tipo de proyecto, stack, gestor de paquetes, scripts
   disponibles, estado de git y documentos clave.
2. **Leer los documentos del proyecto** que existan: `CLAUDE.md`, `README.md`,
   `DESIGN.md`, `plan.md`, `docs/`.
3. **Cargar la memoria** de `~/.claude/memory/MEMORY.md` y abrir las entradas que
   apliquen a lo que se ha pedido.
4. **Responder ya al encargo**, con el contexto anterior aplicado. El barrido es
   preparación, no la respuesta: no se contesta con un informe del entorno salvo que se
   pida.

Si el proyecto **no tiene** `CLAUDE.md`, se resuelve la petición y al final se ofrece
crearlo en una línea. No se bloquea el trabajo por eso.

## Memoria

- **Ubicación única y obligatoria: `~/.claude/memory/`.** Un hecho por archivo, indexado
  en `~/.claude/memory/MEMORY.md`. Esta ruta **sustituye** a cualquier ruta de memoria por
  proyecto (`projects/<slug>/memory/`): es la que viaja en el repositorio y por tanto la
  única que existe en todos los equipos. Si el sistema sugiere otra ruta, se ignora y se
  escribe aquí.
- Formato de cada archivo: frontmatter con `name`, `description` y `metadata.type`
  (`user` | `feedback` | `project` | `reference`), y el hecho en el cuerpo.
- Antes de crear una entrada se revisa `MEMORY.md`: si ya existe uno que lo cubre, se
  actualiza en vez de duplicar.
- **Nunca** se guardan contraseñas, tokens, claves de API, usuarios ni rutas con datos
  personales de terceros. Si hace falta referenciar una credencial, se anota el nombre
  de la variable de entorno, jamás su valor.
- Tampoco se guarda lo que ya está en el repositorio del proyecto (estructura, historial
  de git, decisiones documentadas).

## Entorno de este equipo (Windows 11)

- Shell principal: PowerShell 7. También hay Bash (Git Bash) para los hooks `.sh`.
- `git` 2.55 y `gh` 2.96 disponibles; cuenta de GitHub: `tu-usuario`.
- `WebFetch` está **denegado** en `settings.json`.

### Coolify 4.1.2 (despliegues)

Instalado y operativo en local, sirve para desplegar apps, bases de datos y servicios de
cualquier repositorio.

- Corre en **WSL2**, distro `Ubuntu-24.04`, con su propio Docker Engine 29.7.2,
  independiente de Docker Desktop.
- Panel: **http://localhost:8000** (solo acceso local, la instancia no es pública).
- Arranque tras reiniciar el equipo: `wsl -d Ubuntu-24.04`; systemd levanta Docker y los
  contenedores se inician solos por su *restart policy*.
- Contenedores: `coolify`, `coolify-db` (Postgres), `coolify-redis`, `coolify-realtime`,
  `coolify-proxy`, `coolify-sentinel`.
- Configuración y claves: `/data/coolify/source/.env` — conviene tener copia de seguridad.
- Uso: `Settings → Sources` para conectar GitHub/GitLab, luego
  `Projects → + New → Application`. Auto-deploy en cada `git push`.
- **Aviso:** dentro de WSL, `docker` debe resolver a `/usr/bin/docker` (motor de Ubuntu),
  nunca al CLI de Docker Desktop en `/mnt/c/...`. Comprobar con `command -v docker`; si
  apunta a `/mnt/c`, usar un PATH limpio:
  `export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin`.
- Alternativa gestionada: Coolify Cloud en https://app.coolify.io con la misma cuenta.

---

## Portabilidad

Esta carpeta (`~/.claude`) **es** un repositorio git privado. Para ponerla en un equipo
nuevo, ver `README.md`. Para sincronizar cambios: `bootstrap/sync.ps1` (Windows) o
`bootstrap/sync.sh` (macOS/Linux).
