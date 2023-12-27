#!/bin/bash -l
#SBATCH --nodes=1
#SBATCH --gres=gpu:1
#SBATCH --partition=gpu
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --array=100-353
#SBATCH --output=exelogs/_site_descriptor_.%A_%a.out
#SBATCH --error=exelogs/_site_descriptor_.%A_%a.err

SINGULARITYENV_APPEND_PATH=/usr/local/cuda/bin SINGULARITYENV_LD_LIBRARY_PATH=/usr/local/cuda/lib64 srun singularity exec --nv -B /mnt/data:/mnt/data -B /usr/local/cuda:/usr/local/cuda /mnt/data/WD/fingerprint/masif_seed_gpu.sif ./predict_site.sh -l in/x${SLURM_ARRAY_TASK_ID}
SINGULARITYENV_APPEND_PATH=/usr/local/cuda/bin SINGULARITYENV_LD_LIBRARY_PATH=/usr/local/cuda/lib64 srun singularity exec --nv -B /mnt/data:/mnt/data -B /usr/local/cuda:/usr/local/cuda /mnt/data/WD/fingerprint/masif_seed_gpu.sif ./compute_descriptors.sh -l in/x${SLURM_ARRAY_TASK_ID}
