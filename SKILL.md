---
name: sprint
description: Starts by itself in every project. Looks for the standard project documents (brief, sprint plan, updates, decisions); if none, asks the owner whether they want to work with a brief and sprints, and records the answer either way. In sprint mode it checks progress, works the next open sprint to done, and stops for the owner's review.
---

# Sprint running instruction

This skill starts by itself in every project. It never forces the sprint way of working on a project that does not want it.

## A. Find out how this project works (every session, first)

Skip the whole skill if the folder is not a project (no git repository and no code or documents the owner is working on), for example a home folder or a scratch folder.

Look for `docs/BRIEF.md`. Its first line after the title is `Working mode: sprint` or `Working mode: light`.

1. **`docs/BRIEF.md` exists and says `Working mode: light`:** the owner chose not to use sprints for this project. Do not ask again and do not run sprints. Log discoveries and decisions in `docs/UPDATES.md` and `docs/DECISIONS.md` as in section C, and stop reading this skill.
2. **It says `Working mode: sprint`:** carry on to section B (after making sure the other three documents exist: `docs/SPRINT_PLAN.md`, `docs/UPDATES.md`, `docs/DECISIONS.md`; create any that are missing from the templates).
3. **No `docs/BRIEF.md` at all (a new project to this skill):** ask the owner once, in one plain sentence: "Do you want to work on this project with a brief and sprints, or is it a quick job?" Then:
   - **Yes, sprints:** create all four documents from `templates/`, set `Working mode: sprint` in the brief, and write the brief with the owner: interview one question at a time (purpose, users, scope in, scope out, constraints, what success looks like, what is undecided). The owner must say the brief is right. Do not write code before that. Then draft `docs/SPRINT_PLAN.md` from the brief, set "Plan status: waiting for the owner's approval", and ask for approval.
   - **No, quick job:** create all four documents anyway from `templates/`, set `Working mode: light` and the date in the brief with the line "The owner does not require sprint working for this project." Leave the plan as a stub saying it is not used. Then do the job. Do not ask again.
   Record the choice in `docs/UPDATES.md` either way.

The owner can change the mode at any time by saying so. Change the line in the brief, log it in `docs/UPDATES.md` with the date, and if it is now sprint, run the brief interview and draft the plan.

## B. Work the plan (sprint mode only)

1. Read `docs/SPRINT_PLAN.md` in full, then the newest entries of `docs/UPDATES.md` and `docs/DECISIONS.md`.
2. If "Plan status" says it is waiting for approval, ask for approval and stop. On approval, write the date and commit.
3. Work out where things stand from the plan alone: each sprint's Status line and its `[x]` and `[ ]` tasks. Do not trust memory or earlier sessions over the plan. Tell the owner in one line where things stand.
4. If a sprint is "waiting for owner review", ask the owner to review it. Do not start the next sprint until they have. Then set it to "done, reviewed by the owner on <date>" and commit.
5. Otherwise take the first sprint that is not done, set it to "in progress", say which sprint and task you are starting, and work the open tasks in order.
6. Tick a task `[x]` only when it is done and checked, with a short note of the evidence beside it (test output, a log, a screenshot, a command and its result). Follow the plan's definition of done.
7. If a task is blocked on the owner, ask that one question, then carry on with tasks that do not depend on it. Where the plan gives a default, use it and say so.
8. When every task is ticked and the "done when" is met, set the status to "waiting for owner review", commit, push, and give a short result: what passed, what failed, the evidence. Ask for the review.
9. Never report a sprint or task as done unless the plan shows it ticked with evidence. Anything skipped is said plainly.

## C. Catch new information as it appears

Whenever you learn something that was not in the brief or plan, write it down in the same working session, not later:

- A discovery, surprise, limit or fact about the system goes in `docs/UPDATES.md` as a dated entry: what was found, how, and what it changes.
- A decision by the owner goes in `docs/DECISIONS.md`: date, the decision, the owner's reason.
- If it changes scope, a sprint or a done-when, edit `BRIEF.md` or `SPRINT_PLAN.md` too, and say so in the update entry.
- If it creates new work, add a task to the right sprint, or a new sprint. Never leave work only in conversation.
- If it contradicts an earlier statement in a document, fix the document and note the change.

## D. Habits (sprint mode)

- Commit small and often; each commit message says what changed. Update any document that describes changed behaviour in the same commit.
- Run the project's checks (tests, types, lint) before ticking a task.
- See the result running before calling a user-facing task done.
- Long-running jobs run in the background with their output in a file; do not wait idle.
- Ask before anything destructive, outward-facing or hard to reverse (deleting, force-pushing, shutting down machines).
- If a session ends mid-task, note exactly where it stopped on the task's line in the plan, so the next session resumes there.
