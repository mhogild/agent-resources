# Project Structure Best Practices by Ecosystem

## Table of Contents
- Python Projects
- Node.js / JavaScript / TypeScript Projects
- General Web Projects
- Monorepos
- Universal Anti-Patterns
- Universal Best Practices

## Python Projects

```
project-name/
├── src/project_name/    # or project_name/ at root
│   ├── __init__.py
│   ├── main.py
│   └── modules/
├── tests/
├── docs/                # only if substantial docs exist
├── pyproject.toml       # or setup.py / setup.cfg
├── requirements.txt     # or managed via pyproject.toml
├── .gitignore
└── README.md
```

**Key signals**: `pyproject.toml`, `setup.py`, `requirements.txt`, `__init__.py`, `.py` files.

## Node.js / JavaScript / TypeScript Projects

```
project-name/
├── src/
│   ├── index.ts
│   ├── components/      # for frontend
│   └── utils/
├── tests/               # or __tests__/ or *.test.ts co-located
├── dist/                # build output (gitignored)
├── node_modules/        # (gitignored)
├── package.json
├── tsconfig.json        # if TypeScript
├── .gitignore
└── README.md
```

**Key signals**: `package.json`, `node_modules/`, `tsconfig.json`, `.js`/`.ts` files.

## General Web Projects (HTML/CSS/JS)

```
project-name/
├── index.html
├── css/
├── js/
├── assets/              # images, fonts, icons
├── .gitignore
└── README.md
```

## Monorepos

```
project-name/
├── packages/
│   ├── package-a/
│   └── package-b/
├── apps/
│   ├── web/
│   └── api/
├── package.json         # root workspace config
├── .gitignore
└── README.md
```

## Universal Anti-Patterns (files/dirs to flag for removal)

### Duplicate or versioned files
- `app_v2.py`, `main_old.js`, `index_backup.html`, `component.copy.tsx`
- `project_final/`, `project_final_v2/`, `old/`, `backup/`
- Any file with suffixes: `_old`, `_backup`, `_copy`, `_v1`, `_v2`, `_final`, `_FINAL`, `(1)`, `(copy)`

### Redundant documentation
- Multiple introductory `.md` files: `INTRO.md`, `ABOUT.md`, `OVERVIEW.md`, `GETTING_STARTED.md`, `SETUP.md` alongside a `README.md`
- `INSTALLATION_GUIDE.md`, `QUICK_REFERENCE.md` that duplicate README content
- `CHANGELOG.md` with no real history (just a template)
- `NOTES.md`, `TODO.md`, `SCRATCH.md` with stale/irrelevant content

### Build artifacts and generated files that should be gitignored
- `node_modules/`, `__pycache__/`, `.pyc` files, `dist/`, `build/`, `.next/`, `.cache/`
- `.env` files with real secrets (should be `.env.example` only)
- IDE-specific: `.idea/`, `.vscode/` (debatable - often gitignored)
- OS files: `.DS_Store`, `Thumbs.db`, `desktop.ini`

### Scattered configuration
- Config files that belong at root but are nested in subdirectories
- Duplicate config files at different levels

### Empty or placeholder files
- Empty directories with only `.gitkeep`
- Files with only boilerplate/template content never filled in

## Universal Best Practices

### Single source of truth
- One `README.md` at the project root
- One configuration file per tool (not scattered copies)
- One canonical source directory for application code

### Clear separation of concerns
- Source code in `src/` (or language-specific convention)
- Tests in `tests/` (or co-located with source)
- Documentation in `docs/` (only if substantial)
- Static assets in `assets/` or `public/`

### Gitignore discipline
- All build outputs, dependencies, and environment files in `.gitignore`
- No committed secrets or credentials

### Flat over nested
- Avoid deeply nested directory structures when flat works
- A file 4+ levels deep should have good reason to be there
