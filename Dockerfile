FROM debian:9.7
RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8
RUN apt-get -y upgrade
RUN apt-get update && apt-get install -y apt-utils
RUN apt-get update && apt-get install -y openssh-server
RUN apt-get install -y htop screen nano curl git-core git-gui git-doc git
RUN apt-get install -y build-essential module-assistant dkms
RUN apt-get install -y fastqc trimmomatic samtools hisat2 bedtools bcftools seqtk mafft
RUN apt-get install -y pkg-config libfreetype6-dev libpng-dev python-matplotlib

RUN cd /root && git clone https://github.com/dkoboldt/varscan.git

RUN cd /root && curl -L -O https://github.com/voutcn/megahit/releases/download/v1.2.9/MEGAHIT-1.2.9-Linux-x86_64-static.tar.gz && tar zvxf MEGAHIT-1.2.9-Linux-x86_64-static.tar.gz && rm MEGAHIT-1.2.9-Linux-x86_64-static.tar.gz

RUN cd /root && curl -L -O https://github.com/DerrickWood/kraken2/archive/master.zip && unzip master.zip && cd kraken2-master/ && ./install_kraken2.sh /usr/bin

RUN cd /root && git clone https://github.com/marbl/Krona.git && cd /root/Krona/KronaTools/ && ./install.pl
#RUN cd /root/Krona/KronaTools/ && mkdir taxonomy && ./updateTaxonomy.sh && ./updateAccessions.sh

RUN cd /root && curl -L -O http://cab.spbu.ru/files/release3.14.0/SPAdes-3.14.0-Linux.tar.gz && tar zvxf SPAdes-3.14.0-Linux.tar.gz && rm SPAdes-3.14.0-Linux.tar.gz

RUN apt-get install -y python-setuptools
RUN cd /root && git clone https://github.com/ablab/quast.git
RUN cd /root/quast && python setup.py install_full

EXPOSE 22
