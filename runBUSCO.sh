#!/bin/bash

#SBATCH --mail-type=end,fail
#SBATCH --job-name="BUSCO"
#SBATCH --nodes=1
#SBATCH --cpus-per-task=24
#SBATCH --time=3:00:00
#SBATCH --mem=30G
#SBATCH --partition=pcourse80

NAME=$1

#run BUSCO on the best corrected assembly (smartdenovo corrected with pilon)
#validate with BUSCO
module add UHTS/Analysis/busco/3.0.2
module add Blast/ncbi-blast/2.7.1+
module add SequenceAnalysis/HMM-Profile/hmmer/3.1b2
module add SequenceAnalysis/GenePrediction/augustus/3.2.3

cp -r /software/SequenceAnalysis/GenePrediction/augustus/3.2.3/config ./augustus/config
export AUGUSTUS_CONFIG_PATH="./augustus/config/"

python /software/UHTS/Analysis/busco/3.0.2/bin/run_BUSCO.py -i ${NAME}.fasta -o ${NAME}_diptera_all -l /data/users/tagaoglu/BC7107_20/SandFly/BUSCO/diptera_odb9/ -m genome -c 24


#python /software/UHTS/Analysis/busco/3.0.2/bin/run_BUSCO.py -i purge_dups/asm_hifiasm.p_ctg/seqs/asm_hifiasm.p_ctg.purged.fa -o purge_dups_arthropoda_all -l ./BUSCO/arthropoda_odb9/  -m genome -c 24

