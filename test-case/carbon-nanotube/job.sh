#!/bin/bash
#PBS -q qexp
#PBS -N mic-nanotube
#PBS -l select=8:ncpus=24:accelerator=True:naccelerators=2:accelerator_model=phi7120 
#PBS -A DD-15-41

cd $PBS_O_WORKDIR
export NODES=8

# load needed modules
module load intel
# load GPAW stack
base=/scratch/work/user/louhivuo/lib
source $base/load.sh

(( ncores = NODES * 24 ))
ppn=12

export OMP_NUM_THREADS=1

unset I_MPI_PMI_LIBRARY
export I_MPI_FABRICS=shm:dapl
export I_MPI_DAPL_PROVIDER_LIST=ofa-v2-mlx4_0-1u,ofa-v2-scif0,ofa-v2-mcm-1

GPAW_PPN=$ppn GPAW_OFFLOAD=1 mpirun -np $ncores ./affinity-wrapper.sh $ppn gpaw-python carbon-nanotube.py

