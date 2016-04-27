#!/bin/bash --login

#BSUB -R "224*{select[hkncc0x2] span[ptile=28]}"
#BSUB -q hoelleq
#BSUB -x
#BSUB -J slab-8x28
#BSUB -o job-%J.log
#BSUB -W 60

source /path/to/install/dir/load.sh

# get some more information about the system
echo =ICPC=====================================================================
which icpc
echo =MPIRUN===================================================================
which mpirun
echo =CPUINFO==================================================================
cpuinfo
echo =/PROC/CPUINFO============================================================
cat /proc/cpuinfo
echo =ENV======================================================================
env
echo =MICINFO?=================================================================
if [ "yesx" == "yesx" ]; then
    micinfo
else
    echo "No offload, Xeon only"
fi
echo ==========================================================================

export I_MPI_HYDRA_BOOTSTRAP=ssh
export I_MPI_FABRICS=shm:dapl
export I_MPI_DAPL_PROVIDER=ofa-v2-mlx4_0-1

# launch the job
echo "Launching GPAW with C60_Pb100.py"
export I_MPI_DEBUG=5
export I_MPI_PIN=1
if [ "nox" == "yesx" ]; then
    export PYMIC_DEBUG=5
fi
if [ "yesx" == "yesx" ]; then
    export GPAW_OFFLOAD=1
    time mpirun -np 224 ./affinity-wrapper.sh 28 gpaw-python C60_Pb100.py
else
    export GPAW_OFFLOAD=0
    time mpirun -np 224 gpaw-python C60_Pb100.py
fi
echo =THE=END==================================================================

