# openrr  

## How to use    
  
`docker pull poulphunter/openrr:latest`
  
To use mafft from `NCBI_sequences.fasta` to `NCBI_sequences_aligned.fasta`  
With this example fasta file is in a mounted directory from host: `/home/db/` 
source and destination is mounted in the same directory to avoid confusion.   
`docker run --mount type=bind,source=/home/db/,target=/home/db/ -i -t poulphunter/openrr:latest mafft --auto --thread 8 -s /home/db/NCBI_sequences.fasta > /home/db/NCBI_sequences_aligned.fasta`  
  
## Tools availables  
  
* fastqc  
* trimmomatic  
* samtools  
* hisat2  
* bedtools  
* bcftools  
* seqtk  
* mafft  
* fasttree  
* Quast  
* MegaX-CC  
* SPAdes  
* MEGAHIT  
* Krona  
* Varscan  
* Kraken2  
* FigTree  
* BMGE - Block Mapping and Gathering with Entropy   
  
* system utils like : time htop screen nano curl git  
  

## Build from Dockerfile  

`docker build -t poulphunter/openrr .`
