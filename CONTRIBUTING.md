# Contributing

## Most valuable contribution: measurements from another frame

The gating number is the **187 mm** lug spacing, and it is measured on **one** REVV1 FS. Frame
dimensions vary between production runs more than anyone would like. If you fit the gauge to your own
bike, please report what you find — including "187 was fine", which is just as useful.

Also wanted:

- Whether the **6 mm pad standoff** clears the rounded tube on your frame.
- Shock clearance at full travel with the controller fitted.
- Photos of it fitted, and of any failure.

## Changing the model

`src/fardriver-underseat-mount.scad` is one heavily-commented file. The house style is that **every
number carries its reasoning and its field evidence**, because most of these numbers were wrong at
least once and the comment is what stops them being re-broken. Please match that.

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
