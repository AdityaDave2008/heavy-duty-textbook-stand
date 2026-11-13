#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p stl
for part in side shelf front_rail rear_rail upper_rail arm_left arm_right; do
  echo "Exporting ${part}..."
  openscad -o "stl/${part/side/side_frame}.stl" -D "part=\"${part}\"" cad/textbook_stand.scad
 done
