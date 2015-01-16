#!/bin/sh
#SBATCH -J ipython
#SBATCH -n 64
#SBATCH --time=48:00:00
#SBATCH --ntasks-per-node=8
#SBATCH --mem-per-cpu=1024

echo "Launching controller"
ipcontroller --ip='*' &
sleep 10

echo "Launching engines"
ipengine &
sleep 25

echo "Launching job"
python checkipnb.py $1

echo "Done!"
