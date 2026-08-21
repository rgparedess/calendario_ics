#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from setuptools import setup, find_packages

import os

long_description = ""
with open("README.md", "r", encoding="utf-8") as fh:
    long_description = fh.read()

# Añadir CHANGELOG.md solo si existe
if os.path.exists("CHANGELOG.md"):
    with open("CHANGELOG.md", "r", encoding="utf-8") as fh:
        changelog = fh.read()
        long_description += "\n\n---\n\n## Historial de Cambios\n\n" + changelog

setup(
    name="calendario_ics",
    version="2.3.1",
    author="Reinel G. Paredes",
    author_email="reinelgparedes@gmail.com",
    description="Biblioteca para manipular archivos ICS de calendario / Library to manipulate calendar ICS files",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/rgparedess/calendario_ics",
    include_package_data=True,
    py_modules=["calendario_ics"],
    license="MIT",
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    python_requires=">=3.6",
    install_requires=[],  # sin dependencias
    entry_points={
        "console_scripts": [
            "calendario-cli = calendario_ics:main",
        ],
    },
)