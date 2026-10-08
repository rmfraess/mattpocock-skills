---
name: gd-tdd
description: Use when testing agreed gameplay behavior test-first.
---

# Test-Driven Development for Games

TDD is red, green, refactor. Use this reference to keep tests valuable: what a good test is, where it belongs, common anti-patterns, and the rules of the loop. Apply the guidance on every cycle.

When exploring the codebase, read `GLOSSARY.md` if it exists so test names and interface vocabulary match the project, and respect relevant ADRs.

## Good tests and seams

Test behavior through public interfaces, except for explicitly required storage verification at an agreed seam. Tests should read like a specification and survive internal refactors. See [tests.md](tests.md) for examples and [mocking.md](mocking.md) for mocking guidance.

Use project-approved testing guidance supplied by the caller together with the conversation, spec, and ticket. Reuse agreed seams without asking for another confirmation. If no seam is agreed, or a materially different seam is needed, explain why and ask before writing that test.

When the shape of an interface or test seam is itself in question, first confirm the adapted `gd-codebase-design` package is available, then load it with the available Skill tool and consult it as a reference. If it is unavailable, report the missing dependency and do not substitute the original `codebase-design` guidance.

## Anti-patterns

- **Implementation-coupled:** tests private methods, internal collaborators, or incidental details. Prefer public behavior. A required persistence check at an agreed seam is not implementation-coupled when it asserts only the required contract.
- **Tautological:** the expected value restates the implementation and cannot disagree with it. Use an independent literal, worked example, or spec requirement.
- **Horizontal slicing:** writing all tests before implementation commits to imagined behavior. Work in vertical slices, where each test informs one minimal implementation.

## Rules of the loop

- **Red before green.** Write the failing test first, then only enough code to pass it. Do not anticipate future tests or add speculative features.
- **One slice at a time.** Use one agreed seam and one minimal behavior change per cycle.
- **Never refactor while red.** Reach green first, then consider useful refactoring and rerun tests after each refactor.

Use the smallest faithful public interface for pure rules. When the claim depends on actual engine interaction, retain the relevant engine integration check. For tests involving the live Editor, saved maps or assets, or references, read the relevant sections of [GAME-DEVELOPMENT.md](../GAME-DEVELOPMENT.md) and coordinate through the assigned Editor owner. This skill does not authorize Editor operations. Unit or behavior evidence does not establish visual quality or game feel; record those separately through the appropriate human assessment.