#!/bin/sh

set -e

MAVEN_SETTINGS_FILE=/usr/share/maven/conf/settings.xml
SERVER_XML_RELEASE="<server><id>artifactory.libs-release-local</id><username>$ARTIFACTORY_USERNAME</username><password>$ARTIFACTORY_PASSWORD</password></server>"
SERVER_XML_SNAPSHOT="<server><id>artifactory.libs-snapshot-local</id><username>$ARTIFACTORY_USERNAME</username><password>$ARTIFACTORY_PASSWORD</password></server>"
SERVER_LINK_TIME_ARTIFACTORY="<server><id>link-time.artifactory</id><username>$LINK_TIME_ARTIFACTORY_USERNAME</username><password>$LINK_TIME_ARTIFACTORY_PASSWORD</password></server>"

sed -i~ "/<servers>/ a$SERVER_XML_RELEASE" $MAVEN_SETTINGS_FILE
sed -i~ "/<servers>/ a$SERVER_XML_SNAPSHOT" $MAVEN_SETTINGS_FILE
sed -i~ "/<servers>/ a$SERVER_LINK_TIME_ARTIFACTORY" $MAVEN_SETTINGS_FILE