# Changelog

## Unreleased

### Added
- First public release of a design that is **already printed and in service** — the bike runs on
  these brackets.
- `bracket_left`, `bracket_right`, `brackets_plate` and the `gauge`, plus the measuring jigs and rig
  used to derive the frame geometry.
- Documentation: geometry with provenance, design notes covering the corrections baked into the
  shape, printing and assembly.

### Known
- The `part` selector falls through to `bracket()` for an unrecognised name, so a typo silently
  renders a plausible STL of the wrong thing.
- The model has no `assert()` guards; its constraints are enforced by comments.
