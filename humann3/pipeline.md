
Some links,

* https://github.com/biobakery/biobakery/wiki/humann3
* https://github.com/biobakery/humann

```
humann --input data/demo.fastq.gz --output data/demo_fastq
```

> using translated search alone can emulate HUMAnN 1.0 output or be carried out
> even for very novel or unusual microbial communities (i.e. those with few
> reference genomes available).

Maybe use only translated search for vaginal microbiome?

Regrouping to MetaCyc Rxn reaction abundances.

```
humann_regroup_table --input demo_fastq/demo_genefamilies-cpm.tsv \
    --output demo_fastq/rxn-cpm.tsv --groups uniref90_rxn
```

Renaming to something more interpretable,

```
humann_rename_table --input demo_fastq/rxn-cpm.tsv \ # assuming table from previous
    --output demo_fastq/rxn-cpm-named.tsv --names metacyc-rxn
```

If we want to run on many fasta files (and then merge into a unified table)

````
for f in *.fasta; do humann -i $f -o output_name; done
humann_join_tables -i output_name -o output_name_genefamilies.tsv --file_name genefamilies
```

If we want to upgrade various databases,

```
humann_databases --download chocophlan full /path/to/databases --update-config yes
humann_databases --download uniref uniref90_diamond /path/to/databases --update-config yes
humann_databases --download utility_mapping full /path/to/databases --update-config yes
```

To find the paths...

### Example output

```
Running metaphlan ........

Found g__Bacteroides.s__Bacteroides_dorei : 57.96% of mapped reads
Found g__Bacteroides.s__Bacteroides_vulgatus : 42.04% of mapped reads

Total species selected from prescreen: 2

Selected species explain 100.00% of predicted community composition


Creating custom ChocoPhlAn database ........


Running bowtie2-build ........


Running bowtie2 ........

Total bugs from nucleotide alignment: 2
g__Bacteroides.s__Bacteroides_vulgatus: 1195 hits
g__Bacteroides.s__Bacteroides_dorei: 1260 hits

Total gene families from nucleotide alignment: 545

Unaligned reads after nucleotide alignment: 88.3095238095 %


Running diamond ........


Aligning to reference database: uniref90_demo_prots_v201901b.dmnd

Total bugs after translated alignment: 3
g__Bacteroides.s__Bacteroides_vulgatus: 1195 hits
g__Bacteroides.s__Bacteroides_dorei: 1260 hits
unclassified: 1017 hits

Total gene families after translated alignment: 588

Unaligned reads after translated alignment: 83.6000000000 %


Computing gene families ...

Computing pathways abundance and coverage ...

Output files created:
/Users/ksankaran/Documents/tutorials/metaomic_tutorials/humann3/data/demo_fastq/demo_genefamilies.tsv
/Users/ksankaran/Documents/tutorials/metaomic_tutorials/humann3/data/demo_fastq/demo_pathabundance.tsv
/Users/ksankaran/Documents/tutorials/metaomic_tutorials/humann3/data/demo_fastq/demo_pathcoverage.tsv
```
