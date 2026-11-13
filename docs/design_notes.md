# Engineering design notes

## User problem

Support a heavy textbook at a forward-facing reading angle and prevent loose pages from closing, without requiring the reader to bend their neck toward a flat desktop.

## Derived requirements

- Target book weight: 8 lb.
- Initial reading angle: approximately 71° measured upward from desk plane.
- Print volume: every part inside 260 × 260 × 260 mm (standard Creality K2).
- Open book should have room for a thick spine and movable lower-page retaining elements.
- Load-bearing members should have a continuous path from shelf to side frame and table.
- Modular parts make damage replacement and iteration possible.

## Static load, shown symbolically first

Given book weight as mass `m`, gravity `g`, normal support forces on the base `N_1` and `N_2`, static equilibrium gives:

`sum F_z = 0` so `N_1 + N_2 - mg = 0`, hence `N_1 + N_2 = mg`.

For a symmetrical, centered book, a rough idealized load split is `N_1 ≈ N_2 ≈ mg/2`, but actual force distribution depends on the shelf and contact locations. This is **not** the force in each rail or bolt.

Convert mass: `m = (8 lb)(0.453592 kg/lb) = 3.628736 kg`.

Substitute only at end: `mg = (3.628736 kg)(9.81 m/s²) = 35.5989 N ≈ 35.6 N`.

Idealized equal side reaction: `mg/2 ≈ 17.8 N per side`. This ignores uneven opening, hand pressure, shelf bending, impacts, and dynamic loads.

## Viewing angle

For upright centerline endpoints `(y_1,z_1)=(102,39)` and `(y_2,z_2)=(166,225)` mm:

`Δz = z_2-z_1 = 186 mm` and `Δy = y_2-y_1 = 64 mm`.

Let `θ` be the angle from horizontal. Then `tan θ = Δz/Δy`, giving `θ = atan(186/64) ≈ 71.0°`.

The physical book may sit at a slightly different angle because of its thickness, covers, pages, ribs, and contact points.

## Why triangulation?

The front inclined rib supports the book; the rear angled rib connects the upper portion to the back of the base. Together with the base, they form an approximate triangle, reducing the tendency of the upright to bend under load. The upper cross rail helps keep the two side frames apart; the continuous shelf and lower cross rails resist side-to-side racking. This is a qualitative design rationale, not a finite-element structural verification.

## Risk register

| Risk | Initial mitigation | Test |
| --- | --- | --- |
| Forward tipping as someone turns a page | Deep footprint, front lip, centered book | Small hand force while a book is loaded |
| Shelf bends | 9 mm base with shallow top ribs, multiple bolt points | Measure edge sag under progressive loads |
| Upright cracks at rail mortise | Rounded frame uprights, reinforced upper boss, PETG | Inspect after every load step |
| Layers split | Print side profiles flat, multiple walls | Inspect strain and cracks |
| Pages close or move out of clips | Independent movable holders, optional soft pads | Repeated page-turning trials |
| Loose side panels | Captive tie-rail end-stop bolts and bolted shelf | Shake gently only after assembly inspection |
| Desk slips | Adhesive anti-slip feet | Low-force lateral push |

## Known limitations

- No fabricated part has been physically tested at the time of this release.
- The page holders act as guards, not self-closing or spring-biased clamps.
- The angle is fixed in v0.1.
- A thick book can be wider than the supporting frame, requiring careful centering.
- Bolt lengths, clearances, printed tolerances, and grip are fit-test estimates.
- The approximate force balance does **not** establish a factor of safety or a working load limit.

## Planned v0.2

Measure the real book dimensions and center of mass, change the page arms based on user tests, consider a removable center spine support, add replaceable pads, measure shelf bending, and prototype angle adjustment while preserving the stable base.
