#!/bin/bash
# weekly_running_stats.sh - Estadísticas semanales de running con Garmin Connect MCP
# Uso: ./weekly_running_stats.sh [días_atras]
#      ./weekly_running_stats.sh        → últimos 7 días
#      ./weekly_running_stats.sh 14     → últimas 2 semanas

set -e

DAYS=${1:-7}

# Calcular rango de fechas
END_DATE=$(date +%Y-%m-%d)

# Compatible con macOS y Linux
if date -d "yesterday" &>/dev/null 2>&1; then
    # Linux
    START_DATE=$(date -d "$DAYS days ago" +%Y-%m-%d)
else
    # macOS
    START_DATE=$(date -v -${DAYS}d +%Y-%m-%d)
fi

echo "================================================="
echo "  Estadísticas de Running: $START_DATE → $END_DATE"
echo "================================================="
echo ""

PROMPT="Usando las herramientas de Garmin MCP, analiza mis actividades de running de los últimos $DAYS días (desde $START_DATE hasta $END_DATE).

Por favor incluye:
1. **Resumen general**: número de carreras, distancia total (km), tiempo total
2. **Promedios**: ritmo promedio (min/km), frecuencia cardíaca promedio
3. **Mejor carrera**: la más larga o la de mejor ritmo
4. **Tendencia**: ¿estoy corriendo más o menos que semanas anteriores?
5. **Observaciones**: cualquier dato relevante sobre recuperación, zonas cardíacas o rendimiento

Presenta los datos de forma clara y concisa."

# Verificar si claude está disponible
if ! command -v claude &>/dev/null; then
    echo "ERROR: 'claude' CLI no encontrado."
    echo "Instala Claude Code: https://claude.ai/code"
    echo ""
    echo "Alternativamente, copia este prompt en Claude Desktop:"
    echo "---"
    echo "$PROMPT"
    exit 1
fi

# Ejecutar query con Claude Code (usa el MCP configurado)
claude --print "$PROMPT"
