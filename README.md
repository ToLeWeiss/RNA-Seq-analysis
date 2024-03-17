# RNA-Seq-analysis
[![Snakemake](https://img.shields.io/badge/snakemake-≥8.5.3-brightgreen.svg?style=flat)](https://snakemake.readthedocs.io)
<br/>
A workflow made with snakemake to analyse differential gene expression.

## Contents

- [Description](https://github.com/ToLeWeiss/RNA-Seq-analysis/tree/master?tab=readme-ov-file#description)
- [Requirements](https://github.com/ToLeWeiss/RNA-Seq-analysis/tree/master?tab=readme-ov-file#requirements)
- [Installation and application](https://github.com/ToLeWeiss/RNA-Seq-analysis/tree/master?tab=readme-ov-file#Installation-and-application)
- [References](https://github.com/ToLeWeiss/RNA-Seq-analysis/tree/master?tab=readme-ov-file#references)

## Description
RNA-Seq-analysis is an open software workflow using [snakmeake](https://snakemake.github.io/) to
analyze clinical data following the procedure of, the STAR Protocol, [Analysis workflow of publicly
available RNA-sequencing datasets](https://doi.org/10.1016/j.xpro.2021.100478).
The two graphics below show the different rules in a graph and their respective files that will be in- and output.

![Image of the respective rules with input and output files](https://github.com/ToLeWeiss/RNA-Seq-analysis/blob/master/filegraph.svg)
![Image of the DAG(Directed Acyclic Graph)](https://github.com/ToLeWeiss/RNA-Seq-analysis/blob/master/dag.svg)

## Requirements

Ensure you have the required dependencies:
- mamba >= 1.5 (alternatively conda >= 23.11)
- an environment that has snakemake installed as specified [here](https://snakemake.readthedocs.io/en/stable/getting_started/installation.html)
- a stable internet connection

## Installation and application

1. Clone this repository via:
    ```terminal
    git clone https://github.com/ToLeWeiss/RNA-Seq-analysis.git --depth 1
    ```

2. Change the [config](https://github.com/ToLeWeiss/RNA-Seq-analysis/tree/master/config/config.yaml) 
   if necessary (i.e. if you want to use a different GEO dataset or analyze a different set of genes)

3. Activate the base environment and your snakemake environment
    <br/>
    **If you use mamba**:
    ```terminal
    mamba activate base && mamba activate <your snakemake environment>
    ```

    **If you use conda**:
    ```terminal
    conda activate base && conda activate <your snakemake environment>
    ```

4. Run the workflow:
    you can specify your preferred number of cores yourself in the below code it is set to 1,
    which should be ok for all systems.
    ```terminal
    snakemake --use-conda --cores 1
    ```

**OPTIONAL**

5. Generate a report from the executed workflow
    if you want to generate a web report, after the workflow has run, you can generate one as follows:
    ```terminal
    snakemake --report report.html
    ```
    If you want to change the text from the report you can go to the [report directory](https://github.com/ToLeWeiss/RNA-Seq-analysis/tree/master/workflow/report)
    and change the respective *.rst file.

## References

**STARS Protocol**

- [Sanchis, P., Lavignolle, R., Abbate, M., Lage-Vickers, S., Vazquez, E., Cotignola, J., … Gueron, G. (2021).
  Analysis workflow of publicly available RNA-sequencing datasets. STAR Protocols, 2(2), 100478.](https://doi.org/10.1016/j.xpro.2021.100478)

**Original Paper**

- [Bizzotto, J., Sanchis, P., Abbate, M., Lage-Vickers, S., Lavignolle, R., Toro, A., … Gueron, G. (2020). 
  SARS-CoV-2 Infection Boosts MX1 Antiviral Effector in COVID-19 Patients. iScience, 23(10), 101585.](https://doi.org/10.1016/j.isci.2020.101585)

**Snakemake**

- [Mölder, F., Jablonski, K.P., Letcher, B., Hall, M.B., Tomkins-Tinch, C.H., Sochat, V., Forster, J., Lee, S., 
  Twardziok, S.O., Kanitz, A., Wilm, A., Holtgrewe, M., Rahmann, S., Nahnsen, S., Köster, J., 
  2021. Sustainable data analysis with Snakemake. F1000Res 10, 33.](https://doi.org/10.12688/f1000research.29032.1)

- [Snakemake on GitHub](https://github.com/snakemake/snakemake)

- [The snakemake website](https://snakemake.github.io/)

- [Documentation of Snakemake](https://snakemake.readthedocs.io/en/stable/index.html)

**R Packages**

- DESeq2
    - [Love MI, Huber W, Anders S (2014). “Moderated estimation of fold change and dispersion for RNA-seq data with DESeq2.” 
      Genome Biology, 15, 550](https://doi.org/10.1186/s13059-014-0550-8)

    - [The DESeq2 repository](https://code.bioconductor.org/browse/DESeq2/RELEASE_3_18/)

- ggplot2
    - H. Wickham. ggplot2: Elegant Graphics for Data Analysis. Springer-Verlag New York, 2016.

    - [The ggplot2 website](https://ggplot2.tidyverse.org/index.html)

    - [ggplot2 on GitHub](https://github.com/tidyverse/ggplot2/)

- GGally
    - Schloerke B, Cook D, Larmarange J, Briatte F, Marbach M, Thoen E, Elberg A, Crowley J (2024). GGally: Extension to 'ggplot2'.

    - [The GGally website](https://ggobi.github.io/ggally/)

    - [GGally on GitHub](https://github.com/tidyverse/ggplot2/)

- canvasXpress
    - [The canvasXpress website](https://www.canvasxpress.org/)

    - [canvasXpress on GitHub](https://github.com/neuhausi/canvasXpress)

- factoextra 
    - [The factoextra website](https://rpkgs.datanovia.com/factoextra/index.html)

    - [factoextra on GitHub](https://github.com/kassambara/factoextra/)

- clinfun
    - Seshan V, Whiting K (2023). clinfun: Clinical Trial Design and Data Analysis Functions. R package version 1.1.1.

    - [The clinfun website](https://veseshan.github.io/clinfun/index.html)

    - [clinfun on GitHub](https://github.com/veseshan/clinfun)

- GEOquery
    - [Davis S, Meltzer P (2007). “GEOquery: a bridge between the Gene Expression Omnibus (GEO) and BioConductor.” Bioinformatics, 14, 1846–1847.](https://doi.org/doi:10.18129/B9.bioc.GEOquery)

    - [The GEOquery repository](https://code.bioconductor.org/browse/GEOquery/RELEASE_3_18/)

**Pandoc**
- [MacFarlane, J., Krewinkel, A., & Rosenthal, J. Pandoc [Computer software]](https://github.com/jgm/pandoc)

- [The Pandoc website](https://pandoc.org/index.html)

