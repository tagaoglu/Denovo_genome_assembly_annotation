#!/bin/bash

#SBATCH --mail-type=end,fail
#SBATCH --job-name="DOT"
#SBATCH --nodes=1
#SBATCH --cpus-per-task=12
#SBATCH --time=3:00:00
#SBATCH --mem=50G
#SBATCH --partition=pcourse80

source /data/users/tagaoglu/BC7107_20/scripts/module.sh
cd /data/users/$USER/Compare_asm

nucmer -t 12 hifiasm.p_ctg.purged.fasta hifiasm.p_ctg.fasta -p hifiasm_purgevsraw
DotPrep.py --delta hifiasm_purgevsraw.delta --out hifiasm_purgevsraw_dot
