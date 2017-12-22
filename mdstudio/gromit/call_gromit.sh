#!/bin/bash

CERISE_API_FILES="$1"
PROTEIN_PDB="$2"
PROTEIN_TOP="$3"
LIGAND_PDB="$4"
LIGAND_TOP="$5"
FORCE_FIELD="$6"
SIM_TIME="$7"

function isolated_cmd {
    module load gromacs/2016.3
    source $CERISE_API_FILES/miniconda/bin/activate root

    GMXRC_FILE="/hpc/sw/gromacs-2016.3-hsw-sp/bin/GMXRC.bash"
    GROMIT="$CERISE_API_FILES/mdstudio/github/cerise-mdstudio-cartesius/mdstudio/gromit/gromit_mpi.sh"

    $GROMIT -gmxrc $GMXRC_FILE -vsite -np 8 -f $PROTEIN_PDB -top $PROTEIN_TOP -l $LIGAND_PDB,$LIGAND_TOP -ff $FORCE_FIELD -time $SIM_TIME -lie
}

env -i isolated_cmd
