# load compile stack
source /opt/intel/impi/5.0.3.048/intel64/bin/mpivars.sh
source /opt/intel/compiler/2015.5.223/bin/iccvars.sh intel64
source /opt/intel/mpss/3.5.37182/etc/mpss_vars.sh
export CXX=icpc
export CC=icc
export FC=ifort
export CFLAGS="-O3 -xHost"
export CXXFLAGS=$CFLAGS
export CPPFLAGS=$CFLAGS
export FCFLAGS=$CFLAGS
unset LDFLAGS

# target
base=<BASE>

export PYTHONHOME=$base/python-2.7.10
export PYTHONPATH=$base/python-2.7.10/lib
export PATH=$base/python-2.7.10/bin:$PATH
export PYTHONPATH=$base/ase-3.9.1/lib:$PYTHONPATH
export PATH=$base/ase-3.9.1/bin:$PATH
export LIBXCDIR=$base/libxc-2.1.2
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$base/libxc-2.1.2/lib
export PYTHONPATH=$base/cython-0.23:$PYTHONPATH
export PATH=$base/cython-0.23/bin:$PATH

cd $base/pymic/
source ./env.sh
cd -

export GPAW_SETUP_PATH=$base/gpaw-setups-0.9.11271
export PYMIC_LIBRARY_PATH=$base/gpaw-mic/lib/python2.7/site-packages/gpaw/mic:$PYMIC_LIBRARY_PATH
export PYTHONPATH=$base/gpaw-mic/lib/python2.7/site-packages:$PYTHONPATH
export PATH=$base/gpaw-mic/bin:$PATH

