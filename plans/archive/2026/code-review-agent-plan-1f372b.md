# Code Review Agent Plan
This plan proposes a documentation-first agent-friendly folder that bundles guidelines, checklists, and prompts so Windsurf agents can review this repo consistently without modifying existing code.

## Goals & Constraints
- Improve code-quality oversight with zero impact on current source files or deployments.
- Provide a predictable entry point (folder + docs) that any Windsurf agent can follow.
- Keep content extensible so future team standards can plug in easily.

## Proposed Folder Structure (suggested path: `/code-review` at repo root)
1. `README.md` – purpose, how to use the folder, quickstart for reviewers/agents.
2. `workflow.md` – step-by-step review flow (inputs to collect, analysis order, outputs).
3. `checklists/`
   - `general.md` – high-level questions (correctness, readability, testing, security).
   - `frontend.md`, `backend.md`, etc. as the repo grows.
4. `templates/`
   - `review-report.md` – structured template for recording findings (severity, file refs, follow-ups).
   - `risk-log.md` – running log format for recurring issues.
5. `agent-prompts/`
   - `windsurf-agent.md` – instructions + sample prompt for invoking the review agent inside Windsurf (what files to open, how to cite lines, tone, etc.).
6. `references.md` – links to existing repo docs (e.g., `CLAUDE.md`, `test-pattern.md`), coding standards, testing rules.

## Agent Experience in Windsurf
- Windsurf users open `/code-review/README.md` first; it links to workflow and prompts.
- Agent prompt document tells Windsurf agent how to scope reviews: collect diff, cross-check checklist, summarize using templates.
- Reports get written into `/code-review/reports/` (optional future subfolder) but outside current scope since no new code files should change yet.

## Deliverables for Next Phase
1. Create `/code-review` folder with the files above, populated with actionable content tailored to this repo (in Thai/English mix as needed).
2. Ensure references point to current repo tooling (React/Vite/Tailwind, Vitest practices from `test-pattern.md`).
3. Provide sample agent prompt + review report snippet so reviewers can copy/paste immediately.

Once approved, I will implement the folder and documentation exactly as outlined without touching existing source files.
