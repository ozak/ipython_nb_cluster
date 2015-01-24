#!/bin/sh
#SBATCH -J cluster_ipython
#SBATCH -p parallel
#SBATCH -n 64
#SBATCH --time=96:00:00
#SBATCH --ntasks-per-node=8
#SBATCH --exclusive

echo "Launching controller"
ipcontroller --ip='*' --profile=mpi &
sleep 10

echo "Launching engines"
mpiexec ipengine --profile=mpi --mpi=mpi4py &
sleep 25

echo "Launching job"
ipython kernel --profile=mpi 

echo "Done!"
