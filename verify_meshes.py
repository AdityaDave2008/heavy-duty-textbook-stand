"""Optional STL validation with `pip install trimesh`."""
from pathlib import Path
import trimesh

ROOT = Path(__file__).resolve().parent
parts = ['side_frame','shelf','front_rail','rear_rail','upper_rail','arm_left','arm_right']
for part in parts:
    mesh = trimesh.load_mesh(ROOT / 'stl' / f'{part}.stl')
    bbox = mesh.bounding_box.extents
    assert mesh.is_watertight, f'{part} is not watertight'
    assert all(dim <= 260 for dim in bbox), f'{part} exceeds standard Creality K2 260-mm limit'
    assert mesh.volume > 0, f'{part} has invalid volume'
    print(f'{part:12} dimensions={bbox.round(1)} mm  watertight=YES')
print('All seven unique STL meshes passed basic automated checks. Physical load is NOT verified.')
