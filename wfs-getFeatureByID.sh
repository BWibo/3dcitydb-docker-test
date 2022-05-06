#!/usr/bin/env bash

wfsBaseURL="http://localhost:8080/wfs/wfs"

# WFS query
getFeatureById=$(cat <<-XML
<?xml version="1.0" encoding="UTF-8"?>
<wfs:GetFeature service="WFS" version="2.0.0" xmlns:wfs="http://www.opengis.net/wfs/2.0">
  <wfs:StoredQuery id="http://www.opengis.net/def/query/OGC-WFS/0/GetFeatureById">
    <wfs:Parameter name="id">GMLID_BUI184698_512_898</wfs:Parameter>
  </wfs:StoredQuery>
</wfs:GetFeature>
XML
)

# WFS response
XMLRESPONSE=$(curl  -v \
      -H "Content-Type: text/xml" \
      -X POST \
      -d "$getFeatureById" \
    "$wfsBaseURL")

# lint response xml, if possible
if [ "$(command -v xmllint)" != "" ]; then
  echo "$XMLRESPONSE" | xmllint --format - | head -n 50 -
else
  echo "$XMLRESPONSE" | head -n 50 -
fi