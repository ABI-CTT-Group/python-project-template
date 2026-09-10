# How to Develop on This Project

{PROJECT_NAME} welcomes contributions from the community.

## Setting Up Your Fork

1. On GitHub, click the **Fork** button.
2. Clone your fork:
   ```bash
   git clone git@github.com:YOUR_GITHUB_USERNAME/{REPO_NAME}.git
   ```
3. Enter the directory:
   ```bash
   cd {REPO_NAME}
   ```
4. Add the upstream remote:
   ```bash
   git remote add upstream https://github.com/{GITHUB_ACCOUNT}/{REPO_NAME}
   ```

## Setting Up the Development Environment

1. Create a virtual environment:
   ```bash
   python3 -m venv .venv
   ```
   Or use the Makefile shortcut:
   ```bash
   make venv
   ```

2. Activate the virtual environment:
   ```bash
   source .venv/bin/activate
   ```

3. Install the project in development mode with dev dependencies:
   ```bash
   make install
   ```
   This runs `pip install -e ".[dev]"`, which installs the package in editable mode along with pytest, pytest-cov, and Ruff.

## Making Changes

1. Create a new branch:
   ```bash
   git checkout -b my-feature-branch
   ```

2. Make your changes using your preferred editor.

3. Format your code:
   ```bash
   make fmt
   ```

4. Check for lint issues:
   ```bash
   make lint
   ```

5. Run tests:
   ```bash
   make test
   ```

6. Run all checks at once:
   ```bash
   make check
   ```

## Committing

This project uses [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/).

Examples:
```
feat(core): add new data processing module
fix(parser): handle empty input correctly
docs: update installation instructions
```

## Submitting a Pull Request

1. Push your changes:
   ```bash
   git push origin my-feature-branch
   ```
2. On GitHub, open a **Pull Request** against the `main` branch.
3. Wait for CI to pass and a maintainer to review your PR.

## Making a Release

This project uses [semantic versioning](https://semver.org/) with `X.Y.Z` tags.

1. Update the `version` field in `pyproject.toml`.
2. Commit the version bump:
   ```bash
   git commit -am "release: version X.Y.Z"
   ```
3. Create and push a tag:
   ```bash
   git tag vX.Y.Z
   git push origin main --tags
   ```
