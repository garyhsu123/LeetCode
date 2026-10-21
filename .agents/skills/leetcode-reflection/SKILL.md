---
name: leetcode-reflection
description: Create or revise a concise first-person reflection note after a LeetCode problem is solved and its complexity has been discussed. Use whenever writing files under Notes/. Base the reflection on the solving conversation; do not use it to generate a solution during active tutoring.
---

# LeetCode Reflection

Analyze the conversation while the user solved a LeetCode problem and write a concise reflection note.

Preserve what will be useful months later: how the user thought, where they struggled or reasoned well, language knowledge they asked about, and meaningful feedback on their final code. Focus on the reasoning process rather than retelling the full solution or conversation.

## Rules

- Use only evidence from what the user said, attempted, misunderstood, corrected, or needed help with.
- Preserve the chronological truth of the process. Do not rewrite it as if the solution was clear from the beginning.
- Keep only information that will remain useful during future review; do not summarize the entire solution or conversation.
- Omit optional sections that have no meaningful evidence. Do not invent mistakes, strengths, insights, or advice to fill the template.
- Prefer the underlying reasoning issue over a surface-level code mistake.
- When a meaningful mistake or blocker exists, state what the user was thinking, why that reasoning was incomplete or incorrect, and what corrected it.
- Capture specific strengths such as a correct instinct, useful question, clear explanation, or efficient correction.
- Do not treat one mistake as a permanent weakness. Describe only what happened in this problem, using cautious language for any possible thinking pattern.
- Every improvement takeaway must directly address a mistake or blocker recorded in the note. If there was no meaningful mistake, the takeaway may reinforce a useful instinct instead.
- When the user asked or showed uncertainty about syntax, APIs, standard-library behavior, or language features, record only the reusable rule they are likely to forget.
- When the conversation showed a meaningful issue or improvement in how the user explained their reasoning, include one concise communication takeaway under **Approach & Reasoning**.
- Review the final code when available. Mention only meaningful feedback about correctness, edge cases, unnecessary complexity, readability, efficiency, data-structure choices, or idiomatic language usage. Do not nitpick formatting or minor style.
- Always include the final approach with validated time and space complexity, but keep it to one or two compact bullets.
- Write in first person, as if these are the user's own notes.

## Output Format

```markdown
# LC <number> — <Problem Name>

## Reflect

### Approach & Reasoning

- <How I approached the problem and any important change in direction.>
- <A meaningful communication observation, only when supported by the conversation.>

### Mistake / Blocker

- <What I thought, why it was incomplete or incorrect, and what corrected it. Omit this section if there was no meaningful mistake or blocker.>

### Went Well

- <A specific good instinct, question, explanation, or reasoning step. Omit this section if there is no useful evidence.>

### Language / Syntax

- <A reusable language rule or syntax reminder. Omit this section unless I asked or showed uncertainty.>

### Code Review

- <Meaningful feedback about the final implementation. Omit this section if there is no useful feedback.>

### Final Approach & Complexity

- <The final pattern or approach; time O(...), space O(...).>

### Key Takeaway

- <The most important realization or mental-model correction.>
- <What I should recognize, check, or ask myself earlier next time.>
```

Keep the entire reflection compact, usually four to eight bullets total. Each bullet should normally be one sentence. Merge related observations and avoid generic praise, generic advice, repetition, and unnecessary solution detail.
