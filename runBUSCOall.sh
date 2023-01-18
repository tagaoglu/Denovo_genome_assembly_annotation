#!/bin/bash

#SBATCH --mail-type=end,fail
#SBATCH --job-name="BUSCO"
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --time=3:00:00
#SBATCH --mem=30G
#SBATCH --partition=pcourse80

cd /data/users/$USER/Compare_asm
mkdir augustus

for k in `ls *.fasta`
do
y=${k%.fasta}
sbatch /data/users/tagaoglu/BC7107_20/scripts/runBUSCO.slurm  ${y##*/}
done

echo "BUSCO launched"
