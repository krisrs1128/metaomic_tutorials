#!/usr/bin/env bash

# upgrade databases (but where are they on the docker image?)
humann_databases --download chocophlan full /path/to/databases --update-config yes
humann_databases --download uniref uniref90_diamond /path/to/databases --update-config yes
humann_databases --download utility_mapping full /path/to/databases --update-config yes

tar -zxvf all_data.tar.gz
for f in *.fastq; do
  humann --input $f --output $f_processed
done
