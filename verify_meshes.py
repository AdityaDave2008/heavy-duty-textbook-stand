"""Check the V3 print files against the original CAD export manifest."""
import hashlib
import json
from pathlib import Path

root = Path(__file__).resolve().parent
parts = json.loads((root / "docs/Validation.json").read_text())["parts"]
for part in parts:
    directory = root / "stl"
    if part["name"].startswith("00"):
        directory = directory / "fit_tests"
    file = directory / (part["name"] + ".stl")
    if hashlib.sha256(file.read_bytes()).hexdigest() != part["stl_sha256"]:
        raise ValueError(f"{file.name} differs from the validated CAD export")
    print(f"{file.name} matches the V3 export")
