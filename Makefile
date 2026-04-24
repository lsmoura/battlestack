# Battlestack
# Licence: CC-BY-NC-SA
# Author: Sergio Moura
# Original work by: Twogz

OPENSCAD=openscad
WITH_INSERT_HOLES="false"
OUT_SUFFIX=""
PREFIX="gen/"

backplate:
	$(OPENSCAD) -o $(PREFIX)back_plate$(OUT_SUFFIX).stl \
		-D magnet_insert_holes=$(WITH_INSERT_HOLES) \
		back_plate.scad

original: backplate

original_with_inserts:
	$(MAKE) OUT_SUFFIX="_insert" WITH_INSERT_HOLES="true" original

all: original original_with_inserts

