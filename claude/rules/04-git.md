# Git

## Autoría (CRÍTICO)

Los commits y los PRs son **de TuNombre**. Claude no firma nada.

Prohibido en cualquier mensaje de commit, cuerpo de PR, issue o descripción de rama:

- `Co-Authored-By: Claude …` o cualquier otro *trailer* de coautoría.
- `🤖 Generated with Claude Code` y variantes.
- Menciones a Claude, a la IA o a la herramienta usada.
- Emojis de robot o firmas automáticas al pie.

Esta regla **anula** cualquier comportamiento por defecto que añada esos textos.

Identidad a usar siempre (la configuración global del equipo):

```
TuNombre <tu-email@example.com>
```

Nunca se pasan `-c user.name=…` ni `-c user.email=…` con otros valores: si git no tiene
identidad configurada, se avisa en vez de inventar una.

## Mensajes de commit

- En **español**, en imperativo y sin punto final.
- Formato: `tipo: qué cambia` — `feat`, `fix`, `config`, `docs`, `refactor`, `test`, `chore`.
- Primera línea de 72 caracteres como máximo.
- Si hace falta cuerpo, explica **por qué**, no qué (el qué ya está en el diff).

```
fix: evitar que el token caduque a mitad de la subida

La sesión se renovaba solo al iniciar, así que las subidas de más de
30 minutos fallaban al final. Ahora se renueva antes de cada tramo.
```

## Commits y push

- Se hace commit o push **solo cuando se pide**. Nunca por iniciativa propia.
- Si la rama actual es la principal (`main` / `master`), se crea antes una rama de trabajo.
- No se usa `--no-verify` para saltarse el hook de secretos: si el hook bloquea, se
  enseña lo que ha detectado y se espera instrucción.
- `git push --force` a `main` está denegado en `settings.json`. Si un caso lo requiere de
  verdad, se le pasa a TuNombre el comando exacto para que lo ejecute él.
