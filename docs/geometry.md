# Geometry — frame, controller, and the printed bracket

Every canonical number, with where it came from. Figures marked ⭐ were corrected by a physical fit
test after a measurement said otherwise; those are the ones to trust.

---

## 1. The frame side — Ride1Up REVV1 FS

| | mm | Provenance |
|---|---|---|
| Lug spacing | ⭐ **187** | Measured 186 off a tick scale; a spine printed at 186 only just went on. 187 is canonical — see [design-notes.md](design-notes.md) |
| Lug outside diameter | **16** | measured (15.98) |
| Frame bolt | **M5** | through a metal limiter |
| Pad standoff | **6** | ⚠️ measured against **bare frame**, panels off |
| Pad diameter | **15** | sized to sit on the lug |
| Side panel | **2** | sits between frame and pad; **adds** to the stack |
| Lug face → bracket wall | **8** | = 6 + 2 |
| Limiter bore | **8.2** | pocket; cut the tube to **16 mm** = wall + standoff |

⚠️ **Nothing bolts flat to this frame.** The lug is recessed and the frame around it is a rounded
tube, so the bracket stands off on a pad at each hole and touches the frame nowhere else.

---

## 2. The controller — FarDriver ND72450

| | mm | |
|---|---|---|
| Baseplate | **120 × 180** | |
| Hole inset | **7** from the long edges, **6** from the ends | |
| Hole pattern | **106 × 168** | 120 − 2×7 = 106 · 180 − 2×6 = 168 |
| Controller holes | **Ø7 plain through holes** | ⚠️ **not threads** |
| Mass | **2.15 kg** | |
| Controller bolt | **M6 × 30** | through a 10.2 mm limiter pocket, nyloc on top of the shelf |
| Slot elongation | **±1.0** | outboard, so the pair can find the rails |

⚠️ **Orientation is the trap.** The controller's **long axis runs across the bike**, spanning between
the rails. So the pair of holes landing on any one bracket is the **106 mm** pair, not the 168 mm
pair. Read `dx` as *along* the bike and `dy` as *across* it.

The sketch these came from labels the overall sizes "12 mm × 18 mm". Read as **centimetres** —
120 × 180 — which matches the ND72450 flat-plate spec. It cannot be millimetres: a 7 mm inset does
not fit inside a 12 mm width, and no 12 × 18 mm plate carries a 2.15 kg controller.

---

## 3. The printed bracket, as it comes out

```
215 × 50.3 × 55 mm      wall 10 mm      7 ribs
```

| | mm | |
|---|---|---|
| Blank length | **215** | lug spacing + nose + tail |
| Panel thickness | **10** | ⭐ was 4 mm when this was going to be aluminium. Plastic needs its section |
| Drop below lug line | **35** | |
| Margin above lugs | **20** | |
| End margin | **14** | |
| Rib pitch | **26.5** | = controller hole spacing ÷ 4, offset half a pitch so ribs straddle the bolts |
| Shelf margin | **15** | material kept beyond the **bolt centre** |

The rear controller bolt sits **31 mm behind the rear lug** — the shock clearance pushes the
controller rearward past it — so the blank grows a tail at that end to keep the bolt's standoff boss
landing on material.

---

## 4. Fasteners, summarised

| Where | Bolt | Through | Captured by |
|---|---|---|---|
| Frame | **M5** | 8.2 mm limiter, 16 mm long | frame lug |
| Controller | **M6 × 30** | 10.2 mm limiter in the shelf | washer + **nyloc on top of the shelf** |

⚠️ Different fasteners on the two sides. **Do not mix them.**
