# HTML Report Format

The architecture survey is a standalone HTML file in the OS temporary directory. Inline CSS and hand-built SVG or HTML diagrams are the default, so the report works offline without remote dependencies. Use Mermaid only when a suitable local asset already exists; do not install or add a bundling system. Hand-built diagrams remain the fallback.

## Scaffold

```html
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>Architecture review for {{repo name}}</title>
    <style>
      :root { color-scheme: light; font-family: system-ui, sans-serif; color: #0f172a; background: #fafaf9; }
      body { margin: 0; }
      .report { max-width: 64rem; margin: 0 auto; padding: 3rem 1.5rem; }
      .candidates { display: grid; gap: 2.5rem; }
      .card, .diagram-card { border: 1px solid #e2e8f0; border-radius: .75rem; background: white; padding: 1.25rem; }
      .before-after { display: grid; grid-template-columns: repeat(2, minmax(0, 1fr)); gap: 1rem; }
      .seam { stroke-dasharray: 4 4; }
      .leak { stroke: #dc2626; }
      .deep { fill: #0f172a; }
    </style>
  </head>
  <body>
    <main class="report">
      <header>...</header>
      <section id="candidates" class="candidates">...</section>
      <section id="top-recommendation">...</section>
    </main>
  </body>
</html>
```

## Header

Include the repository name, date, and a compact legend: solid box means module, dashed line means seam, red arrow means leakage, and thick dark box means deep module. Skip an introduction paragraph and go straight to the candidates.

## Candidate card

Diagrams carry the weight. Keep prose sparse, plain, and use the project's terms plus [the architecture vocabulary](./SKILL.md) for architectural concepts.

Each candidate is one `<article>`:

- **Title:** short and names the proposed deepening.
- **Badge row:** recommendation strength (`Strong` = emerald, `Worth exploring` = amber, `Speculative` = slate), plus a dependency category when useful (`in-process`, `locally substitutable`, `engine-coupled`, `remote but owned`, or `true external`).
- **Files and assets:** monospaced list of the relevant source files and affected assets.
- **Before / After diagram:** the centrepiece, with two columns side by side.
- **Problem:** one sentence naming the concrete friction.
- **Solution:** one sentence describing the change.
- **Wins:** short bullets naming the actual gains.
- **Cost, risk, or evidence limit:** include a concise note only when it materially affects the recommendation.
- **ADR callout:** one line in an amber box when a real conflict warrants reopening an existing decision.

Avoid explanation paragraphs. If the diagram needs a paragraph to be understood, redraw it.

## Diagram patterns

Pick the pattern that fits the candidate. Mix them rather than making every diagram look the same.

### Dependency or call-flow graph

Use Mermaid only when a suitable local Mermaid asset already exists and the report can use it. Otherwise draw the graph with inline SVG or HTML. Style relevant leakage edges red and the deep module dark. Sequence diagrams work well for showing many calls becoming one.

```html
<div class="diagram-card">
  <pre class="mermaid">
    flowchart LR
      A[Order handler] --> B[Order validation]
      B --> C[Order persistence]
      C -.leak.-> D[Pricing client]
      classDef leak stroke:#dc2626,stroke-width:2px;
      class C,D leak
  </pre>
</div>
```

### Hand-built boxes and arrows

Render modules as labeled `<div>` elements with borders and arrows as inline SVG lines or paths. Use this when the after diagram should read as one deep module with internal details faded.

### Cross-section

Stack horizontal bands to show a call passing through multiple shallow steps. The after diagram can show one deeper module with the relevant responsibility concentrated.

### Mass diagram

Use two rectangles per module to compare interface surface and implementation. A shallow module has an interface nearly as complex as its implementation; a deep module hides substantial behavior behind a clearer interface.

### Call-graph collapse

Show a call tree before and the same internal calls faded inside one module after.

### Asset and code relationships

When assets explain the friction, show only the relevant asset dependencies or references alongside code. Keep the sketch scoped to the named candidate. Do not imply that a diagram proves saved references, runtime behavior, or editor state.

## Style guidance

- Use a lean editorial style, not a corporate dashboard. Leave generous whitespace. A serif heading is optional.
- Use color sparingly: one accent plus red for leakage and amber for warnings.
- Keep diagrams near 320px tall so before and after fit comfortably side by side.
- Use compact labels for modules and relevant engine or asset concepts so diagrams read as schematics.
- The default report needs no scripts. CSS and diagrams are inline. A suitable local Mermaid asset is optional; remote CDN dependencies are not part of the default.

## Top recommendation

Use one larger card with the candidate name, one sentence explaining why it should come first, and an anchor to its card.

## Language

Use module, interface, implementation, depth, deep, shallow, seam, adapter, leverage, and locality when describing those architectural concepts. Keep accurate engine, project, asset, and domain terminology when that is what the design means. Use the glossary vocabulary for domain terms. Be concise and concrete; do not force architectural words onto unrelated engine concepts.