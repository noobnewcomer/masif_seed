#!/bin/bash
#SBATCH --nodes 1
#SBATCH --partition=compute
#SBATCH --ntasks-per-node 1
#SBATCH --cpus-per-task 1
#SBATCH --array=0-11
#SBATCH --output=exelogs/_masif_precompute.%A_%a.out
#SBATCH --error=exelogs/_masif_precompute.%A_%a.err

srun singularity exec -B /mnt/data/:/mnt/data/ ../../../../masif_seed.sif ./data_extract_helix.sh ${SLURM_ARRAY_TASK_ID}
