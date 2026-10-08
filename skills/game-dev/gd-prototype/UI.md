# UI Prototype

Use this branch for a question about the layout, information hierarchy, or interaction of a game interface. For camera, world composition, movement feel, or other non-UI experience questions, choose a more faithful experiment in [SKILL.md](SKILL.md).

## Choose a useful context

Use the existing page, game screen, or project data when it is the best way to judge the interface in context. A browser variant is appropriate for a web interface. For Unreal UI, use the project's established widget and test-map workflow. Read project instructions and version-appropriate engine guidance rather than guessing APIs.

For live Editor work, keep variants in authorized, clearly marked scratch targets, use the one running Editor under its assigned ownership, and preserve unrelated unsaved work. Consult the relevant live-editor and scope rules in [GAME-DEVELOPMENT.md](../GAME-DEVELOPMENT.md). If a browser route is used, follow the project's routing convention, keep prototype rendering development-only, and retain the normal page behavior when prototype mode is inactive or a variant is unknown.

## Process

1. **State the question.** Describe the decision, intended player action, and what the user should compare. Reuse the supplied context instead of creating a separate spec.
2. **Make a small set of distinct options.** Three variants is a useful default for a visual comparison; use fewer when the question is narrow and add more only when they clarify a real alternative. Change layout, information hierarchy, or primary affordance, not only colors or copy.
3. **Keep the experiment isolated.** Reuse existing data and surrounding context where useful, but do not wire a throwaway variant to production mutations. Use project conventions and a clear prototype identity.
4. **Make comparison repeatable.** Provide a simple way to switch or reset variants and preserve comparable data, viewpoint, and interaction conditions. For game UI, include the player action or state needed to judge the interface.
5. **Show and record.** Present the options and relevant evidence. Let the user identify the preferred direction or combination, then record their verdict and the question it answers as described in [SKILL.md](SKILL.md).

Add only the checks needed to keep the experiment safe and the comparison credible. Keep the variant code and prototype route out of production behavior; any production implementation is a separate task.