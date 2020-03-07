;## This script get multiple ligands in proteins resolved by X-Ray or CryoEM 
;## Written by Ropón-Palacios G. 
;## E-mail: biodano.geo@gmail.com 

;# Get ligand named by chain ID 
mol new 6OCW.pdb type pdb waitfor all

set sel [atomselect top "resname M6M"]
set chains [lsort -unique [$sel get chain]] ;# return A B C D E ... 
foreach chain $chains {
    set seg ${chain}M6M
    set sel [atomselect top "resname M6M and chain $chain"]
    $sel set segid $seg 
    $sel writepdb M6M_${chain}.pdb 
}

quit 
