#!/bin/bash

cd data
shp2pgsql -s 2154 -W LATIN1 -D -I World_Countries__Generalized_.shp countries | psql -U postgis -d postgis -p 5432
