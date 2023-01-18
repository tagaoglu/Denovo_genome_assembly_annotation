# Pipeline for De novo genome assembly and comparative genomics of Tsetse fly genome

Below you can find descriptions of the scripts in this repository:

* **all required modules**              
module.sh




## Summary of the goals of this project:
- Assemble de novo a SandFly genome with PacBio HiFi reads using various software
- Purge haplotigs to avoid genome duplication
- Compare assemblies with QUAST, BUSCO, Bandage, select best for annotation
- Compare purged vs non-purged with DOT, identify possible bacterial contaminant
- Gene prediction with MAKER2 and functional annotation with Pannzer
- Search for genes/proteins involved in hematophagy (blood feeding)
- Compare with data obtained by PacBio (Korlach et al., 2020).
