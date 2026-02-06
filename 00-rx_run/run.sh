#!/bin/bash
#SBATCH --account=project_465002078     # Project name
#SBATCH --partition=standard-g          # Partition on LUMI
#SBATCH --time 00:10:00                 # Requested time
#SBATCH --mem=0                         # Requested memory  
#SBATCH --nodes=1                       # Number of nodes
#SBATCH --ntasks-per-node=8             # MPI tasks per node- 1 task per GPU
#SBATCH --gpus-per-node=8               # 8 GPU chips available per node
#SBATCH --job-name=ipic_g-minkyeon      # Name of the job
#SBATCH --output 00-output_file.out     # Name of the output file

ml rocm PrgEnv-amd cray-hdf5-parallel/1.12.2.11
ml

export OMP_NUM_THREADS=1        #! 56 threads (out of 64) available per node
export CRAYBLAS_WARNING=0

echo "========================================================================"
echo " "
date
echo " "

srun ../build/iPIC3D ../share/inputfiles/Maxwell.inp

echo " "
echo "========================================================================"
date
echo " "
