# load compile stack
module load intel

# target
base=<BASE>

# set environment
export PYTHONHOME=$base/python-2.7.10
export PYTHONPATH=$base/python-2.7.10/lib
export PATH=$base/python-2.7.10/bin:$PATH
export PYTHONPATH=$base/ase-3.9.1/lib:$PYTHONPATH
export PATH=$base/ase-3.9.1/bin:$PATH
export LIBXCDIR=$base/libxc-2.1.2
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$base/libxc-2.1.2/lib
export PYTHONPATH=$base/cython-0.23:$PYTHONPATH
export PATH=$base/cython-0.23/bin:$PATH

# load pymic
cd $base/pymic/
source ./env.sh
cd -

export GPAW_SETUP_PATH=$base/gpaw-setups-0.9.11271
export PYMIC_LIBRARY_PATH=$base/gpaw-mic/lib/python2.7/site-packages/gpaw/mic:$PYMIC_LIBRARY_PATH
export PYTHONPATH=$base/gpaw-mic/lib/python2.7/site-packages:$PYTHONPATH
export PATH=$base/gpaw-mic/bin:$PATH

