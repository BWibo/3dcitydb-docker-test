# 3DCityDB Docker Images testing

## Usage

1. Run `./import.sh [3dcitydb/impexp:tag] [DATASET path (relative to this script)] [3dcitydb/3dcitydb-image:tag] [SRID]`. When no parameters are specified, the LoD3 Railway dataset is being imported.

2. Run `./export.sh [3dcitydb/impexp-image:tag]` or `./vis-export.sh [3dcitydb/impexp-image:tag]` to test exports.
   All files are exported to `./temp/` by default.

## Example

1. `./import.sh` ==> Create a 3DCityDB Container with the LoD3 dataset.
2. `./export.sh myCustomImage/impexp` Try a CityGML export with a custom image, e.g. a locally built image.
3. Check the exported data in `./temp/`.
