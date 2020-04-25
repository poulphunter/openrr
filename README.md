# openrr  

## How to use    
  
`docker pull poulphunter/openrr:latest`
  
To use mafft from `NCBI_sequences.fasta` to `NCBI_sequences_aligned.fasta`  
With this example fasta file is in a mounted directory from host: `/home/db/` 
source and destination is mounted in the same directory to avoid confusion.   
`docker run --mount type=bind,source=/home/db/,target=/home/db/ -i -t poulphunter/openrr:latest mafft --auto --thread 8 -s /home/db/NCBI_sequences.fasta > /home/db/NCBI_sequences_aligned.fasta`  
  
## Tools availables  
  
* [fastqc](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/) - Quality check   
* [trimmomatic](http://www.usadellab.org/cms/index.php?page=trimmomatic) - Trimming and Adapter Removal  
* [samtools](http://www.htslib.org/) - Pre and post processing   
* [hisat2](https://ccb.jhu.edu/software/hisat2/manual.shtml) - Alignment  
* [bedtools](https://bedtools.readthedocs.io/en/latest/) - Consensus Genome and Variant calling   
* [bcftools](http://www.htslib.org/doc/bcftools.html) - Consensus Genome and Variant calling   
* [Varscan](http://dkoboldt.github.io/varscan/) - Consensus Genome and Variant calling  
* [seqtk](https://bioinf.shenwei.me/seqkit/) - Consensus Genome and Variant calling  
* [Quast](http://quast.sourceforge.net/) - Assembly evaluation and Statistics   
* [SPAdes](http://cab.spbu.ru/software/spades/) - de novo Genome assembly  
* [MEGAHIT](http://www.metagenomics.wiki/tools/assembly/megahit) - de novo Genome assembly   
* [Krona](https://github.com/marbl/Krona/wiki) - Evaluation of species diversity and Visualization   
* [Kraken2](https://ccb.jhu.edu/software/kraken2/) - Evaluation of species diversity and Visualization  
* [MegaX-CC](https://www.megasoftware.net) - Phylogenetic analysis   
* [mafft](https://mafft.cbrc.jp/alignment/software/) - Phylogenetic analysis   
* [fasttree](http://microbesonline.org/fasttree/) - Phylogenetic analysis   
* [FigTree](http://tree.bio.ed.ac.uk/software/figtree/) - Phylogenetic analysis   
* [BMGE](https://research.pasteur.fr/fr/software/bmge-block-mapping-and-gathering-with-entropy/) ( Block Mapping and Gathering with Entropy) - Phylogenetic analysis    
  
* system utils like : time htop screen nano curl git  
  

## Build from Dockerfile  

`docker build -t poulphunter/openrr .`
