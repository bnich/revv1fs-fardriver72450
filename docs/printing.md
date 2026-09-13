# Printing

## Material

**ASA, PC, PETG-CF or PA-CF. NEVER PLA.**

This is not a preference. PLA creeps under sustained load and softens near 60 °C, and the part hangs
2.15 kg in an under-seat cavity that reaches that in summer sun. A creeping bracket does not fail
suddenly — it sags, the bolts loosen, and then it fails.

ASA is the default here: it also holds up under UV. PETG-CF and PA-CF are both good choices if you
have them dialled in. PC if you have the enclosure.

## Orientation

**Print with the vertical panel flat on the bed, shelf standing up.**

That puts the layer lines across the panel rather than along the load path, and the shelf — which
carries the controller's weight in bending — prints as vertical walls rather than as a flat
cantilever that would peel layer from layer.

No supports are needed in this orientation. If your slicer wants them, the part is oriented wrong.

## Settings

- **Layer height** 0.2 mm.
- **Walls** 4 minimum. The 10 mm panel is thick, but its strength is in the perimeters.
- **Infill** 40–50 %. This is a structural part and a small one; do not economise here.
- **Brim** helps with ASA, which likes to lift.

## What to print, in order

1. **`gauge`** — settles the 187 mm lug spacing on your own frame. A few grams.
2. **`bracket_left`** and **`bracket_right`**, or **`plate`** for both at once.

⚠️ **`bracket_right` is a mirror image, not a second copy of `bracket_left`.** Printing the same part
twice gives you two left-hand brackets, and it is not obvious by eye — the shelf is a shallow
trapezoid. Use `plate` if you would rather not think about it.

## Building the STLs yourself

```bash
./tools/build.sh
```

> ⚠️ **If you script around OpenSCAD:** a failed `assert()` still exits 0 when exporting a tree format
> (`echo`, `csg`, `ast`, `term`) and for PNG, and only returns non-zero for a **solid** format
> (`stl`, `off`, `3mf`, `amf`). `build.sh` exports solid formats for that reason. Also,
> `openscad -o /dev/null` fails for any `.scad` file — `/dev/null` has no extension to infer a format
> from, so pass `--export-format=asciistl`.
