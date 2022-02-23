# Modified from the National and Kapodistrian UoA's KRR&A team's tools suite: https://github.com/gioargyr/docker-krrasuite

FROM ubuntu:16.04

ENV PORT 8080
ENV TIMEZONE Europe/Paris
ENV POSTGIS_VERSION 2.2.8
ENV PROJ4_VERSION 4.6.1

# INSTALL PREREQUISITES
RUN ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime \
 && echo $TIMEZONE > /etc/timezone
RUN apt update \
 && apt install -y \
    wget \
    git \
    unzip \
    gnupg \
    gcc \
    make \
    libxml2-dev \
    libgeos-dev \
    libgdal-dev \
 && apt clean \
 && rm -rf /var/lib/apt/lists/*

# DOWNLOAD AND INSTALL Proj4
RUN cd /usr/local/ \
 && wget https://download.osgeo.org/proj/proj-${PROJ4_VERSION}.tar.gz \
 && tar xfz proj-${PROJ4_VERSION}.tar.gz \
 && rm proj-${PROJ4_VERSION}.tar.gz
RUN cd /usr/local/proj-${PROJ4_VERSION} \
 && ./configure \
 && make \
 && make install
 # && make check # this will fail; github issue: https://github.com/OSGeo/PROJ/issues/255

# DOWNLOAD AND INSTALL postgres
RUN touch /etc/apt/sources.list.d/pgdg.list \
 && echo "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main" >> /etc/apt/sources.list.d/pgdg.list \
 && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt update \
 && apt install -y \
    postgresql-9.1 \
    postgresql-server-dev-9.1

# DOWNLOAD AND INSTALL postgis
RUN cd /var/lib/ \
 && wget http://download.osgeo.org/postgis/source/postgis-${POSTGIS_VERSION}.tar.gz \
 && tar xfz postgis-${POSTGIS_VERSION}.tar.gz \
 && rm postgis-${POSTGIS_VERSION}.tar.gz
RUN cd /var/lib/postgis-${POSTGIS_VERSION} \
 && ./configure \
 && make \
 && make install \
 && ldconfig \
 && make comments-install

# DOWNLOAD AND INSTALL PostgreSQL-Temporal
RUN cd /var/lib/postgresql \
 && git clone http://github.com/jeff-davis/PostgreSQL-Temporal
ADD period.out /var/lib/postgresql/PostgreSQL-Temporal/test/expected/
ADD period.sql /var/lib/postgresql/PostgreSQL-Temporal/test/sql/
RUN chown -v -R postgres:postgres /var/lib/postgresql/PostgreSQL-Temporal \
 && mkdir /usr/share/doc/postgresql-doc-9.1 \
 && chown -v -R postgres:postgres /usr/share/doc/postgresql-doc-9.1 \
 && chown -v -R postgres:postgres /usr/share/postgresql/9.1/ \
 && chown -v -R postgres:postgres /usr/lib/postgresql/9.1/

USER postgres

RUN cd /var/lib/postgresql/PostgreSQL-Temporal \
 && make \
 && make install \
 && service postgresql start \
 && make installcheck \
 && service postgresql stop

# CONFIGURE spatio-temporal extensions and endpoint
RUN service postgresql start \
 && POSTGIS_SQL_PATH=`pg_config --sharedir`/contrib/postgis-* \
 && createdb -E UTF8 -T template0 template_postgis \
 # && createlang -d template_postgis plpgsql \
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
 && psql -d endpoint -c "CREATE EXTENSION temporal;" \
 && service postgresql stop
RUN echo -e "host \t all \t all \t 0.0.0.0/0 \t md5" >> /etc/postgresql/9.1/main/pg_hba.conf \
 && echo "listen_addresses='*'" >> /etc/postgresql/9.1/main/postgresql.conf

# LAUNCH postgres
USER root

EXPOSE $PORT

CMD cat /etc/postgresql/9.1/main/pg_hba.conf | grep host \
 && cat /etc/postgresql/9.1/main/postgresql.conf | grep listen_addresses \
 && su - postgres -c "/usr/lib/postgresql/9.1/bin/postgres -D /var/lib/postgresql/9.1/main -c config_file=/etc/postgresql/9.1/main/postgresql.conf"
