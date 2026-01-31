---
name: project-cleanup
description: Professional project folder cleanup and organization. Use when a user wants to clean up a messy project directory, remove duplicate files, consolidate scattered documentation, delete stale or redundant files, enforce best-practice folder structure, or reorganize a codebase for maintainability. Triggers on requests like "clean up my project", "organize this folder", "remove duplicates", "consolidate my docs", "restructure this repo", or any request about project folder hygiene and organization.
---

# Project Cleanup

Act as a professional software architect performing a thorough project audit and cleanup. The goal is to transform a chaotic project folder into a clean, maintainable structure that follows industry best practices.

## Workflow

Project cleanup involves these steps:

1. Audit the project (full directory scan and classification)
2. Identify the project type and target structure
3. Present cleanup plan to user for approval
4. Execute cleanup (deletions, consolidations, reorganization)
5. Create or update the single-source-of-truth README.md
6. Verify final structure

Follow these steps in order. Never delete files without presenting the plan first.

## Step 1: Audit the Project

Perform a comprehensive scan of the entire project directory:

1. List all files and directories recursively
2. Classify every file into one of these categories:
   - **Source code** - application logic, components, modules
   - **Configuration** - package.json, tsconfig, pyproject.toml, .env.example, etc.
   - **Documentation** - .md files, .txt docs, comments files
   - **Tests** - test files, test fixtures
   - **Build artifacts** - dist/, build/, __pycache__/, node_modules/
   - **Assets** - images, fonts, icons, static files
   - **Duplicates/versions** - files with _v2, _old, _backup, (copy) suffixes, or near-identical content
   - **Stale/junk** - empty files, placeholder content never filled in, OS artifacts (.DS_Store, Thumbs.db)

3. Flag all items matching anti-patterns. See `references/project-structures.md` for the full list of universal anti-patterns.

## Step 2: Identify Project Type and Target Structure

Determine the project ecosystem from config files and source code:
- **Python**: pyproject.toml, setup.py, requirements.txt, .py files
- **Node/JS/TS**: package.json, tsconfig.json, .js/.ts files
- **Web**: index.html with css/js directories
- **Monorepo**: packages/ or apps/ with workspace config

See `references/project-structures.md` for the canonical directory layout for each type.

If the project is a hybrid or doesn't match a standard type, design a sensible custom structure using the universal best practices from the reference.

## Step 3: Present Cleanup Plan

Present a clear plan to the user organized as:

**Files to DELETE** (with reason for each):
- Duplicate/versioned files and what they duplicate
- Build artifacts that should be gitignored
- Stale documentation, empty placeholders, OS junk
- Redundant config files

**Files to CONSOLIDATE**:
- Multiple .md files -> single README.md (list which files merge in)
- Scattered configs -> single location

**Files to MOVE** (reorganization):
- Source files into proper src/ structure
- Tests into tests/ directory
- Assets into assets/ directory

**Files to CREATE/UPDATE**:
- README.md (consolidated from all doc files)
- .gitignore (if missing or incomplete)

Wait for explicit user approval before proceeding. If the user wants to keep specific files, adjust the plan.

## Step 4: Execute Cleanup

After approval, execute in this order:

1. **Delete** flagged files (duplicates, junk, build artifacts)
2. **Move** files to their correct locations
3. **Remove** empty directories left behind
4. **Update** .gitignore if needed

For each action, briefly state what was done.

## Step 5: Create Single-Source-of-Truth README.md

Consolidate all scattered documentation into one `README.md` at the project root. Structure:

```markdown
# Project Name

Brief description of what the project does.

## Getting Started

Prerequisites and setup instructions.

## Usage

How to run/use the project.

## Project Structure

Brief overview of directory layout.

## Development

How to develop, test, and build.
```

Adapt sections based on what documentation existed. Preserve valuable content from deleted .md files. Omit sections that have no relevant content rather than leaving empty placeholders.

## Step 6: Verify Final Structure

After cleanup:
1. List the final directory tree
2. Confirm it matches the target structure from Step 2
3. Verify no orphaned files or empty directories remain
4. Report a summary of what was removed, moved, and created

## Important Rules

- **Never delete without approval** - always present the plan first
- **Preserve git history** - use `git mv` for moves when inside a git repo
- **Keep .git/ untouched** - never modify the .git directory
- **Err on the side of asking** - if uncertain whether a file is important, ask the user
- **One README.md** - the project root should have exactly one README.md as the single source of truth
- **No empty sections** - do not create placeholder documentation; only document what exists
- **Respect .gitignore** - do not delete files that are already properly gitignored and not tracked, unless they are cluttering the working directory
