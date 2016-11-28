### Description

Build recipe for the MIC version of GPAW (incl. all dependencies) that is
aimed at offloading to Knights Corner (KNC) co-processors:
https://gitlab.com/gpaw/gpaw/tree/mic


### Install

Go to 'install/' directory and follow the instructions in 'kommand',
'kommand-pymic', and 'kommand-gpaw' to install the full stack needed by
GPAW for MICs. In principle, the only thing you need to edit is the target
location for the installation (variable $base) and any module commands (or
similar) needed to load the compile environment on your system.

In practice, you will also want to take a look at the configuration options,
patches etc. in the install/setup/ directory and modify as needed to find
correct libraries on your system and to select appropriate compile flags.


### Test case

In the 'test-case/' directory are two sets of input files that can be used
to test the installation. Just edit the job script (job.sh) to point to the
install location of your stack.

