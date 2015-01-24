#!/bin/sh
#SBATCH -J cluster_ipython
#SBATCH -p parallel
#SBATCH -n 64
#SBATCH --time=48:00:00
#SBATCH --ntasks-per-node=8
#SBATCH --exclusive

echo "Launching controller"
ipcontroller --ip='*' --profile=mpi &
sleep 10

echo "Launching engines"
srun ipengine --profile=mpi &
sleep 25

echo "Launching job"
ipython $1 --profile=mpi

echo "Done!"
