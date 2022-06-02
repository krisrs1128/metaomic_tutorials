#!/usr/bin/env bash

export db_path=/staging/ksankaran/databases

cp $db_path/full_chocophlan.v296_201901b.tar.gz .
cp $db_path/full_mapping_v201901b.tar.gz .
cp $db_path/uniref90_annotated_v201901b_full.tar.gz .

tar -zxvf full_chocophlan.v296_201901b.tar.gz
tar -zxvf full_mapping_v201901b.tar.gz
tar -zxvf uniref90_annotated_v201901b_full.tar.gz

export f=$(sed -n "$id p" SRR_Acc_List.txt)
prefetch $f
fastq-dump $f

# use the previously downloaded databases
humann_config --update database_folders nucleotide chocophlan
humann_config --update database_folders protein uniref
humann_config --update database_folders pathways metacyc

humann -i ${f}.fastq -o ${f}_processed
tar -zcvf ${f}_processed ${f}.tar.gz

# these are the commands for downloading the files that were passed as input above
#humann_databases --download chocophlan full $db_path --update-config yes
#humann_databases --download uniref uniref90_diamond $db_path --update-config yes
#humann_databases --download utility_mapping full $db_path --update-config yes
