---
name: leetcode-reflection
description: Create or revise a concise first-person reflection note after a LeetCode problem is solved and its complexity has been discussed. Use whenever writing files under Notes/. Base the reflection on the solving conversation; do not use it to generate a solution during active tutoring.
---

# LeetCode Reflection

Write a short reflection that helps the user review their actual reasoning process, not a full walkthrough of the solution.

## Analyze the Conversation

- Use only evidence from what the user said, attempted, misunderstood, corrected, or needed help with.
- Preserve the chronological truth of the process. Do not rewrite it as if the solution was clear from the beginning.
- Capture specific strengths such as a correct instinct, useful question, clear explanation, or efficient correction.
- Prefer the root reasoning issue over a code symptom. Explain what the user was thinking, why that thinking was incomplete or incorrect, and what corrected it.
- Do not infer a general weakness from one incident. Describe a thinking pattern cautiously and only when the conversation supports it.
- Do not invent mistakes, strengths, insights, or advice to fill space.
- Mention language syntax, communication, or clean-code feedback only when it produced a distinct lesson.

## Connect Mistakes to Takeaways

- Every takeaway must follow from a specific mistake or blocker recorded in the note.
- State what the user should think, check, or do differently next time. Prefer a concrete cue such as: “When I see X, I should first check Y.”
- If there was no meaningful mistake, say so rather than inventing one. A takeaway may instead reinforce a useful instinct supported by the conversation.

## Output Format

```markdown
# LC <number> — <Problem Name>

## Went well

<One specific strength supported by the conversation.>

## Mistake

<What I thought, why it was wrong or incomplete, and what corrected it. State that no meaningful mistake was observed when appropriate.>

## Final approach

<A brief description of the final approach and the validated time and space complexity.>

## Takeaway

<One or two actionable reminders directly connected to the mistake above. Include a recurring-gap tag only when useful.>
```

Write in first person. Keep each section to one to three sentences or short bullets. Avoid generic praise, generic advice, repeated ideas, and unnecessary solution detail.
