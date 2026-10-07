---
name: research
description: Use when researching questions from primary sources.
---

# Research

## Choose the execution path

- If you are already assigned the research work, apply this method directly. Do not dispatch another agent.
- If you are the orchestrating caller and need to continue other work, dispatch one background research worker and give it the brief below. The worker performs the research itself and does not dispatch further.

## Set the brief

Define the exact answerable question, scope and constraints, relevant versions or dates, source requirements, output format and location, and completion criteria. Resolve only ambiguities that could change the answer; otherwise state assumptions. Pass the complete brief to a worker, or use it to guide your own research.

## Research and verify

1. Use **primary sources** that own the facts: official documentation, source code, specifications, or first-party APIs. Trace every factual claim to its source; do not rely on a secondary account when the primary source is available.
2. Write one cited Markdown note. Distinguish sourced facts, inferences, and unresolved questions. Match the repository's existing note location convention; if none exists, choose a sensible location and state it.
3. Check that the note answers the question, each factual claim has a relevant citation, and unresolved questions are explicit. Report the note's absolute path.
4. When work was delegated, the parent checks the saved note against the brief and citations, then reports the result and path without repeating the investigation. When working directly, perform that check yourself.
