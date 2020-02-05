#!/usr/bin/env bash
conda create -n intervene_env
conda install -c bioconda intervene
conda info --envs
source activate intervene_env

# conda deactivate
