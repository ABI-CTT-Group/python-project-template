# About This Template

A modern Python project template following current best practices.

## How to Use This Template

1. Click **Use this template** > **Create a new repository** on GitHub.
2. Set the project name and visibility, then click **Create repository**.
3. Clone the new repository to your local machine.
4. **Customize the template** — search and replace these placeholders:
   - `package_name` — your Python package name (used in `src/`, `pyproject.toml`, imports)
   - `{YOUR-PROJECT-NAME}` — human-readable project title (README heading)
   - `{SHORT PROJECT DESCRIPTION}` — one-line project description
   - `{GITHUB_ACCOUNT}` — your GitHub username or organization
   - `{REPO_NAME}` — the repository name
   - `{PACKAGE_NAME}` — the PyPI package name (often the same as `package_name`)
   - Author name and email in `pyproject.toml`
5. Update the README by removing the "HOW TO USE THIS TEMPLATE" section.
6. Delete this file (`ABOUT_THIS_TEMPLATE.md`).
7. Make and push your first commit.


## What Is Included

- A modern [pyproject.toml](pyproject.toml) following PEP 621 for project metadata, build configuration, and tool settings — all in one file.
- A [Makefile](Makefile) with common development commands (install, test, lint, format, clean, build).
- [Ruff](https://docs.astral.sh/ruff/) for fast linting and formatting (replaces black, isort, flake8).
- [pytest](https://docs.pytest.org/) with coverage reporting for testing.
- GitHub repository metadata (issue templates, PR template).
- A disabled-by-default [GitHub Actions CI workflow](.github/workflows/ci.yml.disabled) for linting and testing on push/PR. (Rename to `ci.yml` to enable).
- [src layout](https://packaging.python.org/en/latest/discussions/src-layout-vs-flat-layout/) for proper package isolation.


## Structure

```text
├── .github/                     # GitHub metadata
│   ├── ISSUE_TEMPLATE/          # Issue templates (bug report, feature request)
│   ├── workflows/
│   │   └── ci.yml.disabled      # GitHub Actions CI pipeline (rename to ci.yml to enable)
│   └── PULL_REQUEST_TEMPLATE.md # PR template
├── docs/                        # Documentation (placeholder)
├── scripts/                     # Utility scripts (placeholder)
├── src/
│   └── package_name/            # Main Python package
│       └── __init__.py          # Package init with version via importlib.metadata
├── tests/                       # Unit tests
│   ├── __init__.py
│   └── test_placeholder.py      # Sample test to verify setup
├── .gitignore                   # Git ignore rules
├── ABOUT_THIS_TEMPLATE.md       # This file (delete after setup)
├── CODE_OF_CONDUCT.md           # Contributor Covenant v2.1
├── CONTRIBUTING.md              # Contribution guide
├── LICENSE                      # Apache License 2.0
├── Makefile                     # Development commands
├── README.md                    # Project readme
└── pyproject.toml               # Project metadata, build config, tool settings
```


## FAQ

### Why setuptools?

Setuptools is the most widely supported build backend for Python packages. It requires no extra tooling beyond pip and works everywhere. If you prefer [Hatch](https://hatch.pypa.io/), [PDM](https://pdm-project.org/), or [Poetry](https://python-poetry.org/), you can swap the `[build-system]` section in `pyproject.toml`.

### Why Ruff instead of black/isort/flake8?

[Ruff](https://docs.astral.sh/ruff/) is a single, extremely fast tool that replaces black, isort, flake8, and many other linters/formatters. It reduces the number of dev dependencies and configuration files while providing the same (or better) coverage.

### Why the `src/` layout?

The [src layout](https://packaging.python.org/en/latest/discussions/src-layout-vs-flat-layout/) ensures that tests run against the *installed* package, not the source directory. This catches packaging issues early and is the recommended layout by the Python Packaging Authority (PyPA).

### Why `pyproject.toml` for everything?

PEP 621 standardized project metadata in `pyproject.toml`. Keeping build config, dependencies, and tool settings (Ruff, pytest, coverage) in a single file reduces clutter and follows modern Python packaging conventions. This eliminates the need for `setup.py`, `setup.cfg`, `requirements.txt`, `tox.ini`, and similar files.

### Why `importlib.metadata` for the version?

Instead of maintaining a separate `__version__.py` or `VERSION` file, the package version is defined once in `pyproject.toml` and accessed at runtime via `importlib.metadata.version()`. This is the approach recommended by the Python Packaging Authority and avoids version duplication.

### Why is there no `setup.py`?

Modern Python packaging no longer requires `setup.py`. The `pyproject.toml` file with a `[build-system]` table is sufficient for building, installing, and distributing packages. Direct `pip install` from git URLs also works with `pyproject.toml`.

### Why no pre-commit?

Pre-commit is excellent for larger teams but adds an extra dependency and setup step. The same checks are available as Makefile targets (`make lint`, `make fmt`) and in the CI pipeline. You can add pre-commit later as the project grows.


## The Makefile

```bash
❯ make
Usage: make <target>

Targets:
  help            Show the help.
  install         Install the project in dev mode.
  fmt             Format code using Ruff.
  lint            Run Ruff linter and formatter check.
  test            Run tests with coverage.
  clean           Clean unused files.
  venv            Create a virtual environment.
  build           Build the package.
  check           Run all checks (lint + test).
```
