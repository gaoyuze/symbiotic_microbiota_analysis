# symbiotic_microbiota_analysis

This repository contains pipeline associated with **Herpetofaunal microbial communities exhibit host-species distinguishability across body sites, but with different signatures of phylosymbiosis**. Scripts are numbered and must be run in order. 

## Environment Setup Before Execution

```shell
conda env create -n qiime2-2023.7 --file qiime2-2023.7-py38-linux-conda.yml

conda install -c bioconda -c conda-forge picrust2=2.5.2

cd q2-picrust2-2023.2_0/
pip install -e .

```

## Description of Files

- `1.build_path.ipynb`: Generates the absolute paths for all samples across projects to facilitate subsequent analysis.

- `2.prepare_for_denose.ipynb`: Performs quality filtering on 16S rRNA data.

- `3.merge_data.ipynb`: Merges feature tables and representative sequences from each project.

- `4.average_composition.ipynb`:  Aggregates feature tables to the specified taxonomic level.

- `5.alpha_diversity.ipynb`: Calculates alpha diversity

- `6.function.ipynb`: Function analysis . Run the following script to perform the functional analysis.

  ```shell
  chmod +x 6.function.sh
  nohup ./6.function.sh > function.log 2>&1 &
  ```
  
  

- `7.beta_diversity.ipynb`: Calculates beta diversity.
