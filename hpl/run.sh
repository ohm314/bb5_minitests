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

pushd $UC1
sbatch --partition=prod -C $UC1 -N $NUC1 \
  --ntasks-per-node=64 ../hpl_nix_mva.sbatch 
popd
pushd $UC2
sbatch --partition=interactive -C $UC2 -N $NUC2 \
  --ntasks-per-node=36 ../hpl_nix_mva.sbatch 
popd
pushd $UC3
sbatch --partition=prod -C $UC2 -N $NUC2 \
  --ntasks-per-node=36 ../hpl_nix_mva.sbatch 
popd
pushd $UC4
sbatch --partition=prod -C $UC2 -N $NUC2 \
  --ntasks-per-node=36 ../hpl_nix_mva.sbatch 
popd

pushd $UC234
sbatch --partition=interactive -C "$UC2|$UC3|$UC4" -N $NUC234 \
  --ntasks-per-node=36 ../hpl_nix_mva.sbatch 
popd
pushd $UC5
sbatch --partition=interactive -C "$UC1|$UC2|$UC3|$UC4" -N $NUC5 \
  --ntasks-per-node=36 ../hpl_nix_mva.sbatch 
popd
