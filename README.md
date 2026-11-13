# Heavy-Duty Textbook Stand

A six-piece, screw-free PLA stand for reading a heavy textbook at a desk. Each cover rests on its own cradle. Two connector bars span the open center, and a removable finger on each side holds the pages open. The V3 design target is an **8 lb textbook**. Physical load testing is pending.

![Front view of the V3 FreeCAD assembly showing the two cradles, both connector bars, and both page fingers](images/assembled_preview.png)

## Printable parts

| Part | Print quantity | Purpose |
| --- | ---: | --- |
| [Left cradle](stl/01_Left_Cradle_PRINT_1.stl) | 1 | Supports the left cover and page stack |
| [Right cradle](stl/02_Right_Cradle_PRINT_1.stl) | 1 | Supports the right cover and page stack |
| [Connector bar](stl/03_Connector_Bar_PRINT_2.stl) | 2 | Joins the cradles at two heights |
| [Page finger](stl/04_Page_Finger_PRINT_2.stl) | 2 | Fits into one of seven slots on each ledge |

The assembled stand is **440 mm wide** with a **180 mm center gap**. Each cradle has a **70° backrest**, a **190 mm foot depth**, and a **76 mm clear shelf depth**. To turn a page, lift the finger out of its slot, turn the page, and seat it again.

## Print and assemble

Open the STLs or the [arranged 3MF plates](plates/) in Creality Print at 100% scale. Print each cradle on its own plate with the broad inner frame face down. The supplied files already have this orientation. Start with the [fit-test pieces](stl/fit_tests/) to check the connector and page-finger fit on your printer. The [assembly guide](docs/assembly.md) covers the settings and assembly order.

## Book weight and downward force

Gravity acts vertically through the book's center of mass. The magnitude of the force is

```math
F_g = mg
```

Here, $m$ is the book's mass in kilograms and $g$ is the local gravitational acceleration. First convert the 8 lb target to kilograms. The pound units cancel.

```math
m = (8\,\mathrm{lb})\left(\frac{0.453592\,\mathrm{kg}}{1\,\mathrm{lb}}\right) = 3.628736\,\mathrm{kg} \approx 3.63\,\mathrm{kg}
```

Then multiply the unrounded mass by gravity. One newton equals one kilogram meter per second squared.

```math
F_g = (3.628736\,\mathrm{kg})(9.81\,\mathrm{m/s^2}) = 35.59790016\,\mathrm{N} \approx 35.6\,\mathrm{N}
```

![Side elevation of the V3 stand with an illustrative book and a vertical arrow showing its weight of 35.6 newtons](images/engineering_diagram.png)

The book adds **35.6 N downward** across the two cradles. The [design notes](docs/design_notes.md) explain how centering affects the load on each side. The [load-test log](docs/load_test.md) records the physical checks still to be run.

## CAD

The [FreeCAD macro](cad/Knight_PLA_Stand.FCMacro) builds the V3 cradles, bars, page fingers, and fit coupons. Run it in FreeCAD to generate editable solids and individual STEP or STL exports. Open the [assembled STEP model](cad/Assembly_REFERENCE_ONLY_DO_NOT_PRINT.step) to inspect all six pieces in their installed positions. Both drawings above use this assembly geometry.

## License

[MIT](LICENSE)
