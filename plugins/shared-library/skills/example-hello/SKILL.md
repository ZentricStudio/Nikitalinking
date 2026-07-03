---
name: example-hello
description: A tiny example skill showing how a shared skill looks. Copy this folder to create your own. Triggers when the user asks for the "example hello" skill.
---

# Example Hello Skill

This is a template skill so you can see the shape of one. To make your own:

1. Copy this `example-hello/` folder to a new name under `skills/`, e.g. `skills/my-skill/`.
2. Rename the file to `SKILL.md` (it already is) and edit the frontmatter:
   - `name`: a short kebab-case id (must match the folder name).
   - `description`: one or two sentences. This is what tells Claude *when* to use the skill, so be specific about the trigger.
3. Write the instructions below the frontmatter — this is what Claude reads when the skill runs.
4. Commit and push. Everyone who has this marketplace installed gets it after `/plugin update`.

## What this skill does

When invoked, greet the user and remind them that shared skills added to this
repo automatically benefit the whole group.
