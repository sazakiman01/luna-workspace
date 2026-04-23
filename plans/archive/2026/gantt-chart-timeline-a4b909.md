# Gantt Chart Resource Timeline

Rebuild the Resource Timeline page as a PM-style Gantt chart with horizontal task bars, SA/Dev color coding, and manual QC/UAT date markers.

## Summary of Requirements

| Feature | Detail |
|---------|--------|
| **Layout** | 1 row = 1 task, horizontal Gantt bars spanning start→end day |
| **Grouping** | Section headers by **UAT** column |
| **Left columns** | Task Name, No., Owner, Lead |
| **X-axis header** | Day numbers (1, 2, 3…) for selected month |
| **Bar colors** | Light shade = SA role, Dark shade = Dev role (from `role` field) |
| **QC marker** | Dark green bar on a single date — manual input per task |
| **UAT marker** | Red bar on a single date — manual input per task |
| **Month selector** | Same as current — pick month, shows 1 month at a time |

## Color Scheme

- Base color assigned per **module** or **phase** (palette of ~8 color pairs)
- Each pair has a **light** variant (SA) and **dark** variant (Dev)
- **Dark green (#166534)** = ส่ง QC date (manual)
- **Red (#dc2626)** = UAT date (manual)

## Implementation Steps

### 1. Backend — Redesign `/api/resource-timeline`
**File:** `backend/app.py`

- Return **flat task list** (not composite groups) — each item is one task row
- Include fields: `task`, `function_activity`, `module`, `phase`, `role`, `owner`, `lead`, `start_day`, `end_day`, `status`, `uat` (group key)
- Add a unique task identifier (`task_id` = `"{sheet}_{row_number}"`) for QC/UAT date storage
- Group tasks by `uat` field and sort within groups
- Keep: `available_months`, `month`, `days_in_month`, `day_labels`, `owners`

### 2. Backend — QC/UAT Date Storage API
**File:** `backend/app.py`

- **`POST /api/task-dates`** — Save QC or UAT date for a task
  - Body: `{ "task_id": "...", "qc_date": "2025-04-15", "uat_date": null }`
  - Store in `backend/task_dates.json`
- **`GET /api/task-dates`** — Return all saved dates
- Include saved QC/UAT dates in the resource-timeline response per task

### 3. Frontend — Gantt Chart Layout
**File:** `frontend/src/pages/ResourceTimelinePage.jsx`

- **Section headers**: Brown/orange row spanning full width for each UAT group
- **Task rows**: Left info columns (fixed ~350px) + day grid columns
  - Each Gantt bar = `position: absolute` with `left` and `width` calculated from `start_day`/`end_day`
  - Color = light or dark variant based on `role` field
- **QC column**: Dark green marker on QC date
- **UAT column**: Red marker on UAT date
- **Day header**: Numbers 1–31 across the top

### 4. Frontend — Manual QC/UAT Input
**File:** `frontend/src/pages/ResourceTimelinePage.jsx`

- Click on a task row's QC or UAT area → date picker popup (single date)
- On save → `POST /api/task-dates` → refresh display
- Show green dot / red dot on the corresponding day column

### 5. Keep Existing Features
- Month selector dropdown
- Search & filter (priority, process, module, phase)
- Owner workload chart at bottom (optional, can keep or remove)
