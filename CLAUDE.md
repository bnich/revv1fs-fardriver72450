# CLAUDE.md — FarDriver ND72450 under-seat mount

Parent guidance: `../CLAUDE.md` — repo map, conventions, public-repo hygiene, and the ⚠️ OpenSCAD
traps (a failed `assert()` exits 0 for tree formats and PNG; only solid exports catch it).

## What this is

One OpenSCAD file, `src/fardriver-underseat-mount.scad`, producing a mirrored pair of brackets that
carry the controller across both frame rails. **Printed and in service** — treat changes with the
caution that deserves.

## Before changing anything

Read `docs/design-notes.md`. Several dimensions look arbitrary and are not — the pad standoff, the
rib offset, the 10.2 mm limiter pocket. Each states what it protects.

⚠️ **The two brackets are mirror images, not the same part twice.**

## Known rough edges — deliberate, documented, fair game to fix

- The `part` selector **falls through to `bracket()`** on an unrecognised name, so a typo silently
  renders a plausible STL of the wrong part. A trailing `assert(false, ...)` is the fix.
- **There are no design assertions.** The constraints live in comments. The sibling display-mount repo
  shows the pattern worth porting.

## Verifying

`./tools/build.sh` exports every part and checks each bounding box. It exports **solid** formats
deliberately — see the OpenSCAD traps in `../CLAUDE.md`.
