# Design notes — why it is shaped like this

Most of the interesting decisions here are corrections. The design went through several revisions on
a real frame, and the shape it settled into is largely the shape of the mistakes that were found.
This page records those, because a reader adapting the model will otherwise repeat them.

---

## Two brackets, not one

The first version cantilevered the controller off a single rail. That put the whole 2.15 kg on one
bracket as a **moment** trying to rotate it about its bolt line, held only by preload friction
against a frame lug.

Bolting to **both** rails changes the problem entirely: the controller is supported on both sides,
each bracket carries roughly half the weight close in to its own rail, and the load is carried mostly
in **shear** rather than as a moment. The earlier worry about whether preload friction could hold a
cantilever largely goes away.

⚠️ **The two brackets are mirror images, not the same part twice.** The shelf is a trapezoid, deeper
at the rear because the rails narrow going back, and the controller sits 9.5 mm rearward — so the
bracket is asymmetric front to back. Turning one end for end puts the deep end at the front. They are
mirrored in **X** rather than Y: both give the opposite hand, but mirroring in X keeps the pads and
the shelf on the same faces, so one lay-down rotation serves both parts on the print plate.

---

## Nothing bolts flat to this frame

⚠️ **A flat back face does not work, and this reverses an assumption the first revision was built on.**

The rail lug is slightly **recessed**, and the frame around it is a rounded tube. A bracket with a
flat back fouls the tube before it ever reaches the lug face. So every part that bolts to these lugs
stands off on a **washer-shaped pad at each hole** and touches the frame nowhere else.

The stack is: **frame lug → 2 mm side panel → 6 mm pad → bracket wall.**

⭐ **A mistake worth recording:** the pad height was once cut from 6 mm to 4 mm, reasoning that the
bike's side panel supplied 2 mm of the clearance. Wrong — every measurement had been taken with the
panels **off**, so the 6 mm the rounded frame needs is measured against bare frame. The panel goes
*under* the pad and **adds** to the stack rather than substituting for part of it. It also means the
frame bolts get 2 mm longer, while the limiter length is unchanged.

---

## The 186 that was really 187

The gating measurement is the spacing between the two rail lugs. A second read off a tick scale put
it at 186, and that was set. Then a spine printed at 186 **only just** went on over both lugs.

A plate with two 5.5 mm holes swallows about half a millimetre of spacing error before it binds, so
"barely fits" is real evidence that the true figure is nearer 187. **A fit test on a printed plate
beats a read off a scale.** 187 is now canonical.

This is why the fit gauge exists and why it is the first thing to print.

---

## Ribs straddle the bolts — they do not sit on them

The shelf's ribs are pitched at a quarter of the controller bolt spacing, deliberately **offset by
half a pitch** so each bolt sits in the *centre* of a bay with a rib 13.25 mm either side.

⭐ The first attempt put a rib **exactly on** each bolt, reasoning that the load then travels straight
up a rib into the panel. It does — but **the nut goes on top of the shelf**, and a rib standing on
the hole means you cannot get a nut or a socket to it.

**A mount you cannot assemble is not a mount.** The offset leaves 20.5 mm of clear width at every
bolt, enough for a 10 mm socket, and the load still enters between two ribs a short distance from
both.

Rib positions are keyed to the controller bolts rather than spaced evenly along the blank. Even
spacing was arbitrary: it put ribs over vent slots, and left the two places where load actually
enters the shelf supported by whatever happened to be nearby.

---

## The shelf that stuck out 29 mm too far

Two faults compounded, and both are the same kind of fault:

1. `shelf_margin` was tied to a **vent-pattern** number. A decision about where louvres may sit was
   silently setting how far the bracket overhangs the controller. It is a structural dimension and
   now says so.
2. The reach function is measured from the **lug face**, but the shelf's coordinate has its origin at
   the bracket wall. Neither the pad offset nor the panel thickness was subtracted, so the shelf came
   out 16 mm deeper than the margin actually asked for — on top of an already generous 25 mm.

Net effect: 29 mm of shelf hanging past the edge of the controller. It is now **15 mm of material
past the bolt centre**, which is what an M6 through a 10.2 mm limiter actually needs.

**The lesson is the coupling, not the arithmetic.** A cosmetic parameter reaching into a structural
one is invisible until you measure the part.

---

## Compression limiters everywhere

Every bolt hole takes a **metal compression limiter**, so the nut clamps metal-to-metal down the
whole length and the plastic never sits in the squeeze path. M5 frame side, M6 controller side.

⚠️ **Never thread a bolt directly into the plastic.** A thread cut in ASA under a hanging load creeps
and backs out. Heat-set brass inserts are an acceptable alternative on the controller side, but a
through-bolt with a nyloc is stronger and cheaper.

The controller's own four holes are **plain 7 mm through holes**, not threads — so the bolt has to be
captured by the bracket rather than by the controller:

```
bolt head + washer under the controller's plate
  → up through the controller's 7 mm hole
  → up through the metal limiter in the standoff boss and the shelf
  → washer + nyloc on top of the shelf
```

⚠️ This is why the shelf's hole is **10.2 mm and not 6.6 mm**. The 10.2 is the *pocket for a 10 mm OD
limiter tube*, not the bolt hole — the bolt inside it is M6.

---

## Airflow

The shelf stands the controller off so air runs fore-and-aft along its alloy baseplate, and the
vertical panel carries **louvres rather than plain holes** so warmed air can leave. Fore-and-aft
grooves in the shelf's underside run the way the air does.

Louvres rather than holes because plastic needs its section: a louvre removes area for airflow while
leaving more material in the load path than a round hole of the same open area would.

---

## Known rough edges

Honest list, for anyone working on the model:

- **The `part` selector falls through to `bracket()`.** An unrecognised or misspelt part name silently
  renders a bracket rather than failing. That is arguably worse than rendering nothing, because you
  get a plausible STL of the wrong thing. A trailing `assert(false, ...)` would be the fix.
- **There are no design assertions.** Unlike a newer sibling project, the constraints in this file are
  enforced by comments rather than by `assert()`. Changing a number that breaks a relationship will
  produce a part, not an error.
- **`reach_at()` interpolates linearly** between the front and rear rail spans. The rails are not
  necessarily linear between the two measured points; over 187 mm the error is small, but it is an
  assumption, not a measurement.
