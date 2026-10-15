# Principios generales

| # | Principio | En una línea |
|---|-----------|--------------|
| 1 | Conclusión primero | La primera frase responde. Ver `00-interaccion.md`. |
| 2 | Secretos fuera del código | Solo `process.env` / variables de entorno; si falta, lanzar error. |
| 3 | Cambio quirúrgico | Se toca lo pedido. Nada de limpiezas colaterales no solicitadas. |
| 4 | Evidencia antes de «hecho» | Sin salida de comando que lo demuestre, no está terminado. |
| 5 | Archivos y funciones pequeños | Orientativo: 800 líneas por archivo, 50 por función, 4 niveles de anidamiento. |
| 6 | Validación en los bordes | Entrada de usuario validada; consultas SQL parametrizadas. |
| 7 | Inmutabilidad | Nuevos objetos con *spread*; no mutar el original. |
| 8 | Plan antes de cambios grandes | 5 archivos o más, o cambio de esquema / contrato de API → plan aprobado primero. |
| 9 | Fechas con herramientas | Nunca calcular fechas de cabeza. Ver `date-calculation.md`. |
| 10 | Delegar cuando el contexto se llena | Por encima del 30 % de la ventana, mover el trabajo de exploración a subagentes. |

## Etiqueta CRÍTICO

Una regla marcada `(CRÍTICO)` es aquella cuyo incumplimiento provoca pérdida de datos,
incidente de seguridad, riesgo legal o gasto descontrolado. Ante la duda, se pregunta
antes de actuar.
