# Brendon's Dotfiles

## Commit Conventions

This repository follows [Conventional Commits](https://www.conventionalcommits.org/) for commit messages to ensure a standardized commit history.

### Commit Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types

- **feat**: A new feature
- **fix**: A bug fix
- **docs**: Documentation changes
- **style**: Changes that don't affect code functionality (formatting, etc.)
- **refactor**: Code changes that neither fix a bug nor add a feature
- **perf**: Performance improvements
- **test**: Adding or fixing tests
- **build**: Changes to build system or dependencies
- **ci**: Changes to CI configuration
- **chore**: Other changes that don't modify src or test files

### Example

```
feat(nvim): add new plugin for markdown preview

- Adds real-time preview functionality
- Configures keybindings for toggle

Closes #123
```

### Using Commitizen

You can use the commitizen CLI to help format your commits:

```bash
npm run commit
```

## Setup

- Run `./install` inside `.dotfiles` directory.

### Updating Homebrew Packages

- Run `install-homebrew-packages`

### Install Hooks

`pre-commit install`

Setup pre-commit for husky