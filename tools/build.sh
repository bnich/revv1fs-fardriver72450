#!/usr/bin/env bash
# Export every printable part and verify each bounding box.
#
# NOTE: exports a SOLID format deliberately. OpenSCAD exits 0 on a failed
# assert() for tree formats (echo/csg/ast/term) and for PNG, and only returns
# non-zero for stl/off/3mf/amf.
set -euo pipefail
cd "$(dirname "$0")/.."
SRC=src/fardriver-underseat-mount.scad
mkdir -p stl

for part in gauge bracket_left bracket_right plate; do
  out="stl/${part}.stl"
  [ "$part" = "plate" ] && out="stl/brackets_plate.stl"
  echo "--- $part"
  openscad -o "$out" -D "part=\"$part\"" "$SRC"
  python3 tools/check_stl.py "$out"
done

echo "ALL-OK"
