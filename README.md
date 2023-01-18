# Pipeline for De novo genome assembly and comparative genomics of Tsetse fly genome

Below you can find descriptions of the scripts in this repository:

### De novo Genome Assembly  

* **QC of the reads and De novo genome assembly**      
asmdoitall.sh

* **Check assembly with QUAST vs other assemblies**       
runQUAST.sh

* **Purge haplotigs with purge_dups and verify effect with BUSCO**       
???

* **Check assembly completeness with BUSCO vs other assemblies**       
runBUSCOall.sh

* **Compare denovo assembly vs purged assembly with DOT**      
runDOT.sh


### Genome Annotation   
   
* **Predict genes with MAKER2**      
runMAKER.sh

* **Functional annotation with PANNZER**        
runpannzer.sh

* **Search for particular genes/proteins in the proteome with BLAST (using allprot.fa)**    
module add Blast/ncbi-blast/2.10.1+     
makeblastdb -in allprot.fa -dbtype prot     
blastp -query <a protein file.fa> -db allprot.fa      

        
## Summary of the goals of this project:
- Performing quality control of reads using FastQC and MultiQC  
- Assemble de novo a SandFly genome with PacBio HiFi reads using hifiasm
- Purge haplotigs to avoid genome duplication using purge_dups
- Compare assemblies with QUAST, BUSCO, Bandage, select best for annotation
- Compare purged vs non-purged with DOT, identify possible bacterial contaminant
- Gene prediction with MAKER2 
- Functional annotation with Pannzer
- Search for genes/proteins involved in hematophagy (blood feeding)
- Compare with data obtained by PacBio (Korlach et al., 2020).
