FROM ubuntu:20.04

ENV POSTGIS_VERSION 2.3.11

# INSTALL PREREQUISITES
RUN apt-get update \
 && apt-get install -y \
    wget \
    git \
    unzip \
    gnupg \
    gcc \
    make 
    # libxml2-dev \
    # libgeos-dev \
    # libgdal-dev \
 # && apt-get clean \
 # && rm -rf /var/lib/apt/lists/*

# DOWNLOAD AND INSTALL postgres
RUN touch /etc/apt/sources.list.d/pgdg.list \
 && echo "deb http://apt.postgresql.org/pub/repos/apt/ focal-pgdg main" >> /etc/apt/sources.list.d/pgdg.list \
 && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

ENV TIMEZONE=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime \
 && echo $TIMEZONE > /etc/timezone
RUN apt-get update \
 && apt-get install -y \
    postgresql-9.1 \
    postgresql-server-dev-9.1

# DOWNLOAD AND INSTALL postgres
# RUN cd /var/lib/ \
#  && wget http://download.osgeo.org/postgis/source/postgis-${POSTGIS_VERSION}.tar.gz \
#  && tar xfz postgis-${POSTGIS_VERSION}.tar.gz \
#  && rm postgis-${POSTGIS_VERSION}.tar.gz
# RUN cd /var/lib/postgis-${POSTGIS_VERSION} \
#  && ./configure \
#  && make \
#  && make install

# # configure postgresql spatio-temporal extensions
# USER postgres
# RUN service postgresql start
# RUN POSTGIS_SQL_PATH=`pg_config --sharedir`/contrib/postgis-${POSTGIS_VERSION}
# RUN createdb -E UTF8 -T template0 template_postgis
# RUN createlang -d template_postgis plpgsql
# RUN psql -d template_postgis -f $POSTGIS_SQL_PATH/postgis.sql
# RUN psql -d template_postgis -f $POSTGIS_SQL_PATH/spatial_ref_sys.sql
# RUN psql -d template_postgis -c "GRANT ALL ON geometry_columns TO PUBLIC;"
# RUN psql -d template_postgis -c "GRANT ALL ON geography_columns TO PUBLIC;"
# RUN psql -d template_postgis -c "GRANT ALL ON spatial_ref_sys TO PUBLIC;"
# RUN psql -d template_postgis -c "VACUUM FULL;"
# RUN psql -d template_postgis -c "VACUUM FREEZE;"
# RUN psql -d postgres -c "UPDATE pg_database SET datistemplate='true' WHERE datname='template_postgis';"
# RUN psql -d postgres -c "UPDATE pg_database SET datallowconn='false' WHERE datname='template_postgis';"
# RUN createdb endpoint -T template_postgis
# RUN service postgresql stop