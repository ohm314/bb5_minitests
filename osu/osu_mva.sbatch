#!/bin/bash -l
#SBATCH --account=proj16
#SBATCH -t 01:00:00 
#SBATCH --qos=bigjob
#SBATCH --exclusive
#SBATCH --mem-per-cpu=64
 
module purge

echo "Running with nix/mvapich2-rdma" 

module load nix/mvapich2-rdma
module load nix/osu-mpi-bench

echo "SLURM_NTASKS: $SLURM_NTASKS" 
echo "SLURM_NTASKS_PER_NODE: $SLURM_NTASKS_PER_NODE"
echo "SLURM_NODELIST: $SLURM_NODELIST"

srun --mpi=pmi2 osu_allgatherv -m 32:1024 -x 200 -i 100
srun --mpi=pmi2 osu_mbw_mr
