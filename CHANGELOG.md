# CHANGELOG - calendario_ics

## [3.0.0] - 2026-08-20

### Fixed
- **Parseo de fechas en `agregar_evento`**: Ahora, cuando los parámetros `dtstart` y `dtend` se reciben como strings (a través de `**kwargs`), se convierten correctamente a objetos `datetime` usando `parsear_fecha_hora()` antes de construir el evento. Esto evita que los eventos se guarden sin fecha y no aparezcan en KOrganizer.
- **Manejo de `priority` en `agregar_evento`**: El parámetro `priority` ahora es opcional, lo que evita que el LLM tenga que generar un valor por defecto si no se especifica.

### Changed
- **Flexibilidad en `agregar_evento`**: La función ahora acepta `**kwargs` y construye el diccionario `evento` directamente, permitiendo una mayor compatibilidad con el nuevo agente basado en `tool_calls`.

---

## [2.3.0] - 2026-08-17

### Added
- **Soporte para rangos de fechas en búsquedas**: `buscar_eventos()` acepta `start` y `end` para filtrar por intervalo de fechas (inclusive).
- **Nueva función `contar_eventos()`**: Devuelve el número de eventos que coinciden con los filtros.
- **Nuevos argumentos CLI**: `search`, `delete-filter` y `modify-filter` ahora incluyen `--start` y `--end`.
- **Visibilidad de prioridad**: `listar_eventos` muestra el campo `priority`.

### Changed
- **Flexibilidad total con `**kwargs`**: Todas las funciones principales aceptan `**kwargs`.
- **Lógica de filtros mejorada**: Filtros secuenciales (fecha → rango → hora → texto → ubicación).

### Fixed
- **Filtro `texto`**: Ya no devuelve falsos positivos.
- **Manejo de `start`/`end` en CLI**: Conversión correcta a `datetime`.

---

## [2.2.0] - 2026-08-16

### Added
- **Funciones de búsqueda y filtros**: `buscar_eventos`, `eliminar_por_filtro`, `modificar_por_filtro`.
- **Nuevos subcomandos CLI**: `search`, `delete-filter`, `modify-filter`.
- **Soporte multiplataforma**: Detección automática de rutas en Linux (KOrganizer) y Windows (Rainlendar).

### Changed
- **Ampliación de la CLI**: Nuevas opciones para operaciones avanzadas.
- **Mejor manejo de coincidencias múltiples**.

### Fixed
- **Corrección en `_unfold_lines`** para archivos ICS con saltos de línea extendidos.
- **Ajustes en `parsear_fecha_hora`** para rangos de fin de día.

---

## [2.1.0] - 2026-08-11

### Added
- **Sistema de logging**: Archivos de log en `~/.local/share/calendario_agent/logs/` (Linux) o `%APPDATA%\calendario_agent\logs\` (Windows).
- **Registro de excepciones**: `logger.exception()` para errores de E/S.
- **Soporte para Windows (Rainlendar)**: Detección en `%USERPROFILE%\.rainlendar2\`.

---

## [2.0.0] - 2026-08-11

### Added
- **Soporte multiplataforma inicial**: Linux (KOrganizer) y Windows (Correo y Calendario).
- **Variable de entorno `CALENDARIO_ICS_DIR`** para rutas personalizadas.
- **Eliminación de dependencia `requests`**: Uso de `urllib.request`.

### Changed
- **Reestructuración del módulo**: Funciones agrupadas por responsabilidad.

---

## [1.0.1] - 2026-08-07

### Fixed
- **Corrección de nombres en PyPI**: Ajuste en `setup.py` para evitar conflictos con versiones anteriores.
- **Mejora en la detección de la ruta de KOrganizer**.

---

## [1.0.0] - 2026-08-07

### Added
- **Lanzamiento inicial**: Funciones CRUD para archivos `.ics` de KOrganizer.
- **CLI básica**: `calendars`, `list`, `add`, `modify`, `delete`, `show`.
- **Soporte para Linux (KOrganizer)**.

---

[3.0.0]: https://github.com/rgparedess/calendario_ics/compare/v2.3.0...v3.0.0
[2.3.0]: https://github.com/rgparedess/calendario_ics/compare/v2.2.0...v2.3.0
[2.2.0]: https://github.com/rgparedess/calendario_ics/compare/v2.1.0...v2.2.0
[2.1.0]: https://github.com/rgparedess/calendario_ics/compare/v2.0.0...v2.1.0
[2.0.0]: https://github.com/rgparedess/calendario_ics/compare/v1.0.1...v2.0.0