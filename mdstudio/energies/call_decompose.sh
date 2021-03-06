#!/bin/bash

CERISE_API_FILES="$1"
RESIDUES="$2"
GRO_FILE="$3"
NDX_FILE="$4"
TRR_FILE="$5"
TOP_FILE="$6"
MDP_FILE="$7"

module load gromacs/2016.3
source $CERISE_API_FILES/miniconda/bin/activate root

GMXRC_FILE="/hpc/sw/gromacs-2016.3-hsw-sp/bin/GMXRC.bash"

$CERISE_API_FILES/miniconda/bin/python2.7 $CERISE_API_FILES/mdstudio/bin/getEnergies.py decompose -gmxrc $GMXRC_FILE -res $RESIDUES -gro $GRO_FILE -ndx $NDX_FILE -trr $TRR_FILE -top $TOP_FILE -mdp $MDP_FILE -o decompose.ene
