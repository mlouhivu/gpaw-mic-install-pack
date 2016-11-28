# Custom GPAW setup for Intel MICs (KNC)
import os

# use Intel compiler and MPI
compiler = 'mpiicc'
mpicompiler = 'mpiicc'
mpilinker = 'mpiicc'

# use MKL
mklroot = os.environ['MKLROOT']
library_dirs += [mklroot + '/lib/intel64/']
libraries = ['mkl_intel_lp64', 'mkl_intel_thread', 'mkl_core',
             'mkl_lapack95_lp64', 'mkl_scalapack_lp64',
             'mkl_blacs_intelmpi_lp64', 'pthread'
			]

# libxc
library_dirs += [os.environ['LIBXCDIR'] + '/lib']
include_dirs += [os.environ['LIBXCDIR'] + '/include']
libraries += ['xc']

# compiler settings for Intel compiler
extra_compile_args  = ['-xAVX', '-O3']
extra_compile_args += ['-no-prec-div', '-static', '-std=c99', '-fPIC']

# offload to KNC
extra_compile_args += ['-qoffload-option,mic,compiler,"-qopenmp"']
extra_compile_args += ['-qopt-report-phase=offload']

# linker settings for MKL on KNC
mic_mkl_lib = mklroot + '/lib/mic/'
extra_link_args += ['-offload-option,mic,link,"-L' + mic_mkl_lib \
        + ' -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -lpthread"']

# GPAW defines
define_macros += [('GPAW_NO_UNDERSCORE_CBLACS', '1')]
define_macros += [('GPAW_NO_UNDERSCORE_CSCALAPACK', '1')]
define_macros += [("GPAW_ASYNC",1)]
define_macros += [("GPAW_MPI2",1)]

# use ScaLAPACK
scalapack = True

