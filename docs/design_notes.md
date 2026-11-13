# V3 design notes

Each cradle uses a 40 mm wide inner frame and a thinner wing to support the book cover. Two bars join the cradles at 50 mm and 145 mm along the backrest. Seven positions on each ledge let the reader move the page finger as the page stack changes thickness.

## How the weight reaches the desk

The book rests on the two ledges and leans against the backrests. Each triangular frame carries its share down to the desk. The connector bars keep the cradles aligned. The [side elevation](../images/engineering_diagram.png) shows the direction of gravity on the book.

Let $R_L$ and $R_R$ be the extra upward desk reactions at the left and right cradles caused by adding the book. This treats the book and stand as one stationary system and subtracts the reactions from the empty stand. Taking upward as positive gives

```math
\sum F_z = 0 \quad\Longrightarrow\quad R_L + R_R - mg = 0.
```

If the book is centered and the two sides share the load equally, then

```math
R_L = R_R = \frac{mg}{2} \approx \frac{35.6\,\mathrm{N}}{2} = 17.8\,\mathrm{N}.
```

An uneven page stack or hand pressure can shift the load toward one side. The [book weight calculation](../README.md#book-weight-and-downward-force) gives the total gravitational force. Joint stresses, resistance to tipping, and allowable working load require separate checks.

## Material-saving revision

The recorded CAD volume per cradle fell from 1,133.35 cm³ in compact V2 to 571.53 cm³ in V3, a 49.6% reduction. The connector bars and fingers retain their V2 geometry. Filament use and print time depend on the slicer settings. The original [validation data](Validation.json) includes part dimensions, STL checksums, and geometric fit checks.
