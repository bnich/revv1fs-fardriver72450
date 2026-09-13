// ============================================================
//  REVV1 · FarDriver ND72450 mount — PAIR OF PRINTED BRACKETS  (rev E)
//
//  CORRECTED 2026-09-07 (owner): there are TWO brackets, one on each frame
//  rail, and the controller bolts to BOTH. It sits centred across the bike,
//  spanning the two rails and protruding an equal amount past each — which is
//  what "the 12 cm side faces out and it is symmetrical" meant.
//
//  THIS IS STRUCTURALLY MUCH BETTER AND IT CHANGES THE WARNINGS:
//  the controller is no longer cantilevered off one rail. It is supported on
//  both sides, so the load is shared and carried mostly in SHEAR rather than as
//  a moment trying to rotate a single bracket about its bolt line. The earlier
//  worry about preload friction holding a cantilever largely goes away. Each
//  bracket now carries roughly half the weight, close in to its own rail.
//
//  Each bracket takes TWO of the controller's four holes — the pair on its side,
//  186 mm... no: 168 mm apart along the bike. The other two go to its mirror.
//
//  ⬜ GATING MEASUREMENT: the across-the-bike distance between the two rails'
//  LUG FACES (rail_face_span below). Everything about how far each shelf has to
//  reach falls out of that one number, and it is the last thing missing.
//
//  Unchanged from the earlier revisions and still true:
//    · ASA / PC / PETG-CF / PA-CF. NEVER PLA — it creeps and softens near 60 C.
//    · METAL COMPRESSION LIMITERS in every bolt hole, so no bolt preload ever
//      passes through plastic. Frame side M5, controller side M6.
//    · Controller bolts are M6 through its plain 7 mm holes, with a washer and
//      NYLOC on top of the shelf. Never thread into the plastic.
//    · Print with the VERTICAL PANEL FLAT ON THE BED, shelf standing up.
//    · The shelf stands off the controller so air runs fore-and-aft along the
//      alloy plate; louvres let the warmed air out.
//    · Proof-load before trusting it.
//
//  PARTS: gauge | panel | bracket | layout        (print bracket TWICE, mirrored)
// ============================================================


/* [MEASURED on the bike] */
/* ⚠ 187, NOT 186. The 2nd gauge read put it at 186 and the owner set that, but
   the printed spine at 186 only just went on over both lugs (owner 2026-09-07).
   A plate with two 5.5 mm holes swallows about half a millimetre of spacing error
   before it binds, so a "barely fits" is real evidence the true figure is nearer
   187. A fit test on a 4 mm plate beats a read off a tick scale, so 187 wins and
   this is now the canonical number for the brackets too.
   If 187 still feels tight, open ONE hole with a 6 mm drill rather than reprint —
   but only one, or the fore/aft datum starts to float. */
lug_spacing   = 187;
bolt_dia      = 5;
lug_od        = 16;

/* [FRAME-SIDE STANDOFF — owner 2026-09-07] ⚠ NOTHING BOLTS FLAT TO THIS FRAME.
   The lug is slightly RECESSED and the frame around it is a rounded tube, so a
   flat back face fouls the tube before the lug face is reached. Every part that
   bolts to these lugs therefore stands off on a washer-shaped pad at each hole
   and touches the frame NOWHERE else. This reverses the earlier "back face bears
   flat on the rail" assumption — that surface does not exist. */
/* Pad height, 6 mm. ⚠ I cut this to 4 once, reasoning the panel supplied 2 mm of the
   clearance. WRONG, and the owner caught it: every measurement was taken with the
   panels OFF, so the 6 mm the rounded frame needs is measured against bare frame and
   the panel does not come out of it. The panel goes UNDER the pad and adds to the
   stack rather than substituting for part of it.
   Order is: frame lug -> 2 mm panel -> 6 mm pad -> bracket wall. */
lug_standoff  = 6;
lug_pad_d     = 15;    // pad diameter, sized to sit on the lug (OD 15.98)
/* A 2 mm panel on each side sits between the frame and the bracket, and the bracket
   bears on it (owner 2026-09-08). It is part of the bike, not printed, so it is not
   modelled — but it pushes the whole bracket 2 mm further outboard, so every
   distance quoted from the LUG FACE has to cross it. ⚠ The frame bolts also get
   2 mm longer. Limiter length is unchanged at pad + wall = 16 mm. */
side_panel    = 2;
mount_off     = lug_standoff + side_panel;   // lug face to the bracket's inner wall

/* [CONTROLLER SIDE — a DIFFERENT fastener from the frame side, do not mix them]
   The FarDriver's four holes are PLAIN THROUGH HOLES at 7 mm (owner 2026-09-07),
   not threads. So they are clearance holes for an M6, and the bolt has to be
   captured by the bracket rather than by the controller.

   ⚠ DO NOT THREAD STRAIGHT INTO THE PLASTIC. A thread cut in ASA under a
   hanging load creeps and backs out. Assemble it this way instead:

       bolt head + washer under the controller's plate
         -> up through the controller's 7 mm hole
         -> up through the METAL LIMITER in the standoff boss and the shelf
         -> washer + NYLOC nut on top of the shelf

   The limiter means the nut clamps metal-to-metal down the whole length and the
   plastic never sits in the squeeze path, same principle as the frame side. The
   solid disc the vent mask leaves round each hole is the washer face. Heat-set
   brass inserts are an acceptable alternative, but a through-bolt with a nyloc
   is stronger and cheaper. */
/* [CONTROLLER FASTENER — M6 x 30, owner 2026-09-09]
   M6 passes the baseplate's 7 mm holes cleanly, so there is nothing to drill. It also
   restores the limiter on this side: 10 mm of shelf sits in the clamp path and a
   printed part will creep under a constant preload without a steel tube carrying it.
   ⚠ THIS IS WHY THE HOLE IS 10.2 AND NOT 6.6. The 10.2 is the pocket for a 10 mm OD
   limiter tube, not the bolt hole — the bolt inside it is 6 mm. Set ctrl_limiter to
   6.6 if you would rather skip the tube and spread the load with 20 mm washers, but
   the tube is the better joint. */
ctrl_bolt_dia = 6;     // M6 x 30
ctrl_limiter  = 10.2;  // pocket for a 10 mm OD limiter, cut to the 10 mm shelf
ctrl_slot     = 1.0;   // +/- outboard elongation. Was 1.5; trimmed now the across
                       // position is measured rather than derived, but not to zero:
                       // it still comes from the taped lug spans and the toe.

/* [CONTROLLER HOLE PATTERN — owner sketch 2026-09-07]
   ⚠ THE SKETCH LABELS THE OVERALL SIZES "12mm x 18mm". Read as CENTIMETRES:
   120 x 180 mm, which matches the ND72450 flat-plate spec. It cannot be
   millimetres — a 7 mm inset does not fit inside a 12 mm width, and no 12 x 18
   mm plate carries a 2.15 kg controller. The two small figures ARE millimetres:
   holes sit 7 mm in from the long edges and 6 mm in from the short ends.
      across the plate (120 wide):  7 .. 113  ->  106 mm apart
      along the plate (180 long):   6 .. 174  ->  168 mm apart

   ⚠ ORIENTATION, CORRECTED 2026-09-08 (owner). The controller does NOT bolt to a
   rail along its long edges. Its LONG axis runs ACROSS the bike, spanning between
   the two rails, so the pair of holes landing on any one bracket is the 106 mm
   pair, not the 168 mm pair. Everything below reads dx as ALONG the bike and dy
   as ACROSS it, so the fix is simply which number goes where.

   This is not a detail. With 168 across, the hole row lands 36-46 mm outboard of
   the lug face, clear of the bracket's own 16 mm of standoff and wall. With 106
   across it landed 5-15 mm out, inside the bracket, which is why nothing would go
   together. It also pulls the rear bolt back in FRONT of the rear lug, so the
   bracket no longer needs a tail hanging off its end.
   ✅ CORROBORATED 2026-09-08, no longer just a sketch reading. The 168 figure is
   now checked against two independent measurements: the front lug span taped at
   105 predicts a front reach of (168 - 105)/2 = 31.50, and the rig read 32-33 there.
   Nothing but a value near 168 lands in that window — 160 would be 4.5 mm out and
   176 would be 3.5 mm out, against a rig that resolves to about 2 mm. The 106
   figure is corroborated by fit: the carrier's slots are cut 106 apart and the
   controller located in them. The pattern is settled. */
ctrl_hole_dx  = 106;   // ALONG the bike  (the plate's 120 mm width runs fore/aft)
ctrl_hole_dy  = 168;   // ACROSS the bike (the plate's 180 mm length spans the rails)

/* [RAIL GEOMETRY — the gating measurements, owner photos 2026-09-07]
   ⚠ THE FOUR LUGS ARE NOT A RECTANGLE. The front pair sits WIDER apart than the
   rear pair, so each rail toes inward going back. Two consequences:
     · each bracket's vertical panel sits at a slight angle to the bike's
       centreline, not parallel to it
     · the controller's hole rows ARE parallel to the centreline, so each
       shelf has to reach FURTHER at its front hole than at its rear one.
       The shelf is therefore a trapezoid, not a rectangle.
   ⬜ MEASURE, across the bike, face to face:  */
/* ✅ SETTLED. Superseded by tape measurements of both lug spans — see below. The
   original rig reading is kept here because it is what cross-checks the controller's
   across hole spacing.

   FROM THE RIG, 2026-09-08. The across scale read midway between 30 and 35,
   so 32.5 mm from the lug face out to the controller's hole centre. The hole rows
   are 168 mm apart, so the lug faces are 168 - 2 x 32.5 = 103 mm apart.
   ⬜ ONE number was reported, so front and rear are set equal here and the toe is
   currently zero. The photos showed the front pair WIDER than the rear, so the
   split still needs confirming — read the across scale at the FRONT hole and at
   the REAR hole separately. Until then the shelf is a rectangle, not a trapezoid. */
/* ✅ FRONT CONFIRMED, ⬜ REAR STILL OPEN (owner 2026-09-08).
   The FRONT hole reads 32-33 on both sides, so lug_span_front = 168 - 2 x 32.5 = 103.
   The owner also confirms the rails NARROW going rearward, which pins the sign of
   everything else: lug_span_rear < 103, and therefore reach_rear > 32.5.

   ⚠ THE REAR IS SET EQUAL TO THE FRONT HERE AND THAT IS THE UNSAFE DIRECTION.
   The real rear reach is LARGER, so the real rear bolt sits FURTHER OUTBOARD than
   this model puts it. Build to these numbers and the shelf runs out before the bolt.
   Do not print until the rear is measured. */
/* ✅ BOTH MEASURED WITH A TAPE, lug face to lug face, 2026-09-08. The rails narrow
   going rearward, so the REAR is the deeper end: reach 31.50 at the front, 37.24 at
   the rear. The rig had read 32-33 at the front, which agrees inside the +/-2 mm its
   5 mm tick spacing can resolve — tape and rig cross-check cleanly. */
lug_span_front = 105;
lug_span_rear  = 93.52;

/* [SHOCK CLEARANCE]
   The controller has to shift REARWARD to clear the rear shock. This is how far
   its centre sits behind the midpoint of the two lugs on one side.
   ⬜ MEASURE or choose from a dry fit. */
/* ⚠ STILL OPEN. Also PROVISIONAL for the same reason as the lug span above: the
   controller is not yet bolted up, so its fore/aft position is not yet fixed. The fore/aft
   reading came back as "-10 on one and 10 on the other", which is the two mirrored
   rows of the same scale giving the same position opposite signs. Magnitude is 10.
   MAGNITUDE IS SETTLED: 9.5 mm from the lug midpoint. The scale reading of -10 is
   taken against the carrier's near EDGE, which sits 26 mm ahead of the controller's
   own centre line in carrier coordinates, so edge at spine 34 puts the controller
   centre at 103 against a midpoint of 93.5.
   ✅ DIRECTION CONFIRMED 2026-09-08: the lug the reading was taken from is the
   FRONT one, so the controller sits 9.5 mm REARWARD of the lug midpoint. Note how
   much smaller that is than the 25 mm placeholder this replaced — the shock needs
   far less clearance than was assumed, and both controller bolts now land well
   inside the lug span instead of hanging off the back. */
ctrl_shift_rear = 9.5;

// Reach from the rail face OUT to the controller's hole row, at each end.
// Rail face sits lug_span/2 from the centreline; the hole row sits
// ctrl_hole_dy/2 = 53 mm from it. Positive = hole row is OUTBOARD of the rail.
reach_front   = ctrl_hole_dy/2 - lug_span_front/2;
reach_rear    = ctrl_hole_dy/2 - lug_span_rear/2;

// Controller hole positions along the rail, shifted back off the shock
ctrl_x_front  = lug_spacing/2 + ctrl_shift_rear - ctrl_hole_dx/2;
ctrl_x_rear   = lug_spacing/2 + ctrl_shift_rear + ctrl_hole_dx/2;

// ...and the reach at each of those two X positions, by linear interpolation
function reach_at(x) = reach_front + (reach_rear - reach_front) * (x / lug_spacing);
/* ⚠ MINUS lug_standoff. reach is measured from the LUG FACE, but the lug face is
   no longer at y = 0 — the pads moved it to y = -lug_standoff when they were added,
   and this was still being used as a raw bracket coordinate. The controller bolts
   were sitting 6 mm too far outboard as a result. */
ctrl_y_front  = reach_at(ctrl_x_front) - mount_off;
ctrl_y_rear   = reach_at(ctrl_x_rear)  - mount_off;

/* [DROP — measured 2026-09-07]
   Lug centre straight down to the TOP of the controller's alloy plate, with the
   plate sat flush against the underside of the frame: 35 mm. So the shelf's
   UNDERSIDE has to land on that same plane, and the plate clamps up against it.

   ⚠ THIS KILLS THE STANDOFF. Sitting the plate flush to the frame is
   incompatible with holding it 8 mm below on bosses — you cannot have both. The
   owner's position wins, so standoff is now 0 and the plate contacts the shelf
   directly. Cooling is not badly hurt: the frame is only two narrow tubes, so
   the great majority of the plate is still open air on all sides, and the
   louvres in the shelf still vent what little sits under it. */
/* ✅ FROM THE RIG, 2026-09-08: 35 mm, lug centre line down to the controller's top
   face. Confirmed by the owner after the photo showed the joint bolt sitting at the
   very bottom end of its slot.
   ⚠ Note what that means: 35 is the PHYSICAL MINIMUM, the plate hard up under the
   frame. The controller is as high as it can possibly go and there is no adjustment
   left in that direction. Every millimetre of tyre clearance has to be found
   somewhere other than raising it. */
drop          = 35;

/* [CONTROLLER] */
/* ⚠ SWAPPED 2026-09-08 with the hole pattern. len is ALONG the bike, wid ACROSS.
   The layout view was still drawing the controller the old way round. */
ctrl_len      = 120;   // along the bike
ctrl_wid      = 180;   // across the bike, spanning both rails
ctrl_hgt      = 55;
rail_d        = 40;    // indicative rail tube diameter, for the layout view only
ties          = true;  // draw the proposed cross members in the layout

/* [PRINTED SECTION] thick, because plastic */
pt            = 10;    // panel thickness. Was 4 mm in aluminium.
up_margin     = 20;
/* Material kept beyond each lug hole. 22 was inherited from when the controller
   bolts still hung off the ends; they now sit at x = 50 and 156, well inside the
   lugs at 0 and 187, so nothing but the lug bolt itself sets this. 14 leaves ~10 mm
   of wall outside the 8.2 limiter pocket, which is a full panel thickness. */
end_margin    = 14;
corner_r      = 12;
fillet_r      = 10;    // inside fillet at the corner

/* [RIBS] this is where a printed part beats bent sheet */
gusset_n      = 9;
gusset_t      = 6;
gusset_run    = 68;    // how far the rib reaches along the shelf
gusset_rise   = 46;    // how far it climbs the vertical panel

/* [METAL COMPRESSION LIMITERS] — mandatory, see header */
limiter_od    = 8.2;   // pocket bore. ⚠ Cut the tube to pt + lug_standoff = 16 mm,
                       // NOT the panel thickness — it now has to span the pad too,
                       // or the pad is left as bare plastic in the squeeze path.

/* [ASSEMBLY INSURANCE] The 2nd frame hole is elongated along the rail so a
   few tenths of residual spacing error cannot stop it going together. The
   limiter and washer still clamp normally.

   ⚠ THE ORIGINAL JUSTIFICATION NO LONGER HOLDS. It said the moment is carried by
   the back face bearing on the rail rather than by these holes resisting rotation.
   There IS no flat back-face bearing — the lug is recessed in a rounded tube and
   the bracket stands on two pads (issue #9). So with one hole slotted, rotation is
   resisted only by bolt clamp friction and the two pads. That is the weakest link
   in the whole design, and this slot makes it slightly weaker.
   ✅ RESOLVED 2026-09-09, SET TO 0 — BOTH HOLES ROUND. The owner points out the
   shim already proved the spacing: it has TWO ROUND 5.5 mm holes at 187 and it went
   on. That is 0.5 mm of total clearance, so the true spacing is pinned to about a
   quarter of a millimetre. There is nothing left for a slot to absorb, and the
   limiter stack adds ~0.8 mm of float of its own besides.
   Removing it also puts back the rotational constraint the slot gave away, which
   matters precisely because there is no flat back-face bearing to carry it. */
frame_slot    = 0;     // both holes round; the shim proved 187

/* [STANDOFFS — the airflow decision]
   The owner's arrows show air moving FORE-AND-AFT along the bike, sweeping the
   FarDriver's alloy plate lengthwise. That matters more than which holes are in
   the shelf: a shelf lying flat on the plate would seal that path shut and trap
   a stagnant layer against the hottest surface, holes or no holes.
   So the shelf does NOT touch the plate. It stands off on four bosses, one per
   controller bolt, leaving an open channel the full length of the plate for air
   to run through. The bolts clamp through the bosses, so the load path is
   unchanged and the joint is still metal-to-metal via the limiters.
   The vent holes above then let the warmed air rise out instead of pooling.
   Keep any material that crosses the channel narrow — it is a fin in the flow,
   not a dam. */
/* [CONTROLLER STANDOFF] Owner offered "a very small standoff if it will help",
   and the answer is that it does not help enough to pay for it.
   ⚠ IT COSTS TYRE CLEARANCE ONE FOR ONE. The drop of 35 was measured with the
   assembly pressed hard against the frame, so the shelf cannot rise. Anything put
   between the shelf and the controller pushes the CONTROLLER down by that amount,
   straight out of the clearance budget, and the owner says there is not much.
   ⚠ AND IT BUYS LITTLE. The shelf only covers the plate from 16 mm to 38.5 mm out
   from the lug face, which is 22.5 mm per side out of a 180 mm plate. 75% of the
   alloy is already open air, and the covered quarter is the OUTER edge, furthest
   from the hot middle.
   So: standoff stays 0, and the covered quarter is made to breathe by grooving the
   shelf's UNDERSIDE instead — see breathe_*. That costs zero clearance because the
   controller still sits on the original plane, on the ribs between the grooves. */
standoff      = 0;
standoff_d    = 32;    // boss diameter at each controller bolt

/* [SHELF VENTING]
   The shelf's underside is what touches the FarDriver's alloy baseplate, so
   opening it up lets air reach that plate instead of trapping heat against a
   sheet of plastic. Structurally this is cheap IF three things are respected,
   and the model enforces all three:
     · a solid RIM is left all the way round the shelf edge
     · a solid BOSS is left around every controller bolt, so each bolt still
       pulls against real material
     · the holes sit between the load paths, not across them
   A perforated plate with an intact rim and bosses is close to as stiff as the
   solid one in the direction that matters, and the extra ribs more than pay
   back what the holes cost. */
vent_style    = "louvre";  // "louvre" | "round"
vent_rim      = 9;     // solid margin kept round the shelf edge. Was 13, which
                       // left no ventable band once the shelf stopped overhanging.
/* Solid radius kept around each controller bolt. 15 swallowed the two vents either
   side of every bolt whole, because the shelf is only 31.5 deep. The bolt runs in a
   10.2 limiter, so 10 still leaves a 5 mm collar of solid shelf around the tube. */
vent_boss_r   = 10;

/* [SHELF BREATHING] Fore-and-aft grooves in the shelf's UNDERSIDE, running the way
   the owner says air moves along the plate. The controller still bears on the ribs
   between them, at the same height as before, so nothing moves down. They also
   feed the louvre vents, giving the air somewhere to leave.
   Depth is kept to 2.5 of the 10 mm shelf: the ribbed section still keeps about
   three quarters of the solid plate's bending stiffness, and the nine gussets carry
   most of the load anyway. */
/* ⚠ PARKED AT 0. The groove geometry is written and works as a concept, but it
   makes the solid non-manifold where it meets the other subtractions in the shelf,
   and it is likely to be superseded by the scoop idea anyway. Set it to 2.5 to
   re-enable, but fix the manifold first — do not export an STL with it on. */
breathe_d     = 0;     // groove depth into the underside
breathe_w     = 7;     // groove width
breathe_pitch = 13;    // leaves a 6 mm rib between grooves

/* [LOUVRES rather than plain holes]
   Round holes are just pressure relief — they do nothing directional. Angled
   louvres are better here on three separate counts, at the same cost to print:
     · DIRECTIONAL. Cut on a slant leaning rearward, each opening presents a
       forward-facing lip to the oncoming air and a low-pressure shadow behind
       it, so it extracts warm air out of the channel instead of just letting it
       sit. Set vent_angle negative to reverse and scoop inward instead.
     · STIFFER. A louvred panel keeps continuous material between the cuts and
       corrugates the section. It is stiffer across the louvres than a plain
       perforated plate of the same open area.
     · CLEANER. A slanted opening throws off road spray and grit far better than
       a straight-through hole pointing at the sky.
   The slots run ACROSS the bike (elongated in Y) on purpose: that is
   perpendicular to the fore-aft airflow, which is the correct louvre
   orientation, AND it leaves the Y-running spars that carry load from the
   controller bolts back to the vertical panel completely intact. */
/* ⚠ A SLANTED SLOT IS WIDER THAN IT LOOKS. Its footprint along the bike is
   louvre_w/cos(a) + pt*tan(a), so at 9 mm and 38 degrees it ate 19.2 mm of a 17.9 mm
   bay. 6 mm at 30 degrees comes to 12.7 and leaves 2.6 mm of shelf either side. */
vent_angle    = 30;    // slant through the shelf, degrees. Negative = scoop in.
louvre_w      = 6;     // slot width, along the bike
louvre_pitch  = 21;    // spacing along the bike
vent_d        = 19;    // round-hole diameter, only used when vent_style="round"
vent_pitch    = 27;    // round-hole grid pitch

/* [STYLING] engraved, not cut through — plastic needs its section.
   ⚠ Cut into the OUTBOARD face only. Engraving the frame-facing side would both
   hide the detail and eat into the bearing area that carries the cantilever
   moment against the rail. (Was wrong until 2026-09-07.) */
engrave       = true;
engrave_d     = 2;
win_w         = 16;    // fits the 20.5 mm clear bay between two ribs
win_h         = 24;    // window height; panel is 55 tall, so 14 mm of top rail
win_z         = -6;    // window centre, mid-height between shelf top and panel top

/* [PRINTED JIG] */
gauge_thk     = 3;
clearance     = 0.4;

/* [OUTPUT] */
part = "bracket";   // gauge | bracket | layout

$fn = 48;
eps = 0.01;


// The rearward shift for shock clearance pushes the rear controller bolt PAST
// the rear lug. Grow the blank at that end so its standoff boss still lands on
// material — otherwise the rearmost bolt hangs off the end of the bracket.
tail    = max(end_margin, ctrl_x_rear + standoff_d/2 + 8 - lug_spacing);
nose    = max(end_margin, standoff_d/2 + 8 - ctrl_x_front);
blank_x = lug_spacing + nose + tail;
x0      = -nose;
/* ⚠ THIS IS WHY THE SHELF STUCK OUT SO FAR. Two faults compounded:
   1. shelf_margin was tied to vent_boss_r, a VENT PATTERN number, so a decision
      about where louvres may sit was silently setting how far the bracket
      overhangs the controller. It is a structural dimension and now says so.
   2. reach_at is measured from the LUG FACE, but shelf_y is a PROFILE coordinate
      whose origin sits at bracket y = pt. Neither the pad offset nor the panel
      thickness was subtracted, so the shelf came out 16 mm deeper than the margin
      asked for, on top of an already generous 25.
   Net effect: 29 mm of shelf hanging past the edge of the controller. Now 15 mm
   of material past the bolt centre, which is what an M6 through a 10.2 limiter
   actually needs. */
/* RIB POSITIONS, defined once, and deliberately keyed to the CONTROLLER BOLTS.
   Spacing them evenly along the blank was arbitrary: it put ribs over vent slots,
   and it left the two places where load actually enters the shelf — the bolts —
   supported by whatever happened to be nearby.
   ⚠ RIBS STRADDLE THE BOLTS, THEY DO NOT SIT ON THEM. I first pitched them so a
   rib landed exactly on each bolt, reasoning that the load then goes straight up a
   rib into the panel. It does — but the nut goes on TOP of the shelf, and a rib
   standing on the hole means you cannot get a nut or a socket to it. A mount you
   cannot assemble is not a mount. Owner caught it.
   The pitch is still a quarter of the bolt spacing, but offset by half a pitch, so
   each bolt sits in the CENTRE of a bay with a rib 13.25 mm either side. That
   leaves 20.5 mm of clear width at every bolt, enough for a 10 mm socket, and the
   load still enters between two ribs a short distance from both. */
rib_pitch = ctrl_hole_dx/4;                 // 26.5 mm
rib_m0 = ceil ((x0 + 8 - ctrl_x_front)/rib_pitch - 0.5);
rib_m1 = floor((x0 + blank_x - 8 - ctrl_x_front)/rib_pitch - 0.5);
rib_n  = rib_m1 - rib_m0 + 1;
function rib_x(i) = ctrl_x_front + (rib_m0 + i + 0.5)*rib_pitch;
function bay_x(i) = (rib_x(i) + rib_x(i + 1))/2;

shelf_margin = 15;                 // material kept beyond the BOLT CENTRE
shelf_y0 = reach_at(x0) - mount_off - pt + shelf_margin;
shelf_y1 = reach_at(x0 + blank_x) - mount_off - pt + shelf_margin;
reach    = max(shelf_y0, shelf_y1);

echo(str("Rear bolt sits ", ctrl_x_rear - lug_spacing,
         " mm BEHIND the rear lug; bracket tail extended to ", tail, " mm."));
vert_h  = up_margin + drop;

echo(str("Printed bracket ", blank_x, " x ", reach + pt, " x ", vert_h + standoff,
         " mm, wall ", pt, " mm, ", rib_n, " ribs, ", standoff,
         " mm standoff. Limiter bore ", limiter_od, " mm."));

module round2d(r) { offset(r = r) offset(r = -r) children(); }

/* ---- vertical panel, in (X,Z), bolt line at Z = 0 ----
   ⚠ ROUND THE FREE EDGES ONLY, NEVER THE JOINT. The bottom edge is where this
   panel meets the shelf. Rounding it there pulled the panel in at each end, the
   shelf pulled in by a DIFFERENT amount, and the full-length inside fillet then
   stood proud of both — a wedge hanging in mid air at the nose.
   Fix: extend the profile past the joint ALONG THE SIDE SLANT, so no new corner
   is created on the joint line itself, round it down there where it is thrown
   away, then trim back to the joint. The extension has to be longer than the
   rounding's tangent length (about 16 mm at r = 12 on this angle) or the arc
   still reaches up through the trim. */
module vert_profile() {
    /* ⚠ THE SIDES RUN VERTICAL THROUGH THE LUG LINE. The panel used to taper all the
       way from its bottom corner, and once the blank was shortened from 231 to 215
       that slope cut into the lug bolt's limiter bore: at the lug height the edge sat
       at x = -3.82 while the 10.2 bore reaches -5.10, so the hole broke out of the
       panel edge and left only the standoff pad around it. Owner spotted it.
       The taper now starts 12 mm ABOVE the lug line, so the panel is full width
       exactly where the bolt is and 8.9 mm of wall surrounds the bore. */
    knee  = 12;                     // taper begins this far above the lug line
    inset = 8;                      // how far the top edge pulls in each side
    intersection() {
        round2d(corner_r) polygon(points = [
            [x0,                    -drop - 30],
            [x0,                     knee],
            [x0 + inset,             up_margin],
            [x0 + blank_x - inset,   up_margin],
            [x0 + blank_x,           knee],
            [x0 + blank_x,          -drop - 30]
        ]);
        translate([x0 - 1, -drop]) square([blank_x + 2, drop + up_margin + 1]);
    }
}

// The outboard edge follows the rail's toe, so the shelf stops just past its own
// hole row at each end instead of sticking out past the controller at the front.
module shelf_profile() {
    // Same rule: the inboard edge is the joint with the panel, so it is extended
    // straight back, rounded out of sight, and trimmed square at y = 0.
    ext = 20;                       // must exceed corner_r on a square corner
    intersection() {
        round2d(corner_r) polygon(points = [
            [x0,           -ext],
            [x0 + blank_x, -ext],
            [x0 + blank_x, shelf_y1],
            [x0,           shelf_y0]
        ]);
        translate([x0 - 1, 0]) square([blank_x + 2, max(shelf_y0, shelf_y1) + 1]);
    }
}

// ---- one triangular rib in the inside corner ----
module gusset(x) {
    // ⚠ CLIPPED TO THE SHELF. gusset_run is a cap, not the answer. It was 68 while
    // the shelf became 31.5 deep, so the ribs hung 27 mm out past the shelf into
    // thin air — the same class of mistake as the shelf overhang itself.
    run = min(gusset_run, reach - 4);
    /* ⚠ SUNK INTO THE PANEL, NOT STOOD ON ITS FACE (owner, 2026-09-10, on the mounted
       rev E part). The rib used to start exactly at the panel face, and round2d rounded
       all three corners of its triangle, including the tip that sits ON the panel. At a
       34 degree tip an r = 4 round eats 13 mm back along each edge, so the top of every
       rib curled away from the panel and left a crevice: joined only 23 mm up the panel
       instead of 36, with a notch at the top to start a crack and an overhang to print.
       Same rule as the panel and shelf, ROUND THE FREE EDGES ONLY, NEVER THE JOINT,
       which the ribs had escaped.
       Fix: carry the hypotenuse on the same line into the panel by rib_sink, so the tip
       and its rounding sit inside solid panel. A round of radius r reaches at most 2r
       out from the tip, so a sink of 8 buries r = 4 at any rib angle. The exposed rib
       is the same triangle as before; it now meets the panel over its full height. */
    rib_sink = 8;    // into the 10 mm panel, stopping 2 mm short of the frame-side face
    translate([x - gusset_t/2, pt, -drop])
        rotate([90, 0, 90])
            linear_extrude(gusset_t)
                round2d(4) polygon(points = [
                    [-rib_sink, 0], [run, 0],
                    [-rib_sink, gusset_rise*(1 + rib_sink/run)]
                ]);
}

module bolt_pockets(depth) {
    for (i = [0, 1]) {
        x  = i == 0 ? 0 : lug_spacing;
        sl = i == 0 ? 0 : frame_slot;
        // through hole for the M5, elongated on the second hole. Starts behind
        // the standoff pad, not at the panel face.
        hull() for (s = [-sl, sl])
            translate([x + s, -lug_standoff - 1, 0]) rotate([-90, 0, 0])
                cylinder(d = bolt_dia + 0.6, h = depth + lug_standoff + 2);
        // pocket for the metal compression limiter — full depth of pad + panel,
        // so the tube bears directly on the lug face and the plastic never does
        hull() for (s = [-sl, sl])
            translate([x + s, -lug_standoff - eps, 0]) rotate([-90, 0, 0])
                cylinder(d = limiter_od, h = depth + lug_standoff + eps);
    }
}

module ctrl_pockets() {
    // ONE row only: the two holes on this bracket's side of the bike.
    // The other two belong to the mirrored bracket on the far rail.
    for (h = [[ctrl_x_front, ctrl_y_front], [ctrl_x_rear, ctrl_y_rear]])
        translate([h[0], h[1], -drop - standoff - 1]) {
            // slotted slightly outboard so a mm or two of pattern error cannot
            // stop assembly; the controller's own 7 mm holes add play as well
            hull() for (s = [-ctrl_slot, ctrl_slot])
                translate([0, s, 0])
                    cylinder(d = ctrl_bolt_dia + 0.6, h = pt + standoff + 2);
            hull() for (s = [-ctrl_slot, ctrl_slot])
                translate([0, s, 0])
                    cylinder(d = ctrl_limiter, h = pt + standoff + 1);
        }
}

module shelf_vents() {
    difference() {
        intersection() {
            if (vent_style == "louvre") {
                /* ⚠ ONE LOUVRE PER BAY, CENTRED BETWEEN TWO RIBS. The louvres used
                   to run on their own independent pitch, so ribs landed on top of
                   them and stood over open holes — the owner spotted it in the
                   renders. Deriving the vents from rib_x makes that impossible by
                   construction rather than by choosing numbers that happen to miss.
                   The two end bays are half width and get no vent. */
                // A vent in every bay EXCEPT the two the bolts occupy — those
                // bays have to stay clear for a socket.
                for (i = [0 : rib_n - 2])
                    let (bx = bay_x(i))
                        if (abs(bx - ctrl_x_front) > 2 && abs(bx - ctrl_x_rear) > 2)
                            translate([bx, pt + reach/2, -drop + pt/2])
                                rotate([0, vent_angle, 0])
                                    cube([louvre_w, reach + 40, pt*4], center = true);
            } else {
                for (j = [0 : ceil(reach/(vent_pitch*0.866)) + 1])
                    for (i = [-2 : ceil(blank_x/vent_pitch) + 2])
                        translate([x0 + i*vent_pitch + (j % 2)*vent_pitch/2,
                                   pt + j*vent_pitch*0.866, -drop - 1])
                            cylinder(d = vent_d, h = pt + 2);
            }
            // ...clipped to the shelf minus its solid rim
            translate([0, pt, -drop - 1]) linear_extrude(pt + 2)
                offset(-vent_rim) shelf_profile();
        }
        // ...and never through the bosses the controller bolts pull on
        for (h = [[ctrl_x_front, ctrl_y_front], [ctrl_x_rear, ctrl_y_rear]])
            translate([h[0], h[1], -drop - 2])
                cylinder(r = vent_boss_r, h = pt + 4);
    }
}

// shallow fore-and-aft channels in the shelf underside, kept clear of the bolts
module shelf_breathe() {
    if (breathe_d > 0)
        difference() {
            // ⚠ starts at -drop-2, NOT -drop-1. The controller bolt pockets already
            // start at -drop-standoff-1, and two subtracted solids sharing a face
            // plane is what made this non-manifold.
            for (y = [pt + 5 : breathe_pitch : pt + reach - 3])
                translate([x0 - 1, y - breathe_w/2, -drop - 2])
                    cube([blank_x + 2, breathe_w, breathe_d + 2]);
            // ⚠ taller than the groove on BOTH ends. Making its top face coplanar
            // with the groove's top face is what broke the manifold first time.
            for (h = [[ctrl_x_front, ctrl_y_front], [ctrl_x_rear, ctrl_y_rear]])
                translate([h[0], h[1], -drop - 3])
                    cylinder(r = 12, h = breathe_d + 8);
        }
}

module bracket() {
    difference() {
        union() {
            // vertical panel
            translate([0, pt, 0]) rotate([90, 0, 0]) linear_extrude(pt) vert_profile();
            // frame-side standoff pads — the ONLY places this touches the frame
            for (x = [0, lug_spacing])
                translate([x, 0, 0]) rotate([90, 0, 0])
                    cylinder(d = lug_pad_d, h = lug_standoff, $fn = 48);
            // shelf
            translate([0, pt, -drop]) linear_extrude(pt) shelf_profile();
            // inside fillet along the whole corner
            translate([x0, pt, -drop + pt]) rotate([0, 90, 0])
                difference() {
                    translate([-fillet_r, 0, 0]) cube([fillet_r, fillet_r, blank_x]);
                    translate([-fillet_r, fillet_r, -1]) cylinder(r = fillet_r, h = blank_x + 2);
                }
            // ribs
            for (i = [0 : rib_n - 1]) gusset(rib_x(i));
            // standoff bosses: the ONLY places the bracket touches the controller
            if (standoff > 0)
                for (h = [[ctrl_x_front, ctrl_y_front], [ctrl_x_rear, ctrl_y_rear]])
                    translate([h[0], h[1], -drop - standoff])
                        cylinder(d = standoff_d, h = standoff + eps);
        }
        bolt_pockets(pt);
        ctrl_pockets();
        shelf_vents();
        shelf_breathe();
        /* ⚠ THROUGH-WINDOWS, no longer just engraving. The panel was a solid
           10 mm slab and 63% of the part's whole volume, most of it doing nothing.
           Treat the panel as a beam supported at the two lug bolts and loaded along
           its bottom edge by the shelf: bending stress is lowest at mid-height and
           shear is lowest at mid-span, so a row of windows at mid-height in the
           middle of the span removes material from the one region that carries
           least. They stay 24 mm clear of the nearer bolt and keep a 14 mm top
           rail. Same R1 side-panel motif, now earning its place. */
        if (engrave) {
            // ONE GRID FOR EVERYTHING. The windows sit in the same bays as the
            // shelf vents, so ribs, vents and windows all land on the 26.5 mm
            // pitch and no window has a rib behind it. The outermost bay at each
            // end is skipped, which keeps every window clear of the lug bolts.
            for (i = [0 : rib_n - 2])
                translate([bay_x(i), pt + 1, win_z])
                    rotate([90, 0, 0])
                        linear_extrude(pt + lug_standoff + 2)
                            round2d(5) square([win_w, win_h], center = true);
        }
    }
}

// ------------------------------------------------------------
// SELF-MEASURING FIT GAUGE
//
// The first gauge was pass/fail: if it did not fit you could not see by how
// much. This one reads the answer off directly.
//
//   · DATUM end (x = 0): a plain round hole in an open ring. Bolt this one.
//     The ring is cut away so you can see the lug pad and confirm it is seated.
//   · MEASURING end: a slot running along the rail with 1 mm graduations either
//     side of nominal, numbered every 5 mm. Drop a second M5 through the slot
//     into the lug and read where the shank sits. That number IS the true
//     centre-to-centre spacing. No calipers, no subtraction.
//   · The spine is windowed so you can see the frame the whole way along.
//
// USE: bolt the datum, offer the slotted end to the second lug, nip the second
// bolt just enough to hold, read the graduation the bolt centres on. If it
// reads 187, set lug_spacing = 187 and the model is correct as-is.
// ------------------------------------------------------------
g_thk      = 4;     // gauge thickness
g_w        = 44;    // spine width
g_range    = 9;     // +/- graduation range at the measuring end
g_tick_d   = 0.7;   // engraving depth
g_ring_od  = 21;    // outer dia of the datum ring

module gauge_ticks() {
    slot_edge = (bolt_dia + 0.6)/2;
    // graduations ABOVE the slot.
    // ⚠ LESSON FROM THE 2026-09-07 PRINT: 0.7 mm ticks at 1 mm pitch left only
    // 0.3 mm of wall between them, which is finer than a 0.4 mm nozzle can lay
    // down — they merged into one solid trough and the scale was unreadable.
    // Now 2 mm pitch with 1 mm ticks, so there is a full 1 mm wall between each.
    // Resolution is 2 mm read directly, better than that by interpolation, and
    // the +/-5 labels plus the arrow carry the rest.
    for (i = [-g_range : 2 : g_range]) {
        maj = (i % 10 == 0);
        translate([lug_spacing + i - 0.5, slot_edge + 1.2, g_thk - g_tick_d])
            cube([1.0, maj ? 5.5 : 3.0, g_tick_d + eps]);
    }
    // nominal arrow, then the nominal value ABOVE it (keeps it clear of the +/- labels)
    translate([lug_spacing, slot_edge + 8.0, g_thk - g_tick_d])
        linear_extrude(g_tick_d + eps)
            polygon([[-2.4, 2.0], [2.4, 2.0], [0, -1.4]]);
    translate([lug_spacing, slot_edge + 14.0, g_thk - g_tick_d])
        linear_extrude(g_tick_d + eps)
            text(str(lug_spacing), size = 6, halign = "center", valign = "center", $fn = 24);
    // offset labels BELOW the slot, so nothing overlaps
    for (i = [-5, 5])
        translate([lug_spacing + i, -slot_edge - 5.5, g_thk - g_tick_d])
            linear_extrude(g_tick_d + eps)
                text(str(i > 0 ? "+" : "-", abs(i)), size = 4.2,
                     halign = "center", valign = "center", $fn = 24);
    // reminder of what the scale means, along the spine
    translate([lug_spacing - g_range - 8, g_w/2 - 5.5, g_thk - g_tick_d])
        linear_extrude(g_tick_d + eps)
            text("READ BOLT CENTRE", size = 5, halign = "right",
                 valign = "center", $fn = 24);
}

module fit_gauge() {
    slot_w = bolt_dia + 0.6;
    difference() {
        union() {
            // datum ring
            cylinder(d = g_ring_od, h = g_thk);
            // spine
            translate([-6, -g_w/2, 0]) cube([lug_spacing + g_range + 19, g_w, g_thk]);
        }
        // datum hole
        translate([0, 0, -1]) cylinder(d = bolt_dia + clearance, h = g_thk + 2);
        // measuring slot
        hull() for (s = [-g_range, g_range])
            translate([lug_spacing + s, 0, -1]) cylinder(d = slot_w, h = g_thk + 2);
        // sight windows down the spine, so the frame stays visible
        for (i = [1 : 4])
            translate([g_ring_od/2 + 6 + (i - 1)*((lug_spacing - g_range - g_ring_od/2 - 16)/4),
                       0, -1])
                hull() {
                    translate([0, -(g_w/2 - 14)]) cylinder(d = 7, h = g_thk + 2);
                    translate([0,  (g_w/2 - 14)]) cylinder(d = 7, h = g_thk + 2);
                }
        gauge_ticks();
        // asymmetric corner nick so it cannot be used back to front
        translate([-g_ring_od/2 - 1, g_w/2 - 5, -1]) cube([9, 9, g_thk + 2]);
    }
}

// ------------------------------------------------------------
// FRAME-SIDE TEST PANEL
//
// The vertical panel on its own, at full thickness, with the real bolt holes
// and limiter pockets. Printable and boltable RIGHT NOW — it does not depend on
// the FarDriver's hole pattern, which is the one thing still unknown.
//
// It is worth printing before the big bracket because it proves four things
// that a gauge cannot:
//   · the spacing works at the real 10 mm thickness, not 4 mm
//   · the back face genuinely bears flat on the rail once material is that deep
//   · the limiter pockets are the right bore for the tube you actually have
//   · your material, wall count and orientation give a part that feels right
// Print it exactly as you will print the bracket: FLAT ON THE BED, same
// material, same perimeters and infill. That makes it a real rehearsal.
// ------------------------------------------------------------
module test_panel() {
    difference() {
        union() {
            translate([0, pt, 0]) rotate([90, 0, 0]) linear_extrude(pt) vert_profile();
            for (x = [0, lug_spacing])
                translate([x, 0, 0]) rotate([90, 0, 0])
                    cylinder(d = lug_pad_d, h = lug_standoff, $fn = 48);
        }
        bolt_pockets(pt);
        if (engrave) {
            // ONE GRID FOR EVERYTHING. The windows sit in the same bays as the
            // shelf vents, so ribs, vents and windows all land on the 26.5 mm
            // pitch and no window has a rib behind it. The outermost bay at each
            // end is skipped, which keeps every window clear of the lug bolts.
            for (i = [1 : rib_n - 3])
                translate([(rib_x(i) + rib_x(i + 1))/2, pt + 1, win_z])
                    rotate([90, 0, 0])
                        linear_extrude(pt + lug_standoff + 2)
                            round2d(5) square([win_w, win_h], center = true);
        }
    }
}

// ============================================================
// MEASURING RIG
//
// The problem: the controller does not sit under the lugs, and how far back it
// sits changes the across-the-bike numbers too. So measuring by hand needs three
// things held true at once. This reads them off instead.
//
// WHAT IT IS: the bracket's vertical panel, unchanged, so it bolts to the same
// two lugs with the same two M5. Hanging off it at the measured 35 mm drop is a
// flat plate perforated with a GRID of 6.5 mm holes on a 10 mm pitch, reaching
// BOTH inboard and outboard of the rail — because we do not yet know which side
// the controller's holes fall on, and this settles that too.
//
// HOW TO USE IT:
//   1. Bolt the rig to the two lugs on one side. Do the same on the other side
//      if you print two, though one side is enough if the bike is symmetric.
//   2. Offer the controller up exactly where it needs to sit, plate flush to the
//      underside of the frame, pushed back far enough to clear the shock.
//   3. Look down through the grid. Push an M6 bolt through whichever grid hole
//      lines up with each of the controller's holes on that side.
//   4. Read the engraved numbers at the edges of the plate for that hole.
//      ALONG the bike is measured from the FRONT lug centre.
//      ACROSS the bike is measured from the LUG FACE, negative = inboard.
//   5. Send me those two pairs of numbers. That is the whole geometry.
//
// If a controller hole lands between grid holes, say so and estimate — the
// bracket holes are slotted and the controller's own 7 mm holes add play, so a
// couple of millimetres either way does not matter.
// ============================================================
rig_thk    = 5;
grid_pitch = 10;
grid_hole  = 6.5;
grid_in    = 55;   // how far the plate reaches INBOARD of the lug face
grid_out   = 55;   // ...and outboard
patch      = 34;   // half-length of each grid patch, along the bike

module rig_grid_2d() {
    difference() {
        union() {
            // patches run wider and deeper than the grid so the engraved
            // numbers land on material instead of thin air
            for (xa = [ctrl_x_front, ctrl_x_rear])
                translate([xa - patch - 26, -grid_in - 17])
                    square([2*patch + 40, grid_in + grid_out + 17]);
            translate([x0, -6]) square([blank_x, 18]);
        }
        for (xa = [ctrl_x_front, ctrl_x_rear])
            for (gx = [-patch : grid_pitch : patch])
                for (gy = [-grid_in + 5 : grid_pitch : grid_out - 5])
                    translate([round((xa + gx)/grid_pitch)*grid_pitch, gy])
                        circle(d = grid_hole, $fn = 16);
    }
}

module rig_labels_2d() {
    // ALONG the bike, measured from the front lug centre
    for (x = [0 : 20 : lug_spacing + 40])
        translate([x, -grid_in - 9])
            text(str(x), size = 5.5, halign = "center", valign = "center", $fn = 16);
    // ACROSS the bike, from the lug face; negative is inboard
    for (y = [-40 : 20 : grid_out])
        for (xa = [ctrl_x_front, ctrl_x_rear])
            translate([xa - patch - 17, y])
                text(str(y), size = 5.5, halign = "center", valign = "center", $fn = 16);
}

module rig() {
    difference() {
        union() {
            translate([0, pt, 0]) rotate([90, 0, 0]) linear_extrude(pt) vert_profile();
            translate([0, 0, -drop]) linear_extrude(rig_thk) rig_grid_2d();
        }
        bolt_pockets(pt);
        translate([0, 0, -drop + rig_thk - 0.8])
            linear_extrude(1.2) rig_labels_2d();
    }
}

// ============================================================
//  ADJUSTABLE MEASURING JIG  (rev F)
//
//  Assumes NOTHING except the two frame lug holes per side, M5 at 186 mm.
//  Everything else slides, you set the controller where you actually want it,
//  and then you read four scales.
//
//  ⚠ The spine does NOT sit flat on the frame. It stands on a 15 mm pad at each
//  lug, 6 mm proud, because the lug is recessed in a rounded tube. Print it pads
//  up; part="jig_spine_pair" is already oriented that way.
//
//  PARTS, print TWO of each (one pair per side of the bike):
//    part="jig_spine"    bolts to the two lugs. Hangs down. Two long VERTICAL
//                        slots, each with a DROP scale in mm below the lug centre.
//    part="jig_carrier"  an L. Its upright has two HORIZONTAL slots that cross the
//                        spine's vertical ones, so one bolt through each pair gives
//                        drop and fore/aft together, and two bolts stop it rotating.
//                        Its shelf carries two long ACROSS slots at the controller's
//                        168 mm hole spacing, each with its own scale.
//
//  DEGREES OF FREEDOM: drop (continuous), fore/aft (continuous), across
//  (continuous, independently per hole so the frame's taper is captured), and
//  the two sides are independent so left/right asymmetry shows up too.
//
//  HOW TO USE:
//    1. Bolt a spine to each side's two lugs. M5.
//    2. Hang a carrier on each spine with two M5 through the crossed slots.
//       Leave them finger tight so everything still slides.
//    3. Bolt the controller up to the two carriers through the across slots. M5
//       with washers is fine in its 7 mm holes.
//    4. Slide everything until the controller sits exactly where you want it —
//       height, fore/aft off the shock, and how far out each side.
//    5. Nip all six joints so nothing moves.
//    6. Read and send me, FOR EACH SIDE:
//         DROP        at the front joint and at the rear joint
//         FWD/AFT     at the front joint and at the rear joint
//         ACROSS      at the front hole and at the rear hole
//       Twelve numbers total. Every scale is engraved next to its own slot and
//       reads in millimetres. Drop is below the lug centre; across is TRUE mm
//       from the LUG FACE; fwd/aft is signed, positive rearward.
//
//  ⚠ TWO TRAPS IN THE FWD/AFT SCALE, both mine:
//    1. The two rows read EQUAL AND OPPOSITE at any point. Use the row whose
//       numbers grow toward the REAR of the bike. The R/L letters do NOT tell you
//       which — they are both the same way up.
//    2. THE BOLT IS HIDDEN. The carrier's upright covers the spine's scale, and
//       its near edge sits 18 mm short of its own bolt. So a number read at that
//       edge is 18 mm off. Until this is redesigned, get fwd/aft with a rule
//       instead: lug bolt centre to the carrier's near edge, then subtract 26.
//
//  Print flat, any material, 4 perimeters. It only has to hold a controller
//  still on a bench, not carry it down a road.
// ============================================================
/* Thickness. Both parts are bench jigs holding 2 kg still — they do not need to
   be structural. 4 and 5 mm are ample: an M5 bearing on a 4 mm slot wall sees a
   few MPa, and both plates bolt flat against something at two points, which also
   pulls out any print bow. Halved from the original 8 mm.

   ⚠ AND THE STACK IS ACCOUNTED FOR IN THE SCALES. Between the lug face and the
   carrier sit the 6 mm standoff pad and the 4 mm spine, so the carrier starts
   10 mm outboard before anything is adjusted. The ACROSS scale is labelled with
   the TRUE distance from the LUG FACE with all of that folded in, so there is
   nothing to add on. See across_datum. */
spine_thk   = 4;
carrier_thk = 5;
/* Distance from the LUG FACE out to the carrier's inner face, which is where the
   across scale is datumed. The spine no longer starts at the lug face — it stands
   off on its pads — so this is standoff + spine, not spine alone. Getting this
   wrong silently offsets every across reading. */
across_datum = lug_standoff + spine_thk;   // 6 + 4 = 10
jig_thk     = spine_thk;   // legacy alias used by the spine's own geometry
jig_bolt    = 5;        // M5 sliding joints, from the owner's kit
jig_slot    = 5.6;
/* The carrier's shelf hangs BELOW its mounting slot, so the controller ends up
   lower than the joint. That offset used to be 28 mm, which put the shallowest
   achievable drop at 43 mm — deeper than the 35 mm the controller actually wants.
   The joint has been moved down close to the shelf so the offset is now 12 mm,
   and the spine's scale is labelled with the REAL drop to the controller's top
   face rather than the slot position, so there is no arithmetic to do. */
carrier_off = 12;       // shelf underside below the carrier's mounting slot
drop_min    = 35;       // TRUE drop range. 35 is the PHYSICAL minimum: the
                        // plate sitting flush to the frame underside is as high
                        // as the controller can possibly go.
drop_max    = 90;
fa_range    = 30;       // +/- fore-aft travel. MUST be a multiple of 10, or the
                        // 5 mm tick loop never lands on a labelled value and the
                        // numbers silently vanish (cost one print to find).
/* ACROSS range, TRUE mm from the LUG FACE. OUTBOARD ONLY — the controller mounts
   outboard of both rails (owner 2026-09-07), so there are no inboard positions to
   measure and the shelf does not reach in under the frame.

   20 mm is the FLOOR, and it is physical, not a guess: the spine occupies 6..10
   from the lug face and the carrier's upright 10..15, so the innermost a bolt can
   sit is the upright's face plus half a slot plus a web. The real bracket's floor
   is the same number within a few mm — 6 mm standoff plus a 10 mm panel is 16 —
   so the rig failing to reach IS the answer, not a rig limitation.
   ⚠ If the controller will not come in to 20 mm, the outboard-bracket architecture
   does not fit and needs rethinking before anything structural is printed. */
across_lo   = 20;
across_hi   = 70;
// The two sliding joints. Kept SYMMETRIC about the lug midpoint (they sum to
// lug_spacing) so one spine serves both sides of the bike, simply turned end for
// end. A flat plate cannot be 'mirrored' any other way — flipping it would put
// the engraved scale against the frame where you cannot read it.
/* 44, not 40. At 40 the fore/aft slot ran from x = 10, and its rounded end at
   x = 7.2 grazed the 15 mm standoff pad whose edge is at 7.5 — a slot ending
   exactly on a boss wall. 44 puts the slot end at 14 and leaves 6.5 mm of solid
   pad wall. Joint separation drops from 106 to 99 mm, which changes nothing for
   a bench jig. */
joint_a     = 44;
joint_b     = lug_spacing - joint_a;
carrier_c   = 95;       // carrier centre along the bike
jig_edge    = 16;

function tick_len(v, step) = (v % step == 0) ? 6.5 : 3.2;

// engraved scale: ticks every 5, numbers every 10, along +X
module scale_x(from, to, y, flip = false) {
    for (v = [from : 5 : to]) {
        translate([v - 0.5, y]) square([1.0, tick_len(v, 10)]);
        if (v % 10 == 0)
            translate([v, y + (flip ? -6 : 11)])
                text(str(v), size = 5, halign = "center", valign = "center", $fn = 16);
    }
}
// same, running along +Y. mir=true flips each number about its own centre, for a
// face that is READ FROM THE OTHER SIDE — engrave it un-mirrored there and every
// digit comes out backwards.
module scale_y(from, to, x, dir = 1, mir = false) {
    for (v = [from : 5 : to]) {
        tl = tick_len(v, 10);
        translate([dir > 0 ? x : x - tl, v - 0.5]) square([tl, 1.0]);
        if (v % 10 == 0)
            translate([x + dir*16, v]) mirror([mir ? 1 : 0, 0, 0])
                text(str(v), size = 5, halign = "center", valign = "center", $fn = 16);
    }
}

// ---- rev G: the slots swap parts -------------------------------------------
// The spine used to hang DOWN to carry the drop slots, which put plastic exactly
// where the controller's body sits. Owner caught it. So the two adjustments have
// swapped homes:
//     SPINE   keeps only the FORE/AFT slots and stays entirely ABOVE the
//             controller's top face. It never reaches down past it.
//     CARRIER grows its upright UPWARD from the shelf and carries the DROP
//             slots. Because the upright starts at the shelf, which IS the
//             controller's top face, it never intrudes below it either.
// Net effect: no part of the jig occupies the controller's volume at any drop
// setting, and the crossed-slot joint still gives both axes with two bolts.
spine_top   = 20;
spine_bot   = -26;      // clears the carrier's shelf top at the shallowest drop
                        // (shelf underside -35, plus carrier_thk, gives -30)
spine_slotz = -2;       // level with the lug line (but offset along it), which
                        // leaves room for a scale ABOVE and BELOW the slot
up_tall     = 100;      // carrier upright height above the shelf
/* ⚠ THE UPRIGHT MUST NOT REACH THE FRAME BOLTS. It lies flat against the spine's
   outer face at across 10..15, and that is exactly where the two frame bolt heads
   sit — an M5 cap head on a 4 mm plate standing 6 mm off the lug occupies 10..15
   too. A full-length upright fouls both of them and the carrier will not sit down
   on the spine. Found by rendering the assembly, not by looking at the part.
   The upright only has to reach its own two joints at 44 and 143, so it stops
   short of the lugs at 0 and 187 with about 21 mm to spare either end. */
up_x_lo     = joint_a - 18;   //  26
up_x_hi     = joint_b + 18;   // 161

module jig_spine() {
    x_lo = -jig_edge - 8; x_hi = lug_spacing + jig_edge + 8;
    difference() {
        union() {
            linear_extrude(jig_thk)
                round2d(8) polygon([[x_lo, spine_bot], [x_hi, spine_bot],
                                    [x_hi, spine_top], [x_lo, spine_top]]);
            // Standoff pads on the FRAME side. The lug is recessed in a rounded
            // tube, so the plate cannot bear flat — it sits on these two and
            // touches the frame nowhere else.
            for (x = [0, lug_spacing])
                translate([x, 0, -lug_standoff])
                    cylinder(d = lug_pad_d, h = lug_standoff + 0.01, $fn = 48);
        }
        for (x = [0, lug_spacing])
            translate([x, 0, -lug_standoff - 1])
                cylinder(d = jig_bolt + 0.5, h = jig_thk + lug_standoff + 2, $fn = 24);
        for (jx = [joint_a, joint_b]) {
            translate([0, 0, -1]) linear_extrude(jig_thk + 2)
                hull() for (d = [-fa_range, fa_range])
                    translate([jx + d, spine_slotz]) circle(d = jig_slot, $fn = 20);
            /* TWO scales per slot. Turning the plate end for end for the other
               side of the bike reverses which way the numbers run, so the second
               row is pre-reversed. At any one point the two rows therefore read
               EQUAL AND OPPOSITE — that is the scale working, not a contradiction.

               ⚠ MY ORIGINAL RULE, "read the row whose letter is upright", IS WRONG.
               Both letters are drawn the same way up, so they are either both
               upright or both inverted and they discriminate nothing.
               THE RULE IS: use the row whose numbers get LARGER toward the REAR of
               the bike. Positive is rearward. */
            translate([0, 0, jig_thk - 0.8]) linear_extrude(1.2) {
                translate([jx, spine_slotz + 4]) scale_x(-fa_range, fa_range, 0);
                translate([jx - fa_range - 13, spine_slotz + 10])
                    text("R", size = 5.5, halign = "center", valign = "center", $fn = 16);
                translate([jx, spine_slotz - 4])
                    for (v = [-fa_range : 5 : fa_range]) {
                        tl = (v % 10 == 0) ? 6.5 : 3.2;
                        translate([-v - 0.5, -tl]) square([1.0, tl]);
                        if (v % 10 == 0)
                            translate([-v, -12])
                                text(str(v), size = 5, halign = "center",
                                     valign = "center", $fn = 16);
                    }
                translate([jx + fa_range + 13, spine_slotz - 10])
                    text("L", size = 5.5, halign = "center", valign = "center", $fn = 16);
            }
        }
    }
}

// Both spines on one plate. They are IDENTICAL — the pattern is symmetric about
// the lug midpoint, so the same plate serves either side by turning it end for
// end, which keeps the engraved face outboard where you can read it. Each plate
// carries two scales, R and L; use the row whose letter reads upright.
module jig_spine_pair(gap = 12) {
    h = spine_top - spine_bot;
    // Rotated for printing: PADS UP, engraved face on the bed. Pads down would
    // stand the whole plate on two 15 mm stilts and need support everywhere.
    // This is a rotation, not a mirror, so the engraving stays the right way round.
    translate([0, 0, jig_thk]) rotate([180, 0, 0]) {
        jig_spine();
        translate([0, -(h + gap), 0]) jig_spine();
    }
}

module jig_carrier() {
    x_lo = -jig_edge; x_hi = lug_spacing + jig_edge;
    /* Shelf depth, measured from the upright's inner face outwards. It used to be
       built as the across range plus 12 mm at BOTH ends, which made sense outboard
       (that margin stops a bolt bursting out of the slot end, 9.2 mm of it survives)
       but not inboard, where the upright and the 10 mm datum ate all but 2 mm. That
       2 mm hung past the upright carrying nothing, so the shelf now starts flush
       with the upright's inner face. */
    shelf_d = across_hi - across_datum + 12;   // 72
    difference() {
        union() {
            // upright rises FROM the shelf, so it never goes below it.
            // Local Y = 0 is its INNER face, which lands on the spine's outer
            // face, so world distance from the lug face = across_datum + local Y.
            /* ⚠ ROUND THE FREE EDGES ONLY, NEVER THE JOINT.
               Both panels used to round their whole outline, so each arrived at the
               shared corner with its own curve and they did not meet: the upright's
               foot pulled in a full 8 mm at each end while the shelf pulled in less
               than 3 mm, leaving two mismatched borders and an unsupported lip.
               Fix: extend each profile PAST the joint, round it there where nobody
               sees it, then trim back to the joint line. What is left is a
               full-width square end on both parts, so they meet flush along the
               whole corner and finish in one clean vertical edge. */
            translate([0, carrier_thk, 0]) rotate([90, 0, 0]) linear_extrude(carrier_thk)
                intersection() {
                    round2d(8) polygon([[up_x_lo, -10], [up_x_hi, -10],
                                        [up_x_hi, up_tall], [up_x_lo, up_tall]]);
                    translate([up_x_lo, 0]) square([up_x_hi - up_x_lo, up_tall]);
                }
            // shelf: underside at z = 0 IS the controller's top face. Local Y = 0
            // is the upright's inner face, so the shelf runs straight outboard
            // from it. Rounded on the free edges only, square on the joint.
            translate([x_lo, 0, 0]) linear_extrude(carrier_thk)
                intersection() {
                    round2d(8) translate([0, -10])
                        square([x_hi - x_lo, shelf_d + 10]);
                    square([x_hi - x_lo, shelf_d]);
                }
        }
        // vertical DROP slots, labelled with the true lug-to-controller distance
        for (jx = [joint_a, joint_b]) {
            translate([0, carrier_thk + 1, 0]) rotate([90, 0, 0]) linear_extrude(carrier_thk + 2)
                hull() for (d = [drop_min, drop_max])
                    translate([jx, d + spine_slotz]) circle(d = jig_slot, $fn = 20);
            // Both drop scales point INWARD, towards the middle of the upright.
            // The rear one used to run to x = 168, which is now past the trimmed
            // upright's edge at 164 and would have engraved into thin air.
            sg = (jx < lug_spacing/2) ? 1 : -1;
            translate([0, carrier_thk + 0.5, 0]) rotate([90, 0, 0]) linear_extrude(1.8)
                for (d = [drop_min : 5 : drop_max]) {
                    tl = (d % 10 == 0) ? 6.5 : 3.2;
                    translate([sg > 0 ? jx + 6 : jx - 6 - tl, d + spine_slotz - 0.5])
                        square([tl, 1.0]);
                    // ⚠ MIRRORED ON PURPOSE. This cut enters the upright's OUTER
                    // face, the one you stand outboard of the bike and look at.
                    // Sketch +X points LEFT from there, so un-mirrored text prints
                    // backwards. Caught by rendering that face straight on.
                    if (d % 10 == 0)
                        translate([jx + sg*22, d + spine_slotz]) mirror([1, 0, 0])
                            text(str(d), size = 5, halign = "center",
                                 valign = "center", $fn = 16);
                }
        }
        /* The two controller bolts on THIS carrier, 106 mm apart along the bike.
           They used to be 168 apart, which had the controller bolting to a rail
           along its long edges — wrong way round, and the rig would not assemble.
           See the orientation note at the hole pattern. */
        for (cx = [carrier_c - ctrl_hole_dx/2, carrier_c + ctrl_hole_dx/2]) {
            // Slots placed by TRUE distance from the lug face, minus the spine
            // thickness to convert into the carrier's own frame.
            // ONE continuous slot over the whole range, entirely outboard of the
            // upright, so nothing is interrupted and there is no dead band.
            translate([0, 0, -1]) linear_extrude(carrier_thk + 2)
                hull() for (d = [across_lo, across_hi])
                    translate([cx, d - across_datum]) circle(d = jig_slot, $fn = 20);
            // Scale sits INBOARD of its slot, towards the middle of the shelf.
            // Cut on BOTH faces. The top face looks up into the frame and cannot
            // be read with the jig on the bike; the underside can, and at these
            // two x positions it is clear of the controller body. The underside
            // copy is mirrored because you read it from below.
            for (f = [0, 1])
                translate([0, 0, f ? carrier_thk - 1.0 : -0.4]) linear_extrude(1.4) {
                    translate([cx + (cx < carrier_c ? 6 : -6), -across_datum])
                        scale_y(across_lo, across_hi, 0,
                                cx < carrier_c ? 1 : -1, mir = (f == 0));
                    // Each slot is stamped with ITS OWN pair spacing, 168 or 106,
                    // in the clear band above the slot end. With four slots and
                    // four scales the pairing is otherwise guesswork, and the
                    // whole point is to report back which pair the bolts used.
                    translate([cx, across_hi - across_datum + 7])
                        mirror([f == 0 ? 1 : 0, 0, 0])
                            text(str(round(2*abs(cx - carrier_c))), size = 4.5,
                                 halign = "center", valign = "center", $fn = 16);
                }
        }
    }
}

module layout() {
    // toe angle: each rail runs inward going back, since the front lugs are wider
    toe = atan((lug_span_front/2 - lug_span_rear/2) / lug_spacing);

    // one side: rail + bracket, laid along that rail
    module side() {
        translate([0, lug_span_front/2, 0]) rotate([0, 0, -toe]) {
            color("Silver") bracket();
            /* The rail. It is a TUBE, not a box (owner 2026-09-08), and its crown
               stands lug_standoff proud of the lug face, which is why the pads
               exist. Drawn touching the controller's plate, because at drop 35
               that is exactly what it does — zero gap. */
            color("DarkRed", 0.5)
                translate([x0 - 55, lug_standoff - rail_d/2, -drop + rail_d/2])
                    rotate([0, 90, 0]) cylinder(d = rail_d, h = blank_x + 110, $fn = 48);
        }
    }
    side();
    mirror([0, 1, 0]) side();

    // the controller: centred across the bike, shifted REARWARD off the shock,
    // hanging below both shelves on the standoff bosses
    color("Teal", 0.55)
        translate([lug_spacing/2 + ctrl_shift_rear - ctrl_len/2, -ctrl_wid/2,
                   -drop - standoff - ctrl_hgt])
            cube([ctrl_len, ctrl_wid, ctrl_hgt]);

    /* ---- PROPOSED TIE BARS ----
       Two cross members turning a pair of cantilevers into a closed frame. They
       pass UNDER the rails and fore/aft of the controller, so they foul nothing,
       and they take the tipping load that currently lands entirely on two 15 mm
       pads per side. The forward one is what a scoop would bolt to later. */
    if (ties) {
        ty = lug_span_front/2 + lug_standoff + pt;   // the shelves' inboard edges
        color("DarkOrange")
            for (xc = [x0 + 26, x0 + blank_x - 26])
                // 2 mm below the rails, which sit ON the plate at -drop. Drawn
                // flush first time, which made it tangent to both tubes.
                translate([xc - 11, -ty - 7, -drop - 14])
                    cube([22, 2*ty + 14, 12]);
    }

    // centreline, for reading the symmetry
    color("Black", 0.30)
        translate([x0 - 60, -0.6, -drop - standoff - ctrl_hgt - 12])
            cube([blank_x + 140, 1.2, 1.2]);
}
// ============================================================
//  MOCK — the whole rig assembled on the bike with the controller fitted.
//  Nothing here gets printed. It exists to check that the parts, the frame and
//  the controller can all occupy the same space, which is the check that the
//  last two failures would have caught.
//
//  Frame convention: +X rearward, front lug at X = 0 and rear lug at X = 187.
//  +Y is the LEFT of the bike, Z = 0 is the lug centre line.
//  The rails TOE INWARD going back, since the front lugs sit wider than the rear.
// ============================================================
mock_drop  = drop;          // tracks the measured drop
mock_shift = ctrl_shift_rear;   // tracks the (unconfirmed) fore/aft

// One side, built for the LEFT rail. Rail-local: x along the rail, y OUTBOARD
// from the lug face, z up.
module rig_side() {
    toe = atan((lug_span_front/2 - lug_span_rear/2) / lug_spacing);
    translate([0, lug_span_front/2, 0]) rotate([0, 0, -toe]) {
        // The rail, indicative. Its crown deliberately stands 6 mm PROUD of the
        // lug face, with the lug sunk in a recess — that is the whole reason the
        // standoff pads exist and it should be visible in the picture.
        color("DimGray")
        difference() {
            translate([-12, -14, 0]) rotate([0, 90, 0])
                cylinder(d = 40, h = lug_spacing + 24, $fn = 48);
            for (x = [0, lug_spacing]) {
                translate([x, -0.01, 0]) rotate([-90, 0, 0])
                    cylinder(d = 19, h = 20, $fn = 36);
                translate([x, -30, 0]) rotate([-90, 0, 0])
                    cylinder(d = 5, h = 40, $fn = 24);
            }
        }
        // spine, pads down in the lug recesses
        color("SteelBlue")
            translate([lug_spacing, lug_standoff, 0]) rotate([90, 0, 180]) jig_spine();
        // carrier hanging on it
        color("Goldenrod")
            translate([mock_shift, across_datum, -mock_drop]) jig_carrier();
        // the two frame bolts
        color("Silver") for (x = [0, lug_spacing]) {
            translate([x, -8, 0]) rotate([-90, 0, 0]) cylinder(d = 5, h = 20, $fn = 24);
            translate([x, 10, 0]) rotate([-90, 0, 0]) cylinder(d = 9, h = 4, $fn = 24);
        }
    }
}

module mock() {
    rig_side();
    // Right side is the SAME parts turned end for end about the bike's centre,
    // which is a rotation and not a mirror — that is why one printed plate serves
    // both sides.
    rotate([0, 0, 180]) translate([-lug_spacing, 0, 0]) rig_side();

    // Controller: 120 mm ALONG the bike, 180 mm ACROSS it, 55 deep. Its top face
    // bolts up against both shelves.
    color("DarkSlateGray")
        translate([lug_spacing/2 + mock_shift - 60, -90, -mock_drop - 55])
            cube([120, 180, 55]);
    // its four bolts, 106 apart along the bike and 168 across
    color("Silver")
    for (bx = [carrier_c - ctrl_hole_dx/2, carrier_c + ctrl_hole_dx/2])
        for (by = [-ctrl_hole_dy/2, ctrl_hole_dy/2])
            translate([bx + mock_shift, by, -mock_drop - 16])
                cylinder(d = 6, h = 16 + carrier_thk + 5, $fn = 24);
}

// ============================================================
//  SECTION — cross-section through one side, looking along the bike. Compares the
//  shelf we have with the hook the owner proposed. Not a printable part.
//  X here is ACROSS the bike from the LUG FACE, Y is up with 0 at the lug centre.
// ============================================================
T = 14;                        // section slab thickness, purely so it renders solid
module sq(x, y, w, h) { translate([x, y, 0]) linear_extrude(T) square([w, h]); }

/* Datum: x = 0 IS THE LUG FACE. The pad occupies 0..6, so every bracket starts at
   6, not 0 — getting that wrong put the frame tube through the panel first time.
   The tube's crown stands 6 mm proud of the lug face, which is the whole reason
   for the pad, so the tube is centred 14 inboard of the face. */
plate_edge = reach_front + 6;              // 38.5, bolt sits 6 in from the edge
module sec_frame() {
    color("DimGray") {
        translate([-14, 0, 0]) linear_extrude(T) circle(d = 40, $fn = 64);
        sq(0, -4, 2, 8);                                  // lug, in its recess
    }
    color("DarkSlateGray") {
        sq(-95, -drop - 8, plate_edge + 95, 8);           // alloy plate
        sq(-95, -drop - 55, plate_edge + 90, 47);         // body below
    }
    color("Crimson") sq(reach_front - 1.5, -drop - 12, 3, 16);
}

module sec_now() {
    color("Goldenrod") {
        sq(0, -7, lug_standoff, 14);
        sq(lug_standoff, -drop, pt, drop + up_margin);
        sq(lug_standoff + pt, -drop, reach, pt);
    }
}

module sec_hook() {
    leg_i = plate_edge + 2; leg_o = leg_i + 12;
    color("MediumSeaGreen") {
        sq(0, -7, lug_standoff, 14);
        sq(lug_standoff, -20, pt, 20 + up_margin);        // stub at the lug
        sq(lug_standoff, -20, leg_o - lug_standoff, 12);  // top arm, in free air
        sq(leg_i, -drop, 12, 27);                         // leg, outboard of the plate
        sq(reach_front - 10, -drop, leg_o - reach_front + 10, 8);   // foot over the bolt
    }
}

module section() {
    sec_frame(); sec_now();
    translate([210, 0, 0]) { sec_frame(); sec_hook(); }
}

/* Both brackets on one bed in the orientation the checklist requires: PANEL FLAT,
   shelf standing up, pads down. The pads hold the panel 6 mm off the bed so support
   goes under the whole panel — cheap, peels off easily, and it lands on the face
   that bears against the bike's 2 mm side panel where a scar does no harm. */
module plate(gap = 8) {
    module lay() { translate([0, 0, lug_standoff]) rotate([90, 0, 0]) children(); }
    depth = drop + up_margin;                  // 55 mm, the footprint across the bed
    lay() bracket();
    translate([0, -(depth + gap), 0])
        lay() translate([lug_spacing, 0, 0]) mirror([1, 0, 0]) bracket();
}

if      (part == "gauge") fit_gauge();
else if (part == "panel") test_panel();
else if (part == "rig")   rig();
else if (part == "jig_spine")   jig_spine();
else if (part == "jig_spine_pair") jig_spine_pair();
else if (part == "jig_carrier") jig_carrier();
else if (part == "layout") layout();
else if (part == "mock")   mock();
else if (part == "section") section();
/* ⚠ THE TWO SIDES ARE MIRROR IMAGES, NOT THE SAME PART TWICE. The shelf is a
   trapezoid, deeper at the rear because the rails narrow going back, and the
   controller sits 9.5 mm rearward, so the bracket is asymmetric front to back.
   Turning one end for end would put the deep end at the front.
   Mirrored in X rather than Y: both give the opposite hand, but mirroring in X
   keeps the pads and the shelf on the same faces, so one lay-down rotation serves
   both parts on the plate. */
else if (part == "bracket_left")  bracket();
else if (part == "bracket_right") translate([lug_spacing, 0, 0]) mirror([1,0,0]) bracket();
else if (part == "plate")         plate();
else                       bracket();
