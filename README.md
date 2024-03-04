# RNA-Seq-analysis
[![Snakemake](https://img.shields.io/badge/snakemake-≥8.5.3-brightgreen.svg?style=flat)](https://snakemake.readthedocs.io)
A workflow made with snakemake to analyse differential gene expression.

## Contents


## Description
RNA-Seq-analysis is an open software workflow using [snakmeake](https://snakemake.github.io/) to
analyze clinical data following the procedure of, the STAR Protocol, [Analysis workflow of publicly
available RNA-sequencing datasets](https://doi.org/10.1016/j.xpro.2021.100478).

## Requirements

Ensure you have the required dependencies:
- mamba >= 1.5.5 (alternatively conda >= 23.11.0)
- a environment that has snakemake installed as specified [here](https://snakemake.readthedocs.io/en/stable/getting_started/installation.html)
- a stable internet connection

## Installation

1. Clone this repository via:
    ```terminal
    git clone https://github.com/ToLeWeiss/RNA-Seq-analysis.git --depth 1
    ```

2. Change the [config](https://github.com/ToLeWeiss/RNA-Seq-analysis/tree/master/config/config.yaml) 
   if necessary

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
    you can specify your preferred number of cores yourself in the below code it is set to 2,
    which should be ok for most systems.
    ```terminal
    snakemake --use-conda --cores 2
    ```

**OPTIONAL**

5. Generate a report from the executed workflow
    if you want to generate a web report, after the workflow has run, you can generate one as follows:
    ```terminal
    snakemake --report report.html
    ```
    If you want to change the text from the report you can go to the [report directory](https://github.com/ToLeWeiss/RNA-Seq-analysis/tree/master/workflow/report)
    and change the respective *.rst file.

![Image of the DAG(Directed Acyclic Graph)](https://github.com/ToLeWeiss/RNA-Seq-analysis/blob/master/dag.svg)

![Image of the respective rules with input and output files](https://github.com/ToLeWeiss/RNA-Seq-analysis/blob/master/filegraph.svg)


## References

**Snakemake**

- [Mölder, F., Jablonski, K.P., Letcher, B., Hall, M.B., Tomkins-Tinch, C.H., Sochat, V., Forster, J., Lee, S., 
  Twardziok, S.O., Kanitz, A., Wilm, A., Holtgrewe, M., Rahmann, S., Nahnsen, S., Köster, J., 
  2021. Sustainable data analysis with Snakemake. F1000Res 10, 33.](https://doi.org/10.12688/f1000research.29032.1)

