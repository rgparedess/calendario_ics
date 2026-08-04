# calendario_ics

Módulo de Python para gestionar eventos en archivos .ics de KOrganizer.  
Python module to manage events in KOrganizer .ics files.

Proporciona operaciones CRUD (crear, leer, actualizar, eliminar) sobre eventos almacenados en archivos iCalendar (.ics) en el directorio de KOrganizer.  
Provides CRUD (create, read, update, delete) operations on events stored in iCalendar (.ics) files in the KOrganizer directory.

Todas las funciones devuelven `(bool, str)` o `(uid, str)` según corresponda.  
All functions return `(bool, str)` or `(uid, str)` as appropriate.

---

## Instalación / Installation

```bash
pip install calendario_ics
```

## Uso como librería / Usage as a library

```bash

import calendario_ics as cal

print(cal.listar_calendarios())
```

## Uso como CLI / Usage as CLI

```bash

calendario-cli calendars
```

```bash
calendario-cli add --summary "Reunión" --dtstart "2026-08-05 10:00"
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