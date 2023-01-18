# Pipeline for De novo genome assembly and comparative genomics of Tsetse fly genome

Below you can find descriptions of the scripts in this repository:

* **all required modules**              
module.sh

* **Predict genes with MAKER2**    
runMAKER.sh

* **Functional annotation with PANNZER**     
runpannzer.sh

* **Search for genes in the proteome (using allprot.fa)**
module add Blast/ncbi-blast/2.10.1+
makeblastdb -in allprot.fa -dbtype prot
blastp -query <a protein file.fa> -db allprot.fa


## Summary of the goals of this project:
- Assemble de novo a SandFly genome with PacBio HiFi reads using various software
- Purge haplotigs to avoid genome duplication
- Compare assemblies with QUAST, BUSCO, Bandage, select best for annotation
- Compare purged vs non-purged with DOT, identify possible bacterial contaminant
- Gene prediction with MAKER2 and functional annotation with Pannzer
- Search for genes/proteins involved in hematophagy (blood feeding)
- Compare with data obtained by PacBio (Korlach et al., 2020).
