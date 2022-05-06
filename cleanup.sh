# Remove containers
docker rm -f -v citydb
docker rm -f -v impexp

# Remove network
docker network rm citydb-net

# Cleanup folders
rm -r -f temp/*
