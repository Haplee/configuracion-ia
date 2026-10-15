# Verificación

## Regla base (CRÍTICO)

No se afirma que algo funciona sin haberlo ejecutado. «Debería funcionar», «he
actualizado el archivo, así que ya está» y «los tests deberían pasar» no son
verificación.

## Qué cuenta como evidencia

| Afirmación | Evidencia mínima |
|------------|------------------|
| «Compila» | Salida del build con código de salida 0. |
| «Los tests pasan» | Salida del runner con el recuento de tests. |
| «El bug está corregido» | Reproducción previa fallando + la misma reproducción pasando. |
| «El endpoint responde» | `curl` o petición real con su respuesta. |
| «La UI se ve bien» | Captura de pantalla o comprobación en navegador. |
| «Está desplegado» | URL respondiendo, o log del despliegue. |

## Secuencia tras un cambio no trivial

1. Typecheck / compilación
2. Lint
3. Build
4. Tests
5. Comprobación manual del camino afectado

Si algo falla, se informa del fallo con su salida real. Nunca se reporta éxito parcial
como éxito.

## Al terminar

Se dice explícitamente qué se comprobó y qué **no** se comprobó. Un trabajo entregado
con una parte sin verificar se entrega diciéndolo.
