# Working rules seed: reverse-engineering projects

Use these as a starting draft for `AGENTS.md` in a project that studies a third-party program or game client (for example with the `rea` toolset). Adjust them to the confirmed target scope and keep them lean. The user accepted this set as written for a game-client project.

## Purpose line

`Reverse-engineering study of <program>'s <target subsystem> (<formats, structures, behavior>) using <toolset>. Other systems are out of scope unless needed to locate, load, or decode <target> data.`

## Rules

- **Offline by default.** Analyze locally installed files and saved captures. Attaching a debugger or Frida to, injecting into, or modifying a client that is connected to official servers, or sending crafted traffic to those servers, needs explicit per-task user authorization. The reason is account-ban and ToS risk on live online games.
- **Never modify the installed program.** Copy files into `work/` before extracting, patching, or instrumenting them.
- **Keep third-party data out of Git.** Extracted assets, binaries, memory dumps, packet captures, credentials, and session tokens stay in the gitignored `work/` folder. Commit notes, scripts, and small derived facts only. Publishing or redistributing extracted content needs user authorization.
- **Pin findings to a build.** Record the client version and file hash with every offset, structure, or format finding, and re-verify after updates.
- **Separate evidence from interpretation.** Mark each finding *confirmed* (cite the tool output: address, offset, hash, or capture) or *hypothesis*. Decompiler output is a hypothesis until it has been cross-checked.
- **Reconcile before retrying.** After a timeout or ambiguous tool result, inspect the actual state (open sessions, written files) before rerunning.

## Companion `.gitignore`

```gitignore
# Third-party data, dumps, captures, and secrets live here; never commit (see AGENTS.md)
/work/

# Strays outside work/
*.dmp
*.pcap
*.pcapng
.env
```

Add the target's own extracted-file extensions once they are known. Until then, the extension patterns catch only those types, so everything else must go in `work/`.

## Skip for these projects

Skip Unreal Editor ownership, map/asset authorization, and creative-acceptance rules unless the project also contains an engine project. If one is added later, rerun setup.
