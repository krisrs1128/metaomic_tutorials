FROM biobakery/humann:3.0.0

WORKDIR /home
RUN wget http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.4.1/sratoolkit.2.4.1-ubuntu64.tar.gz
RUN tar xzvf sratoolkit.2.4.1-ubuntu64.tar.gz
RUN export PATH=$PATH:sratoolkit.2.4.1-ubuntu64/bin

RUN humann_databases --download chocophlan full /usr/local/lib/python3.6/dist-packages/humann/data/ --update-config yes
RUN humann_databases --download uniref uniref90_diamond /usr/local/lib/python3.6/dist-packages/humann/data/ --update-config yes
RUN humann_databases --download utility_mapping full /usr/local/lib/python3.6/dist-packages/humann/data/ --update-config yes
