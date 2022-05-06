# 3DCityDB Docker Images testing

1. Run `./import.sh [3dcitydb/impexp:tag] [DATASET path (relative to this script)] [3dcitydb/3dcitydb-image:tag] [SRID]`. When no parameters are specified, the LoD3 dataset is being imported.

2. Run `./export.sh [3dcitydb/impexp-image:tag]` or `./vis-export.sh [3dcitydb/impexp-image:tag]` to test exports.
   all files are exported to `./temp/` by default.
