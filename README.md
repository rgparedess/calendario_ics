# calendario_ics

Módulo de Python para gestionar eventos en archivos .ics del calendario.  
Python module to manage events in calendar .ics files.

Proporciona operaciones CRUD (crear, leer, actualizar, eliminar) sobre eventos almacenados en archivos iCalendar (.ics) en el directorio del calendario.  
Provides CRUD (create, read, update, delete) operations on events stored in iCalendar (.ics) files in the calendar directory.

Todas las funciones devuelven `(bool, str)` o `(uid, str)` según corresponda.  
All functions return `(bool, str)` or `(uid, str)` as appropriate.

---

## Plataformas Soportadas (Probado con:) / Supported Platforms (Tested with:)

Esta herramienta ha sido probada oficialmente con los siguientes calendarios locales:
This tool has been officially tested with the following local calendars:

| Sistema Operativo | Aplicación                             | Estado       |
|-------------------|----------------------------------------|------------- |
| **Linux**         | KOrganizer (KDE Plasma 6)              | ✅ Probado   |
| **Windows**       | Rainlendar Lite 2.24.1 (Windows 10/11) | ✅ Probado   |
| **macOS**         | *No soportado actualmente*             | ❌ Pendiente |


## Instalación / Installation

```bash
pip install calendario_ics
```

### Con script / With script
```bash
# Para Linux / For Linux
# Copiar el script al directorio donde están los .py
chmod +x install.sh
./install.sh
```

```bash
# Para Windows / For Windows
# Abrir PowerShell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\install.ps1
``` 

## Configuración avanzada / Advanced configuration

Puedes especificar una ruta personalizada para los archivos `.ics` usando la variable de entorno `CALENDARIO_ICS_DIR`.  
You can specify a custom path for the `.ics` files using the `CALENDARIO_ICS_DIR` environment variable.

```bash
# Linux / macOS
export CALENDARIO_ICS_DIR="/ruta/a/tus/calendarios"
```
```bash
# Windows (PowerShell)
$env:CALENDARIO_ICS_DIR="C:\ruta\a\tus\calendarios"
```

```bash
# Windows (CMD)
set CALENDARIO_ICS_DIR=C:\ruta\a\tus\calendarios
```

Si no se define, el agente intentará detectar automáticamente la ruta según tu sistema operativo:

    Linux: ~/.local/share/apps/korganizer/

    Windows:  %USERPROFILE%\.rainlendar2\ (o su subcarpeta Calendar)

    macOS: No hay una ruta estándar para archivos ICS sueltos; usa la variable de entorno.

If not set, the agent will try to auto-detect the path based on your OS:

    Linux: ~/.local/share/apps/korganizer/

    Windows: %USERPROFILE%\.rainlendar2\ 

    macOS: No standard path for loose ICS files; use the environment variable.

## Uso como librería / Usage as a library

```bash

import calendario_ics as cal
```

```bash
# Listar calendarios disponibles / List available calendars
print(cal.listar_calendarios())
```

```bash
# Listar eventos de hoy / List today's events
print(cal.listar_eventos(start="2026-08-05", end="2026-08-05"))
```

```bash
# Listar eventos en un rango / List events in a range
print(cal.listar_eventos(start="2026-08-01", end="2026-08-10"))
```

```bash
# Agregar un evento / Add an event
uid, msg = cal.agregar_evento(
    evento={
        "summary": "Reunión con equipo / Team meeting",
        "description": "Revisar avances del proyecto / Review project progress",
        "dtstart": cal.parsear_fecha_hora("2026-08-05 10:00"),
        "dtend": cal.parsear_fecha_hora("2026-08-05 11:30"),
        "location": "Oficina virtual / Virtual office",
        "priority": 5,
    }
)
print(msg)  # Evento agregado con UID: agente-1234567890.1234
```

```bash
# Mostrar un evento por su UID / Show an event by UID
print(cal.mostrar_evento("agente-1234567890.1234"))
```
```bash
# Modificar un evento / Modify an event
ok, msg = cal.modificar_evento(
    "agente-1234567890.1234",
    summary="Reunión importante / Important meeting",
    dtstart=cal.parsear_fecha_hora("2026-08-06 11:00")
)
print(msg)  # Evento agente-1234567890.1234 modificado.
```
```bash
# Eliminar un evento / Delete an event
ok, msg = cal.eliminar_evento("agente-1234567890.1234")
print(msg)  # Evento agente-1234567890.1234 eliminado.
```

## Uso como CLI / Usage as CLI

```bash

# Listar calendarios / List calendars
calendario-cli calendars
```
```bash
# Listar eventos de hoy / List today's events
calendario-cli list --start 2026-08-05 --end 2026-08-05
```

```bash
# Listar eventos en un rango / List events in a range
calendario-cli list --start 2026-08-01 --end 2026-08-10
```
```bash
# Agregar evento / Add event
calendario-cli add --summary "Reunión con equipo / Team meeting" --description "Revisar avances / Review progress" --dtstart "2026-08-05 10:00" --dtend "2026-08-05 11:30" --location "Oficina virtual / Virtual office" --priority 5
```
```bash
# Mostrar evento / Show event
calendario-cli show agente-1234567890.1234
```

```bash
# Modificar evento / Modify event
calendario-cli modify agente-1234567890.1234 --summary "Reunión importante / Important meeting" --dtstart "2026-08-06 11:00"
```

```bash
# Eliminar evento / Delete event
calendario-cli delete agente-1234567890.1234
```

### `LICENSE`

MIT License

Copyright (c) 2026 Reinel G. Paredes

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.