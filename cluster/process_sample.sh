#!/usr/bin/env bash

tar -zxvf humann_databases.tar.gz
tar -zxvf databases/full_chocophlan.v296_201901b.tar.gz
tar -zxvf databases/full_mapping_v201901b.tar.gz
tar -zxvf databases/uniref90_annotated_v201901b_full.tar.gz

export f=$(sed -n "$id p" SRR_Acc_List.txt)
prefetch $f
fastq-dump $f

# use the previously downloaded databases
export db_path=/staging/ksankaran/databases
humann_config --update database_folders nucleotide $db_path/chocophlan
humann_config --update database_folders protein $db_path/uniref
humann_config --update database_folders pathways $db_path/metacyc

humann -i ${f}.fastq -o ${f}_processed
tar -zcvf ${f}_processed ${f}.tar.gz

# these are the commands for downloading the files that were passed as input above
#humann_databases --download chocophlan full $db_path --update-config yes
#humann_databases --download uniref uniref90_diamond $db_path --update-config yes
#humann_databases --download utility_mapping full $db_path --update-config yes
