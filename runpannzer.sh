#!/bin/bash

#SBATCH --mail-type=end,fail
#SBATCH --job-name="pannzer"
#SBATCH --nodes=1
#SBATCH --cpus-per-task=12
#SBATCH --time=24:00:00
#SBATCH --mem=30G
#SBATCH --partition=pcourse80

NAME=$1

#try pannzer: http://ekhidna2.biocenter.helsinki.fi/sanspanz/

#Pannzer Annote directly
#python ~/softs/SANSPANZ.3/runsanspanz.py -R -o ",DE.out,GO.out,anno.out" -i genepred.aa
mkdir /data/users/$USER/Annotation
cd /data/users/$USER/Annotation
cp /data/users/tagaoglu/BC7107_20/SandFly/MAKER2/allprot.fa .
cp /data/users/tagaoglu/BC7107_20/SandFly/MAKER2/asm_hifiasm.p_ctg.purged.all.gff .

#SANS Annote
python3 /home/tagaoglu/softs/SANSPANZ.3/runsanspanz.py -R -m SANS -i allprot.fa -o ${NAME}.tab
#followed by Pannzer 
python3 /home/tagaoglu/softs/SANSPANZ.3/runsanspanz.py -R -m Pannzer -i ${NAME}.tab -f tab -o ",DE.out1,GO.out1,anno.out1"
#convert to html don't forget title!
perl /home/tagaoglu/softs/SANSPANZ.3/anno2html.pl "Ppapatasi" argot < anno.out1 > ${NAME}_predictions.html
