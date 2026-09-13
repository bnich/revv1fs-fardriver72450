# Contributing

## Most valuable contribution: measurements from another frame

The **187 mm** lug spacing is measured on one REVV1 FS. Frame dimensions vary between production
runs. If you fit the gauge to your own bike, please report the result — including "187 was fine".

Also wanted:

- Whether the **6 mm pad standoff** clears the rounded tube on your frame.
- Shock clearance at full travel with the controller fitted.
- Photos of it fitted, and of any failure.

## Changing the model

`src/fardriver-underseat-mount.scad` is one heavily-commented file. The house style is that **every
number states what it protects**, so it cannot be silently re-broken. Please match that.

Before opening a PR:

```bash
./tools/build.sh
```

Two things worth fixing if you are looking for somewhere to start, both listed in
[docs/design-notes.md](docs/design-notes.md) under "known rough edges":

1. The `part` selector should end in `assert(false, ...)` rather than falling through to `bracket()`.
2. The design's relationships are enforced by comments, not `assert()` guards.

## Licence

Contributions are accepted under [CC BY-SA 4.0](LICENSE).
