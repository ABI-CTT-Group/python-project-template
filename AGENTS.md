# AI Agent Instructions

This file documents the project conventions for AI coding assistants.
It is the **single source of truth** — agent-specific files (`CLAUDE.md`, `.github/copilot-instructions.md`) reference this file.

## Project Architecture

- **Layout**: [src layout](https://packaging.python.org/en/latest/discussions/src-layout-vs-flat-layout/) — all package code lives under `src/package_name/`.
- **Build system**: setuptools with `pyproject.toml` (PEP 621). No `setup.py` or `setup.cfg`.
- **Package version**: Defined once in `pyproject.toml`, accessed at runtime via `importlib.metadata.version()`.
- **Entry point**: `src/package_name/__init__.py`.

```text
src/
└── package_name/
    └── __init__.py
tests/
├── __init__.py
└── test_placeholder.py
```

## Coding Conventions

- **Formatter & linter**: [Ruff](https://docs.astral.sh/ruff/) (replaces black, isort, flake8).
- **Line length**: 120 characters.
- **Lint rules**: `E` (pycodestyle errors), `F` (pyflakes), `I` (isort), `UP` (pyupgrade), `B` (bugbear), `SIM` (simplify).
- **Import ordering**: Managed by Ruff's `I` rule — standard library, third-party, then local imports.
- **Python version**: >= 3.12. Use modern Python features (type hints, `match` statements, f-strings, etc.).

## Testing Patterns

- **Framework**: [pytest](https://docs.pytest.org/) with coverage via `pytest-cov`.
- **Test location**: `tests/` directory (mirrors the package structure).
- **Test file naming**: `test_*.py` or `*_test.py`.
- **Running tests**: `make test` (runs `pytest -v --cov --cov-report=term-missing --cov-report=html`).
- **Test paths config**: Set in `pyproject.toml` under `[tool.pytest.ini_options]`.

## Build & Tooling Commands

All common tasks are available as Makefile targets:

| Command        | Description                          |
|----------------|--------------------------------------|
| `make install` | Install the project in dev mode      |
| `make fmt`     | Format code using Ruff               |
| `make lint`    | Run Ruff linter and formatter check  |
| `make test`    | Run tests with coverage              |
| `make check`   | Run all checks (lint + test)         |
| `make build`   | Build the package                    |
| `make clean`   | Clean unused files                   |
| `make venv`    | Create a virtual environment         |
