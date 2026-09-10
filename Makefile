.PHONY: help
help:             ## Show the help.
	@echo "Usage: make <target>"
	@echo ""
	@echo "Targets:"
	@grep -E '^[a-zA-Z_-]+:.*##' Makefile | awk 'BEGIN {FS = ":.*## "}; {printf "  %-15s %s\n", $$1, $$2}'

.PHONY: install
install:          ## Install the project in dev mode.
	pip install -e ".[dev]"

.PHONY: fmt
fmt:              ## Format code using Ruff.
	ruff format src/ tests/
	ruff check --fix src/ tests/

.PHONY: lint
lint:             ## Run Ruff linter and formatter check.
	ruff check src/ tests/
	ruff format --check src/ tests/

.PHONY: test
test:             ## Run tests with coverage.
	pytest -v --cov --cov-report=term-missing --cov-report=html

.PHONY: clean
clean:            ## Clean unused files.
	@find . -name '*.pyc' -exec rm -f {} +
	@find . -name '__pycache__' -exec rm -rf {} +
	@find . -name 'Thumbs.db' -exec rm -f {} +
	@find . -name '*~' -exec rm -f {} +
	@rm -rf .cache
	@rm -rf .pytest_cache
	@rm -rf .mypy_cache
	@rm -rf .ruff_cache
	@rm -rf build
	@rm -rf dist
	@rm -rf *.egg-info
	@rm -rf src/*.egg-info
	@rm -rf htmlcov
	@rm -rf .tox
	@rm -rf .nox
	@rm -rf .coverage
	@rm -rf coverage.xml
	@rm -rf docs/_build

.PHONY: venv
venv:             ## Create a virtual environment.
	@echo "Creating virtualenv ..."
	@rm -rf .venv
	@python3 -m venv .venv
	@./.venv/bin/pip install -U pip
	@./.venv/bin/pip install -e ".[dev]"
	@echo ""
	@echo "Run 'source .venv/bin/activate' to activate the environment."

.PHONY: build
build:            ## Build the package.
	python -m build

.PHONY: check
check: lint test  ## Run all checks (lint + test).
