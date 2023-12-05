#!/bin/bash -l
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --array=100-353
#SBATCH --output=exelogs/_site_descriptor_.%A_%a.out
#SBATCH --error=exelogs/_site_descriptor_.%A_%a.err

srun singularity exec -B /mnt/data/:/mnt/data/ /mnt/data/WD/fingerprint/masif_seed.sif ./predict_site.sh -l in/x${SLURM_ARRAY_TASK_ID} 
srun singularity exec -B /mnt/data/:/mnt/data/ /mnt/data/WD/fingerprint/masif_seed.sif ./compute_descriptors.sh -l in/x${SLURM_ARRAY_TASK_ID}
