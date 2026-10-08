# Good and Bad Tests

## Good Tests

**Integration-style:** test through real interfaces, not mocks of internal parts.

```typescript
// GOOD: Tests observable behavior
test("user can checkout with valid cart", async () => {
  const cart = createCart();
  cart.add(product);
  const result = await checkout(cart, paymentMethod);
  expect(result.status).toBe("confirmed");
});
```

Characteristics:

- Tests behavior users or callers care about
- Uses public interfaces, except for explicitly required storage verification at an agreed seam; asserts only the required contract
- Survives internal refactors
- Describes what, not how
- One logical assertion per test

## Bad Tests

**Implementation-detail tests:** coupled to internal structure.

```typescript
// BAD: Tests implementation details
test("checkout calls paymentService.process", async () => {
  const mockPayment = jest.mock(paymentService);
  await checkout(cart, payment);
  expect(mockPayment.process).toHaveBeenCalledWith(cart.total);
});
```

Red flags:

- Mocking internal collaborators
- Testing private methods
- Asserting on call counts or order
- Test breaks when refactoring without behavior change
- Test name describes how, not what
- Verifying incidental implementation details through external means instead of the interface

Prefer public-interface checks that prove the required behavior. The database example below is bad for testing ordinary retrievability, not a blanket prohibition on explicitly required persistence or storage evidence at an agreed seam. Such evidence should assert only the required contract.

```typescript
// BAD for ordinary retrievability: observes storage instead of the public interface
test("createUser saves to database", async () => {
  await createUser({ name: "Alice" });
  const row = await db.query("SELECT * FROM users WHERE name = ?", ["Alice"]);
  expect(row).toBeDefined();
});

// GOOD: Verifies through interface
test("createUser makes user retrievable", async () => {
  const user = await createUser({ name: "Alice" });
  const retrieved = await getUser(user.id);
  expect(retrieved.name).toBe("Alice");
});
```

**Tautological tests:** expected value restates the implementation, so the test passes by construction.

```typescript
// BAD: Expected value is recomputed the way the code computes it
test("calculateTotal sums line items", () => {
  const items = [{ price: 10 }, { price: 5 }];
  const expected = items.reduce((sum, i) => sum + i.price, 0);
  expect(calculateTotal(items)).toBe(expected);
});

// GOOD: Expected value is an independent, known literal
test("calculateTotal sums line items", () => {
  expect(calculateTotal([{ price: 10 }, { price: 5 }])).toBe(15);
});
```

## Game behavior examples

- **Duplicate quest reward:** deliver the same completion event twice and assert through the public quest or reward behavior that the reward is granted once. Do not assert on a private event-handler call.
- **Editor placement idempotency:** repeat the same authorized placement action and assert the observable result contains the intended objects without duplicates. Test through the public placement action; add an Editor integration check when correctness depends on actual Editor behavior.

These checks establish behavior only. Visual quality and game feel require separate, appropriate evidence and human acceptance when applicable.
