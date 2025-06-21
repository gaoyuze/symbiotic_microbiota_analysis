#!/bin/bash 
source /home/gaoyuze/anaconda3/etc/profile.d/conda.sh

conda activate qiime2-2023.7

cd results/merged/

qiime picrust2 full-pipeline --i-table merged_table_clean.qza \
  --i-seq merged_rep_seqs.qza --output-dir q2-picrust2_output --p-threads 12 --p-hsp-method pic --p-max-nsti 2 --verbose
cd q2-picrust2_output
qiime tools export --input-path pathway_abundance.qza --output-path pathway_abundance
biom convert -i pathway_abundance/feature-table.biom -o pathway_abundance/pathway_abundance.txt --to-tsv
sed -i "1d" pathway_abundance/pathway_abundance.txt
/home/gaoyuze/symbiotic_microbiota_analysis/picrust2-2.5.2/scripts/add_descriptions.py -i pathway_abundance/pathway_abundance.txt \
  -m METACYC -o pathway_abundance/path_abun_unstrat_descrip.tsv
cd ..
qiime tools export \
  --input-path merged_table_clean.qza \
  --output-path table_clean