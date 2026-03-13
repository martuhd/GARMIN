#!/bin/bash
# Setup del MCP de Garmin Connect para Claude Code
# Uso: ./setup.sh

set -e

# Cargar variables desde .env si existe
if [ -f ".env" ]; then
    export $(grep -v '^#' .env | xargs)
    echo "✓ Credenciales cargadas desde .env"
else
    echo "ERROR: No se encontró el archivo .env"
    echo "Crea uno copiando .env.example:"
    echo "  cp .env.example .env"
    echo "  # Luego edita .env con tus credenciales reales"
    exit 1
fi

# Validar que las variables están configuradas
if [ -z "$GARMIN_EMAIL" ] || [ "$GARMIN_EMAIL" = "tu_email@ejemplo.com" ]; then
    echo "ERROR: Configura GARMIN_EMAIL en tu archivo .env"
    exit 1
fi

if [ -z "$GARMIN_PASSWORD" ] || [ "$GARMIN_PASSWORD" = "tu_contraseña" ]; then
    echo "ERROR: Configura GARMIN_PASSWORD en tu archivo .env"
    exit 1
fi

echo "Configurando MCP de Garmin Connect..."

# Agregar el MCP server a Claude Code
claude mcp add garmin \
    -e GARMIN_EMAIL="$GARMIN_EMAIL" \
    -e GARMIN_PASSWORD="$GARMIN_PASSWORD" \
    -- npx -y @nicolasvegam/garmin-connect-mcp

echo ""
echo "✓ MCP de Garmin Connect configurado exitosamente!"
echo ""
echo "Ahora puedes chatear con tus datos de Garmin."
echo "Reinicia Claude Code si ya lo tenías abierto."
