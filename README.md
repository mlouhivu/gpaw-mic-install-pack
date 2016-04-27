### Description

Build recipe for the MIC version of GPAW including all dependencies.


### Install

Go to 'install/' directory and follow the instructions in 'kommand' and
'kommand-pymic' to install the full stack needed by GPAW. Only thing you need
to edit in them is the target location for the installation (variable $base).


### Test case

In the 'test-case/' directory are the input files needed to reproduce the bug.
Just edit the job script (job.sh) to point to the install location of your
stack.

