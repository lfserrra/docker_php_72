#!/bin/sh

apt-get update
apt-get install -y unixodbc-dev

bash -c "curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -"
bash -c "curl https://packages.microsoft.com/config/debian/8/prod.list > /etc/apt/sources.list.d/mssql-release.list"

apt-get update

# There is no mssql-tools package for Debian available via repository
ACCEPT_EULA=Y apt-get install msodbcsql

# now remove ODBC driver 13.1, then download and install 17 from Github
apt-get purge -y msodbcsql

wget https://github.com/Microsoft/msphpsql/raw/dev/ODBC%2017%20binaries%20preview/Debian%208/msodbcsql_17.0.0.5-1_amd64.deb
wget https://github.com/Microsoft/msphpsql/raw/dev/ODBC%2017%20binaries%20preview/Debian%208/mssql-tools_17.0.0.5-1_amd64.deb
ACCEPT_EULA=Y dpkg -i msodbcsql_17.0.0.5-1_amd64.deb
ACCEPT_EULA=Y dpkg -i mssql-tools_17.0.0.5-1_amd64.deb

ln -fsv /opt/mssql-tools/bin/* /usr/bin