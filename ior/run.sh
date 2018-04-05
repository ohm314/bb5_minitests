#!/bin/bash
set -x

UC1=knl
UC2=volta
UC3=cpu
UC4=nvme
UC234=uc234
UC5=uc5
NUC1=120
NUC2=7
NUC3=120
NUC4=80
NUC234=207
NUC5=327

sbatch --partition=prod -C $UC1 -N $NUC1 \
  --ntasks-per-node=64 ior.sbatch 
sbatch --partition=interactive -C $UC2 -N $NUC2 \
  --ntasks-per-node=36 ior.sbatch 
sbatch --partition=prod -C $UC3 -N $NUC3 \
  --ntasks-per-node=36 ior.sbatch 
sbatch --partition=prod -C $UC4 -N $NUC4 \
  --ntasks-per-node=36 ior.sbatch 

sbatch --partition=interactive -C "$UC2|$UC3|$UC4" -N $NUC234 \
  --ntasks-per-node=36 ior.sbatch 

sbatch --partition=interactive -C "$UC1|$UC2|$UC3|$UC4" -N $NUC5 \
  --ntasks-per-node=36 ior.sbatch 
