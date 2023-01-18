#!/bin/bash

#SBATCH --mail-type=fail
#SBATCH --job-name="asm"
#SBATCH --nodes=1
#SBATCH --cpus-per-task=24
#SBATCH --time=24:00:00
#SBATCH --mem=40G
#SBATCH --partition=pcourse80

source /data/users/tagaoglu/BC7107_20/scripts/module.sh

XX=$1

#create and go to the TP directory
mkdir asm_${XX}
cd asm_${XX}

#link the reference genome and the reads locally
ln -s /data/users/tagaoglu/BC7107_20/reads/${XX}.fastq . 
ln -s /data/users/tagaoglu/BC7107_20/reads/${XX}.fasta . 
#verify that your files are in your directory (ls -l)

#check quality of your data with fastqc
fastqc -t 16 ${XX}.fastq

#optional view results from your public-html or download the html file to your local machine
#scp student@168.176.54.15:?? ~/Desktop/
#(use winscp on windows)

#assemble with hifiasm
hifiasm -o asm_hifiasm -t40 ${XX}.fasta 2> hifiasm.log
perl -ane 'if ($F[0]eq"S") { print ">".$F[1]."\n".$F[2]."\n"}' asm_hifiasm.p_ctg.gfa > asm_hifiasm.p_ctg.fa

#or with Flye-2.8 you must change the memory requirement to --mem=250G
#export PATH=/home/tagaoglu/softs/Flye-2.8-1/bin:$PATH;
#module add UHTS/Analysis/minimap2/2.17
#flye --pacbio-hifi ${XX} --out-dir asm_flye  --genome-size 350m --threads 40


#for purge dups
#first install software
#git clone https://github.com/dfguan/purge_dups.git
#cd purge_dups/src && make
#cd ..
#git clone https://github.com/dfguan/runner.git
#cd runner && python3 setup.py install --user

#~/softs/purge_dups/scripts/pd_config.py asm_hifiasm.p_ctg.fa inputpb.fofn 
#ln -s /data/users/tagaoglu/BC7107_20/scripts/inputpb.fofn .
#ln -s /data/users/tagaoglu/BC7107_20/scripts/config.json .
#module add UHTS/Analysis/minimap2/2.17
#python3 /home/tagaoglu/softs/purge_dups/scripts/run_purge_dups.py -p slurm config.json /home/tagaoglu/softs/purge_dups/bin sandfly
