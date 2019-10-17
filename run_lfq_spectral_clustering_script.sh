#!/bin/sh
#SBATCH --account=cbio
#SBATCH --partition=ada
#SBATCH --nodes=1 --ntasks=30
#SBATCH --time=40:00:00
#SBATCH --job-name="trim_run" 
#SBATCH --mail-user=oknjav001@myuct.ac.za
#SBATCH --mail-type=END,FAIL

fasta=/scratch/oknjav001/psm_identification/protein_database/uniprot_human_2018.fasta
mgf=/scratch/oknjav001/psm_identification/mgf_reconversion_BAL

cd /scratch/oknjav001/psm_identification/nf-workflows/lfq-clustering

# This pipeline was adapted from [github](https://github.com/javanOkendo/nf-workflows/tree/master/lfq-clustering) and it is used for clustering of the LFQ spectra using two pass search engines; MSGFplus and X!tandem

#The following line works pretty well on the real data
nextflow run -resume lfq-clustering.nf --prec_rol 20 --frag_tol 0.5 --mc 2 --min_ident 2 --min_ratio 0.7 --raw_dir/scratch/oknjav001/psm_identification/mgf_reconversion_BAL --fasta_files /scratch/oknjav001/psm_identification/protein_database/uniprot_human_2018.fasta

