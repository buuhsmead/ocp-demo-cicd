#!/usr/bin/env bash

VERSION=2.2.195.redhat-000024

# S2I Camel Spring Boot (FIS 2.0)
# 2018/12/06


mvn org.apache.maven.plugins:maven-archetype-plugin:2.4:generate \
	-DarchetypeCatalog=https://maven.repository.redhat.com/ga/io/fabric8/archetypes/archetypes-catalog/${VERSION}/archetypes-catalog-${VERSION}-archetype-catalog.xml \
	-DarchetypeGroupId=org.jboss.fuse.fis.archetypes \
	-DarchetypeArtifactId=spring-boot-camel-xml-archetype \
	-DarchetypeVersion=${VERSION}

