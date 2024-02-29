# RNA-Seq-analysis
A workflow made with snakemake to analyse differential gene expression.

## Contents


## Description
RNA-Seq-analysis is an open software workflow using (snakmeake)[https://snakemake.github.io/] to 
analyze clinical data following the procedure of the STAR Protocol, (Analysis workflow of publicly 
available RNA-sequencing datasets)[https://doi.org/10.1016/j.xpro.2021.100478].

## Requirements

Ensure you have the required dependencies:
- mamba >= 1.5.5 (alternatively conda >= 23.11.0)
- a environment that has (snakemake installed)[https://snakemake.readthedocs.io/en/stable/getting_started/installation.html]

## Installation

1. Clone this repository via:
`git clone https://github.com/ToLeWeiss/RNA-Seq-analysis.git`

2. Change the (config)[https://github.com/ToLeWeiss/RNA-Seq-analysis/tree/master/config] if necessary

3. Activate the base environment and your snakemake environment via:
**If you use mamba**:
`mamba activate base && mamba activate <your snakemake environment>`

**If you use conda**
`conda activate base && conda activate <your snakemake environment`

4. Run your workflow:
you can specify your preferred number of cores yourself in the below code it is set to 2,
which should be ok for most systems.
`snakemake --use-conda --cores 2`


![Image of the DAG(Directed Acyclic Graph)](https://github.com/ToLeWeiss/RNA-Seq-analysis/blob/master/dag.svg)

![Image of the respective rules with input and output files](https://github.com/ToLeWeiss/RNA-Seq-analysis/blob/master/filegraph.svg)

