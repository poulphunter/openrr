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
* [samtools] - Pre and post processing   
* [hisat2] - Alignment  
* [bedtools] - Consensus Genome and Variant calling   
* [bcftools] - Consensus Genome and Variant calling   
* [Varscan] - Consensus Genome and Variant calling  
* [seqtk] - Consensus Genome and Variant calling  
* [Quast] - Assembly evaluation and Statistics   
* [SPAdes] - de novo Genome assembly  
* [MEGAHIT] - de novo Genome assembly   
* [Krona] - Evaluation of species diversity and Visualization   
* [Kraken2] - Evaluation of species diversity and Visualization  
* [MegaX-CC] - Phylogenetic analysis   
* [mafft] - Phylogenetic analysis   
* [fasttree] - Phylogenetic analysis   
* [FigTree] - Phylogenetic analysis   
* [BMGE] - Block Mapping and Gathering with Entropy   
  
* system utils like : time htop screen nano curl git  
  

## Build from Dockerfile  

`docker build -t poulphunter/openrr .`
