FROM postgres:9.1

ENV POSTGIS_VERSION 2.3.11

# apt update will fail by itself as Debian 8 is no longer under LTS support since June 2020
RUN apt update; apt install -y \
    wget \
    default-jdk \
    git \
    unzip \
    gcc \
    make \
    postgis 
 # && apt clean 
 # && rm -rf /var/lib/apt/lists/*

# install postgis
# RUN cd /var/lib/ \
#  && wget http://download.osgeo.org/postgis/source/postgis-${POSTGIS_VERSION}.tar.gz \
#  && tar xfz postgis-${POSTGIS_VERSION}.tar.gz
# RUN apt install -y 
# RUN cd postgis-${POSTGIS_VERSION} \
#  && ./configure \
#  && make \
#  && make install \
#  && rm ../postgis-${POSTGIS_VERSION}.tar.gz

USER postgres
RUN service postgresql start \
 && POSTGIS_SQL_PATH=`pg_config --sharedir`/contrib/postgis-${POSTGIS_VERSION} \
 && createdb -E UTF8 -T template0 template_postgis \
 && createlang -d template_postgis plpgsql \
 && psql -d template_postgis -f $POSTGIS_SQL_PATH/postgis.sql \
 && psql -d template_postgis -f $POSTGIS_SQL_PATH/spatial_ref_sys.sql \
 && psql -d template_postgis -c "GRANT ALL ON geometry_columns TO PUBLIC;" \
 && psql -d template_postgis -c "GRANT ALL ON geography_columns TO PUBLIC;" \
 && psql -d template_postgis -c "GRANT ALL ON spatial_ref_sys TO PUBLIC;" \
 && psql -d template_postgis -c "VACUUM FULL;" \
 && psql -d template_postgis -c "VACUUM FREEZE;" \
 && psql -d postgres -c "UPDATE pg_database SET datistemplate='true' WHERE datname='template_postgis';" \
 && psql -d postgres -c "UPDATE pg_database SET datallowconn='false' WHERE datname='template_postgis';" \
 && createdb endpoint -T template_postgis \
 && service postgresql stop