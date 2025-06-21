#!/bin/bash
source /home/gaoyuze/anaconda3/etc/profile.d/conda.sh
conda activate qiime2-2023.7

base_dir=$(pwd)
source_dir="${base_dir}/projects_raw"
target_dir="${base_dir}/projects"
mkdir -p "$target_dir"

cd $source_dir

for project_dir in */; do
    source_project_dir="${source_dir}/${project_dir}"
    target_project_dir="${target_dir}/${project_dir}"
    mkdir -p "$target_project_dir"
    cd $project_dir
    for sample in *; do
        if [[ $sample == *_1.fastq.gz ]]; then
            sampleID="${sample%_*}"
            fastp -i ${sample} -I ${sampleID}_2.fastq.gz -Q -o ${target_project_dir}${sample} -O ${target_project_dir}${sampleID}_2.fastq.gz -h ${sampleID}.html -j ${sampleID}.json -w 16
        elif [[ $sample == *_2.fastq.gz ]]; then
            continue
        elif [[ $sample == *.fastq.gz ]]; then
            sampleID="${sample%_*}"
            fastp -i ${sample} -Q -o ${target_project_dir}${sample} -h ${sampleID}.html -j ${sampleID}.json -w 16
        fi
    done
    cd ..
    echo "$project_dir  Done!"
done