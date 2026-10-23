# What happens in a project

New project, owner wants sprints: session start, no brief found, Claude asks, owner says sprints, the four documents are made, the brief is written with the owner and approved, the plan is drafted and approved, then sprints run one at a time with a review after each. Every later session reads the plan first and reports where things stand.

New project, quick job: session start, no brief found, Claude asks, owner says quick job, the four documents are made with `Working mode: light` and a note that the owner does not require sprints, the job is done, and Claude never asks again in that project.

Existing project that already has a brief: the mode line is read and followed. A brief with no mode line is treated as sprint mode and the line is added.

Not a project (home folder, scratch folder): the skill does nothing.

Changing your mind: tell Claude. It changes the mode line, logs it in UPDATES.md, and for sprint mode runs the brief interview and drafts the plan.
