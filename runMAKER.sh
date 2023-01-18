#!/bin/bash

#SBATCH --mail-type=end,fail
#SBATCH --job-name="MAKER"
#SBATCH --nodes=1
#SBATCH --cpus-per-task=24
#SBATCH --time=120:00:00
#SBATCH --mem=25G
#SBATCH --partition=pall


module add SequenceAnalysis/GenePrediction/augustus/3.2.3
mkdir augustus
cp -r /software/SequenceAnalysis/GenePrediction/augustus/3.2.3/config ./augustus/config
export AUGUSTUS_CONFIG_PATH="./augustus/config/"

module add SequenceAnalysis/GenePrediction/maker/2.31.9

maker -fix_nucleotides maker_opts.ctl maker_bopts.ctl maker_exe.ctl

#then merge gffs
gff3_merge -n -d asm_hifiasm.p_ctg.purged.maker.output/asm_hifiasm.p_ctg.purged_master_datastore_index.log

#get protein fasta
find asm_hifiasm.p_ctg.purged.maker.output/*/*/* -name *maker.proteins.fasta -exec cat {} >> allprot.fa \;
