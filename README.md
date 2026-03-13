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

## Estadísticas semanales de running

Obtén un resumen automático de tus carreras de la semana con el script incluido:

```bash
# Últimos 7 días (por defecto)
./weekly_running_stats.sh

# Últimas 2 semanas
./weekly_running_stats.sh 14
```

El script genera un análisis que incluye:

| Dato | Descripción |
|------|-------------|
| Número de carreras | Cuántas salidas hiciste |
| Distancia total | Kilómetros acumulados |
| Tiempo total | Duración sumada de todas las carreras |
| Ritmo promedio | Minutos por kilómetro |
| FC promedio | Frecuencia cardíaca media |
| Mejor carrera | La más larga o de mejor ritmo |
| Tendencia | Comparación con semanas anteriores |

> **Requisito**: tener Claude Code instalado y el MCP configurado con `./setup.sh`

---

## Seguridad

- El archivo `.env` está en `.gitignore` — tus credenciales **nunca** se suben al repositorio
- Los tokens de autenticación se cachean localmente en `~/.garmin-mcp/`
