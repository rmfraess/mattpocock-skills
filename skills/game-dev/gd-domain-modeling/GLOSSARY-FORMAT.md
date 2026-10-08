# GLOSSARY.md Format

## Structure

```md
# {Context Name}

{One or two sentence description of what this context is and why it exists.}

## Language

**Order**:
{A one or two sentence description of the term}
_Avoid_: Purchase, transaction

**Invoice**:
A request for payment sent to a customer after delivery.
_Avoid_: Bill, payment request

**Customer**:
A person or organization that places orders.
_Avoid_: Client, buyer, account
```

## Rules

- **Be opinionated.** When multiple words exist for the same project concept, pick the best one and list the alternatives under `_Avoid_`.
- **Keep definitions tight.** Use one or two sentences and define what the term is.
- **Include project-domain terms only.** General programming concepts and engine APIs do not belong merely because the project uses them. Preserve established engine terms when they name actual engine concepts; define a project-specific meaning only when it needs clarification.
- **Group terms under subheadings** when natural clusters emerge. A flat list is fine when terms belong to one cohesive area.
- **Do not turn the glossary into a specification, implementation reference, adaptation-canon record, or creative-direction log.** Use existing project records for those purposes.

## Single vs multi-context repositories

**Single context (most repositories):** Keep one `GLOSSARY.md` at the repository root.

**Multiple contexts:** A root `GLOSSARY-MAP.md` lists each context, where its glossary lives, and how contexts relate:

```md
# Glossary Map

## Contexts

- [Ordering](./src/ordering/GLOSSARY.md): receives and tracks customer orders
- [Billing](./src/billing/GLOSSARY.md): generates invoices and processes payments
- [Fulfillment](./src/fulfillment/GLOSSARY.md): manages warehouse picking and shipping

## Relationships

- **Ordering to Fulfillment**: Ordering emits `OrderPlaced` events; Fulfillment consumes them to start picking
- **Fulfillment to Billing**: Fulfillment emits `ShipmentDispatched` events; Billing consumes them to generate invoices
- **Ordering and Billing**: Shared types for `CustomerId` and `Money`
```

Infer the structure from the repository:

- If `GLOSSARY-MAP.md` exists, read it to find contexts.
- If only a root `GLOSSARY.md` exists, use a single context.
- If neither exists, create a root `GLOSSARY.md` lazily when the first term is resolved.

When multiple contexts exist, infer which one the current topic concerns. Ask if the context is unclear.