#!/bin/bash -l
#SBATCH --account=proj16
#SBATCH -t 01:00:00
#SBATCH --qos=bigjob
#SBATCH --exclusive
#SBATCH --mem-per-cpu=64

module purge

echo "Running with nix/mvapich2-rdma" 
module load nix/mvapich2-rdma
module load nix/bench/hpl/2.2

echo "SLURM_NTASKS: $SLURM_NTASKS" 
echo "SLURM_NTASKS_PER_NODE: $SLURM_NTASKS_PER_NODE"
echo "SLURM_NODELIST: $SLURM_NODELIST"

export OMP_NUM_THREADS=1
export MKL_NUM_THREADS=1

echo "HPL is : " `which xhpl`

srun --mpi=pmi2 xhpl 
