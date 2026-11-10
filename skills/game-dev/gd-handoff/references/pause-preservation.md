# Preserve resumable work outside prunable scratch

Use when a requested pause would leave necessary research inputs, reviewer returns or verification evidence only in temporary storage. This preserves existing work; it does not authorize another import, source change, acceptance run or commit.

## Procedure

1. **Freeze the resumption boundary.** Identify the maintained deliverable, its verified fingerprint, outstanding proposals and task-owned writers. Reconcile any running writer before archiving, because a changing input set cannot produce a reliable recovery manifest. Reuse an existing immutable comparison snapshot when available.
2. **Inventory before selecting.** Record file counts and byte sizes by role: raw findings and coverage, frozen assignments, proposals/reports, scripts, verification logs, reference assets, authoritative baselines and regenerable test outputs. Select task-owned data, not the entire workspace by default. Preserve provenance needed to interpret the next task, not merely its final summary.
3. **Choose a durable destination.** Use the user's handoff location, outside prunable scratch and outside the project repository for a session note. Preserve prior archives instead of overwriting them. Keep the original relative paths and record the original root, because frozen assignments may contain absolute paths.
4. **Reuse, rather than multiply, baselines.** Include the existing verified snapshot needed to interpret the pending proposals. Do not blanket-exclude database files: classify each by purpose. Omit identified test/candidate copies only when regeneration or a maintained recovery path is documented. State every exclusion; text reports and recorded hashes are not copies of excluded binaries.
5. **Write a manifest and archive.** Record each included file's relative path, byte size and SHA-256, plus excluded paths and reasons. Use standard-library `zipfile` and `hashlib` when sufficient. For large files, stream hashing/compression rather than retaining the entire collection in memory. Keep the archive outside the source tree so it cannot include itself.
6. **Verify what was saved.** Reopen the ZIP and require `ZipFile.testzip()` to return `None`; compare its member set with the manifest. Hash the included authoritative baseline and compare it with the known fingerprint. Record the completed archive's SHA-256 and recheck that the maintained deliverable is unchanged. Archive creation alone is not recovery verification.
7. **Write the short handoff.** Name the archive, manifest, authoritative state, unpublished work, actual exclusions and next action. Keep the archive inventory out of the prose note. Deliver the note; attach a large archive only when useful or requested.

## Restoration

Check the current checkout and maintained-library fingerprint first. Restore missing working data into an empty or explicitly reconciled destination; do not overlay newer files blindly. Verify restored hashes against the manifest, then reconcile any absolute paths recorded in frozen inputs without silently rewriting those original inputs. Reconstruct excluded disposable outputs only if needed; do not rerun completed acceptance merely to recreate paperwork.
