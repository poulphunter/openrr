# docker build -t poulphunter/openrr .
FROM debian:9.7
RUN apt-get update && \
	apt-get -y upgrade && \
	export DEBIAN_FRONTEND=noninteractive && \
	apt-get install -y --no-install-recommends time htop screen nano curl git-core git-gui git-doc git pkg-config libfreetype6-dev libpng-dev  python-matplotlib python-setuptools gconf-service gconf2-common libdbus-glib-1-2 libgconf-2-4 libgtk2.0-0 libgtk2.0-bin apt-utils bzip2 make unzip g++ \
	fastqc trimmomatic samtools hisat2 bedtools bcftools seqtk mafft fasttree

# fastqc trimmomatic samtools hisat2 bedtools bcftools seqtk mafft
#RUN apt-get install -y --no-install-recommends fastqc trimmomatic samtools hisat2 bedtools bcftools seqtk mafft

# Quast
RUN cd /root && curl -L -o /root/quast.tar.bz2 https://sourceforge.net/projects/covfiles/files/openrr_v1/quast.tar.bz2/download && \
curl -L -o /root/quast.tar.bz2.md5 https://sourceforge.net/projects/covfiles/files/openrr_v1/quast.tar.bz2.md5/download && \
md5sum -c quast.tar.bz2.md5 && \
tar -xjvf ./quast.tar.bz2 && \
rm quast.tar.bz2 && \
rm quast.tar.bz2.md5 && \
cd /root/quast && git reset --hard HEAD && \
git pull && python setup.py install_full

# MegaX-CC
RUN cd /root && curl -L -o megax-cc_10.1.8-1_amd64.deb https://sourceforge.net/projects/covfiles/files/openrr_v1/megax-cc_10.1.8-1_amd64.deb/download \
&& cd /root && curl -L -o megax-cc_10.1.8-1_amd64.deb.md5 https://sourceforge.net/projects/covfiles/files/openrr_v1/megax-cc_10.1.8-1_amd64.deb.md5/download && md5sum -c megax-cc_10.1.8-1_amd64.deb.md5 \
&& dpkg -i /root/megax-cc_10.1.8-1_amd64.deb \
&& rm /root/megax-cc_10.1.8-1_amd64.deb && rm /root/megax-cc_10.1.8-1_amd64.deb.md5

# SPAdes
RUN cd /root && curl -L -o SPAdes-3.14.0-Linux.tar.gz https://sourceforge.net/projects/covfiles/files/openrr_v1/SPAdes-3.14.0-Linux.tar.gz/download \
&& cd /root && curl -L -o SPAdes-3.14.0-Linux.tar.gz.md5 https://sourceforge.net/projects/covfiles/files/openrr_v1/SPAdes-3.14.0-Linux.tar.gz.md5/download && md5sum -c SPAdes-3.14.0-Linux.tar.gz.md5 \
&& cd /root && tar -xzvf ./SPAdes-3.14.0-Linux.tar.gz && rm SPAdes-3.14.0-Linux.tar.gz && rm SPAdes-3.14.0-Linux.tar.gz.md5

# MEGAHIT
RUN cd /root && curl -L -o MEGAHIT-1.2.9-Linux-x86_64-static.tar.gz https://sourceforge.net/projects/covfiles/files/openrr_v1/MEGAHIT-1.2.9-Linux-x86_64-static.tar.gz/download \
&& cd /root && curl -L -o MEGAHIT-1.2.9-Linux-x86_64-static.tar.gz.md5 https://sourceforge.net/projects/covfiles/files/openrr_v1/MEGAHIT-1.2.9-Linux-x86_64-static.tar.gz.md5/download && md5sum -c MEGAHIT-1.2.9-Linux-x86_64-static.tar.gz.md5 \
&& cd /root && tar -xzvf ./MEGAHIT-1.2.9-Linux-x86_64-static.tar.gz && rm MEGAHIT-1.2.9-Linux-x86_64-static.tar.gz && rm MEGAHIT-1.2.9-Linux-x86_64-static.tar.gz.md5

# Krona
RUN cd /root && curl -L -o Krona.tar.bz2 https://sourceforge.net/projects/covfiles/files/openrr_v1/Krona.tar.bz2/download \
&& cd /root && curl -L -o Krona.tar.bz2.md5 https://sourceforge.net/projects/covfiles/files/openrr_v1/Krona.tar.bz2.md5/download && md5sum -c Krona.tar.bz2.md5 \
&& cd /root && tar -xjvf ./Krona.tar.bz2 && rm Krona.tar.bz2 && rm Krona.tar.bz2.md5 \
&& cd /root/Krona && git reset --hard HEAD &&  git pull \
&& cd /root/Krona/KronaTools/ && ./install.pl
#RUN cd /root/Krona/KronaTools/ && mkdir taxonomy && ./updateTaxonomy.sh && ./updateAccessions.sh

# Varscan
RUN cd /root && curl -L -o varscan.tar.bz2 https://sourceforge.net/projects/covfiles/files/openrr_v1/varscan.tar.bz2/download \
&& cd /root && curl -L -o varscan.tar.bz2.md5 https://sourceforge.net/projects/covfiles/files/openrr_v1/varscan.tar.bz2.md5/download && md5sum -c varscan.tar.bz2.md5 \
&& cd /root && tar -xjvf ./varscan.tar.bz2 && rm varscan.tar.bz2 && rm varscan.tar.bz2.md5 \
&& cd /root/varscan && git reset --hard HEAD &&  git pull

# Kraken2
RUN cd /root && curl -L -o kraken2-master.zip https://sourceforge.net/projects/covfiles/files/openrr_v1/kraken2-master.zip/download \
&& cd /root && curl -L -o kraken2-master.zip.md5 https://sourceforge.net/projects/covfiles/files/openrr_v1/kraken2-master.zip.md5/download && md5sum -c kraken2-master.zip.md5 \
&& cd /root && unzip ./kraken2-master.zip && rm kraken2-master.zip && rm kraken2-master.zip.md5 \
&& cd /root/kraken2-master && ./install_kraken2.sh /usr/bin

# FigTree
RUN cd /root && curl -L -o FigTree_v1.4.4.tgz  https://sourceforge.net/projects/covfiles/files/openrr_v1/FigTree_v1.4.4.tgz/download \
&& cd /root && curl -L -o FigTree_v1.4.4.tgz.md5 https://sourceforge.net/projects/covfiles/files/openrr_v1/FigTree_v1.4.4.tgz.md5/download && md5sum -c FigTree_v1.4.4.tgz.md5 \
&& cd /root && tar -xzvf ./FigTree_v1.4.4.tgz && rm FigTree_v1.4.4.tgz && rm FigTree_v1.4.4.tgz.md5

# BMGE - Block Mapping and Gathering with Entropy - ftp://ftp.pasteur.fr/pub/gensoft/projects/BMGE/
RUN cd /root && curl -L -o BMGE.jar  https://sourceforge.net/projects/covfiles/files/openrr_v1/BMGE.jar/download \
&& cd /root && curl -L -o BMGE.jar.md5 https://sourceforge.net/projects/covfiles/files/openrr_v1/BMGE.jar.md5/download && md5sum -c BMGE.jar.md5 \
&& cd /root && rm BMGE.jar.md5

RUN apt-get install -y curl grep sed dpkg && \
    TINI_VERSION=`curl https://github.com/krallin/tini/releases/latest | grep -o "/v.*\"" | sed 's:^..\(.*\).$:\1:'` && \
    curl -L "https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini_${TINI_VERSION}.deb" > tini.deb && \
    dpkg -i tini.deb && \
    rm tini.deb && \
    apt-get clean
ENTRYPOINT [ "/usr/bin/tini", "--" ]
CMD [ "/bin/bash" ]
