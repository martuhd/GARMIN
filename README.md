# Garmin Connect MCP - Chat con tus datos

Integración del [Garmin Connect MCP](https://github.com/Nicolasvegam/garmin-connect-mcp) para chatear con tus datos de Garmin directamente desde Claude.

## Configuración inicial

### 1. Crea tu archivo de credenciales

```bash
cp .env.example .env
```

Edita `.env` con tus credenciales reales de Garmin Connect:

```
GARMIN_EMAIL=tu_email@garmin.com
GARMIN_PASSWORD=tu_contraseña
```

### 2. Ejecuta el setup

```bash
chmod +x setup.sh
./setup.sh
```

Esto registra el servidor MCP en Claude Code automáticamente.

### 3. Reinicia Claude Code

Si tenías Claude Code abierto, ciérralo y vuelve a abrirlo para que cargue el MCP.

---

## Qué puedes preguntar

El MCP tiene **61 herramientas** en 7 categorías:

| Categoría | Ejemplos de preguntas |
|-----------|----------------------|
| **Actividades** | "¿Cuáles fueron mis últimas 10 actividades?" |
| **Salud diaria** | "¿Cuántos pasos hice esta semana?" |
| **Sueño** | "¿Cómo fue mi sueño anoche?" |
| **Composición corporal** | "¿Cuál es mi peso e IMC actual?" |
| **Rendimiento** | "¿Cuál es mi VO2 Max?" |
| **Estrés** | "¿Cómo estuvo mi nivel de estrés hoy?" |
| **Perfil** | "¿Qué dispositivos Garmin tengo?" |

## Seguridad

- El archivo `.env` está en `.gitignore` — tus credenciales **nunca** se suben al repositorio
- Los tokens de autenticación se cachean localmente en `~/.garmin-mcp/`
