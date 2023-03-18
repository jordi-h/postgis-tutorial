FROM postgis/postgis as builder

RUN apt update
RUN apt install -y postgis
RUN which shp2pgsql

FROM postgis/postgis

ENV POSTGRES_USER postgis
ENV POSTGRES_PASSWORD postgis

WORKDIR /tutorial

COPY --from=builder /usr/bin/shp2pgsql /usr/bin/shp2pgsql
COPY /data/ ./data
COPY import.sh .

EXPOSE 5432
