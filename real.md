

We will want to download the raw metagenomic and metatranscriptomic data from
[PRJNA797778](https://www.ncbi.nlm.nih.gov/Traces/study/?query_key=2&WebEnv=MCID_629243db1e2bb80ce2975572&o=acc_s%3Aa)

```
while read f; do
  prefetch $f;
  fastq-dump $f;
done < SRR_Acc_List.txt
```

Notice that we had to use the `fastq-dump` tool from this
[toolkit](https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=software), and
permissions issues had to be resolved by going to System Preferences > Security > General.

```
export line=1
export f=$(sed -n "$line p" SRR_Acc_List.txt)
prefetch $f
fastq-dump $f
humann -i ${f}.fastq -o ${f}_processed
```
