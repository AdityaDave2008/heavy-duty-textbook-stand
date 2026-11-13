# Assembly guide: prototype v0.1

## Before you print

This is a prototype designed around an 8 lb target, not a tested or guaranteed load rating. Measure the actual textbook width, height, and closed thickness. The shelf front-lip-to-backrest span is intended for a thick book, but page and cover thickness changes substantially when a textbook is open. Inspect the CAD model for clearance with your own book before printing.

## Parts and supplies

**Print:** 2 × side frame, 1 × shelf, 1 × front rail, 1 × rear rail, 1 × upper rail, 1 × left page arm, 1 × right page arm.

**Buy:** 4 × M4 × 45 mm bolts and M4 nuts for attaching the shelf to the sides; 2 × M4 × 45 mm bolts, washers, and lock nuts for the page arm pivots; 6 × M4 × 20 mm bolts with nuts as end-stop pins for the three rail ends; rubber feet or thin non-slip adhesive pads. The stated bolt lengths are initial estimates: verify hardware fit against your actual printed parts before buying in bulk. A shorter bolt may be adequate for an end-stop pin. Small friction washers help keep the arms from swinging freely.

## Suggested slicer settings

PETG, 0.20 mm layers, 5-6 walls, 5-7 solid top and bottom layers, and 35-45% gyroid infill are recommended initial prototypes. Actual mechanical capacity depends on filament quality, nozzle, adhesion, print orientation, and environmental temperature. Inspect top/bottom layer previews to ensure you are not relying on sparse infill in a screw boss or narrow load path.

## Assembly sequence

1. **Print two side frames.** Each side is identical. Keep the long bottom edge level with the tabletop and orient both frames so the tall angled book-support ribs face forward (toward the shelf).
2. **Insert the three tie bars.** The 21 mm-deep bar fits the front lower opening, and the two 22 mm-deep bars fit the rear lower and upper openings. Each bar should extend beyond both side frames. Do not hammer a jammed rail; check fit and adjust the CAD tolerance first.
3. **Capture the tie bar ends.** Insert an M4 bolt through each hole outside each side frame. Secure with a nut. These bolts act as retaining pins so the side frames cannot slide off the bars sideways. The rails are not meant to hang the book from bolts alone.
4. **Attach the shelf.** Place the broad shelf across the top edges of the front portions of both side frames; the raised lip faces you. Align the four shelf mounting holes with the matching holes in the side frame bases. Insert M4 × 45 mm bolts down through the shelf. Insert M4 nuts in the hex recesses on the undersides of the side frames and tighten snugly, not hard enough to crush printed plastic.
5. **Install the page holders.** Place left and right arms on the two round front-lip bosses, facing inward. Insert M4 bolts through their pivots and use washers/nuts underneath. Tighten just enough so the arms stay put but can be rotated outward when turning pages.
6. **Add non-slip feet.** Apply pads to the bottom frame edges, keeping all support points level and preventing scratching.
7. **Test with a lightweight book first.** Verify shelf, rail ends, pivot movement, and centered book position. Progress to heavier loads only through the controlled steps in [load_test.md](load_test.md).

## Using the page holders

Rest the bottom edge of the book on the shelf, with the cover leaning against the support rails. Swing the two retainer arms inward to catch the lower corners of the pages. Turn a page by rotating the relevant arm outward, turning the sheet, then rotating it back. These arms are **mechanical stops, not spring clamps**; their ability to restrain a thick textbook's pages is a v0.1 test goal. Add small non-scratching pads at contact ends if needed.

## If a part does not fit

Open `cad/textbook_stand.scad` and adjust the rail opening clearances or the mounting geometry. Keep at least a small clearance (nominally 0.3 mm per side for these mortises), and print a single test fit before reproducing all parts. Record each modification and why you made it in the design log.
