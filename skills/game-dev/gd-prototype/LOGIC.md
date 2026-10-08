# Logic Prototype

Use this branch for a question about game rules, state transitions, or data shape. The experiment may be a small executable harness, an Unreal test map, a repeatable play scenario, an asset/save check, or a browser demo. Choose the smallest form that preserves the behavior being judged.

If the question depends on engine behavior such as physics, tick order, input, animation, loading, or save references, keep that behavior in the experiment. A fast pure-code model is not a substitute when it removes the suspected behavior.

## Process

1. **State the question.** Name the rule or state transition, a representative scenario, what should happen, and the minimum evidence that answers it.
2. **Choose a faithful setup.** Prefer a focused rules harness for isolated logic. Use an engine-native test map or play scenario when the engine, authored content, or timing is load-bearing. Use HTML when it is genuinely the cheapest faithful interface for the question or its intended reviewer.
3. **Keep scope small.** Use clearly labeled scratch targets separate from production content. Reuse the project's existing module, map, or test conventions where they help; do not add a portable architecture or production abstractions just to make a throwaway experiment.
4. **Expose the result.** Show the relevant state or observable outcome after each meaningful action. Include the awkward cases that could change the answer, and make reset/replay straightforward when comparison matters.
5. **Record the finding.** Demonstrate the result, evidence, conditions, and remaining uncertainty. The user supplies the verdict. Preserve a useful runnable artifact under the scope and authorization in [SKILL.md](SKILL.md).

Add a check only when it prevents an unsafe operation or makes the result more trustworthy. Persistence is normally unnecessary, but use an authorized scratch save when the question itself or later replay/comparison depends on it.

## Avoid

- A fast model that removes the behavior being investigated.
- Production wiring, speculative generalization, and cleanup unrelated to the question.
- Treating a prototype's result as user acceptance or production approval.
- Declaring a performance pass without an approved target or a comparable baseline.