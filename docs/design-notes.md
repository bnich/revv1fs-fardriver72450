# Design constraints

What the design requires and why, for anyone modifying the model or adapting it to another frame.
Each of these is load-bearing — changing it without understanding what it protects produces a part
that looks right and does not work.

---

## Two brackets, spanning both rails

The controller sits centred across the bike, bolted to a bracket on each rail. It is not cantilevered
off one.

Each bracket carries roughly half the weight close in to its own rail, and the load is carried mostly
in **shear** rather than as a moment trying to rotate a bracket about its bolt line.

⚠️ **The two brackets are mirror images, not the same part twice.** The shelf is a trapezoid, deeper
at the rear because the rails narrow going back, and the controller sits 9.5 mm rearward — so the
bracket is asymmetric front to back. Turning one end for end puts the deep end at the front.

They are mirrored in **X**, not Y. Both give the opposite hand, but mirroring in X keeps the pads and
the shelf on the same faces, so one lay-down rotation serves both parts on the print plate.

---

## Nothing bolts flat to this frame

The rail lug is recessed and the frame around it is a rounded tube. A bracket with a flat back face
fouls the tube before it reaches the lug face.

Every part bolting to these lugs stands off on a **washer-shaped pad at each hole** and touches the
frame nowhere else. The stack is:

```
frame lug → 2 mm side panel → 6 mm pad → bracket wall
```

⚠️ **The 6 mm pad height is measured against bare frame, panels off.** The bike's side panel goes
*under* the pad and **adds** to the stack — it does not substitute for part of it. With panels
fitted, the frame bolts are 2 mm longer. Limiter length is unchanged at 16 mm.

**If the bracket touches the tube anywhere, the pad height is wrong for your frame.** Do not force it.

---

## Ribs straddle the controller bolts

Rib pitch is a quarter of the controller bolt spacing (26.5 mm), **offset by half a pitch**, so each
bolt sits in the centre of a bay with a rib 13.25 mm either side.

⚠️ **Do not re-pitch the ribs to land on the bolts.** The nut goes on **top** of the shelf, and a rib
standing on the hole leaves no room for a nut or a socket. The offset gives **20.5 mm of clear width
at every bolt** — enough for a 10 mm socket — and the load still enters between two ribs a short
distance from both.

Rib positions are keyed to the controller bolts, not spaced evenly along the blank. Even spacing puts
ribs over vent slots and leaves the two points where load actually enters the shelf supported by
whatever happens to be nearby.

---

## Compression limiters in every bolt hole

Metal limiters everywhere, so the nut clamps **metal to metal** down the whole length and the plastic
never sits in the squeeze path. M5 frame side, M6 controller side.

⚠️ **Never thread a bolt directly into the plastic.** A thread cut in ASA under a hanging load creeps
and backs out. Heat-set brass inserts are acceptable on the controller side; a through-bolt with a
nyloc is stronger and cheaper.

The controller's four holes are **plain Ø7 through holes**, not threads, so the bolt must be captured
by the bracket:

```
bolt head + washer  under the controller's plate
  ↑ through the controller's Ø7 hole
  ↑ through the metal limiter in the standoff boss and the shelf
washer + NYLOC      on top of the shelf
```

⚠️ The shelf's hole is **10.2 mm** because it is the pocket for a **10 mm OD limiter tube**, not a
bolt hole. The bolt inside it is M6. Set `ctrl_limiter` to 6.6 if you would rather skip the tube and
spread the load with 20 mm washers, but the tube is the better joint.

---

## Shelf depth

**15 mm of material beyond the controller bolt centre** — what an M6 through a 10.2 mm limiter needs.

`shelf_margin` is a structural dimension and is defined as one. Do not tie it to the vent pattern:
a decision about where louvres may sit must not set how far the bracket overhangs the controller.

---

## Airflow

The shelf stands the controller off so air runs fore-and-aft along its alloy baseplate. Fore-and-aft
grooves in the shelf's underside run the same way.

The vertical panel carries **louvres rather than plain holes**, because plastic needs its section: a
louvre opens area for airflow while leaving more material in the load path than a round hole of the
same open area.

Engraved styling is engraved, not cut through, for the same reason.

---

## Known rough edges

For anyone working on the model:

- **The `part` selector falls through to `bracket()`.** An unrecognised or misspelt part name silently
  renders a bracket rather than failing, so you get a plausible STL of the wrong thing. A trailing
  `assert(false, ...)` is the fix.
- **There are no design assertions.** The constraints on this page are enforced by comments, not by
  `assert()`. Changing a number that breaks a relationship produces a part, not an error.
- **`reach_at()` interpolates linearly** between the front and rear rail spans. The rails are not
  necessarily linear between the two measured points; over 187 mm the error is small, but it is an
  assumption.
