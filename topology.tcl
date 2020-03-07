;# Script para construir topologia Ribosome
;# written by : Ropón-Palacios G, PhD (c).

;# Script para generar la topología del sistema
if {1} {
package require psfgen
;#topology toppar/top_all22_prot.rtf 
topology toppar/top_all36_prot.rtf 
topology toppar/top_all36_na_nbfix.rtf
;#topology toppar/top_all36_carb.rtf 
topology toppar/toppar_water_ions_nbfix.str
}

;## BUNDLE 1 OF RIBOSOME 
mol new 6SPB_Repair.pdb type pdb waitfor all

;# protein get chains
set sel [atomselect top "protein"]
set chains [lsort -unique [$sel get chain]] ;# return A B C D
foreach chain $chains {
    puts "Adding protein chain $chain to psfgen"
    pdbalias residue HIS HSD
    pdbalias atom ILE CD1 CD
    set seg ${chain}PRO
    set sel [atomselect top "protein and chain $chain"]
    $sel set segid $seg
    #pdbalias atom VAL O OT1 
    #pdbalias atom LYS O OT1
    #pdbalias atom ARG O OT1
    #pdbalias atom GLY O OT1
    #pdbalias atom LYS O OT1 
    #pdbalias atom ALA O OT1 
    #pdbalias atom PRO O OT1
    #pdbalias atom LEU O OT1
    #pdbalias atom GLU O OT1
    #pdbalias atom ASP O OT1
    #pdbalias atom THR O OT1
    #pdbalias atom PHE O OT1
    #pdbalias atom GLN O OT1
    $sel writepdb tmp.pdb
    segment $seg { pdb tmp.pdb 
                 #first NTER
                 #last CTER
                 }
    #regenerate angles
    #regenerate resids 
    #regenerate angles dihedrals ; # critical after patching            
    coordpdb tmp.pdb 
}
#guesscoord 

;# DNA get chains
mol delete all
mol delete $sel 
exec rm tmp.pdb 
mol new 6SPB_Repair.pdb type pdb waitfor all 
set sel [atomselect top "nucleic"]
set chains [lsort -unique [$sel get chain]] ;# return A B C D
foreach chain $chains {
    puts "Adding DNA chain $chain to psfgen"
    ;# Nucleic acid pdbalias 
    pdbalias residue A ADE
    pdbalias residue G GUA
    pdbalias residue C CYT
    ;#pdbalias residue T THY ;# Only for DNA 
    pdbalias residue U URA   ;# Only for RNA 
    pdbalias atom A OP1 O1P
    pdbalias atom A OP2 O2P
    pdbalias atom G OP1 O1P
    pdbalias atom G OP2 O2P 
    pdbalias atom C OP1 O1P
    pdbalias atom C OP2 O2P
    pdbalias atom U OP1 O1P
    pdbalias atom U OP2 O2P 
    set seg ${chain}RNA
    set sel [atomselect top "nucleic and chain $chain"]
     $sel set segid $seg
    $sel writepdb tmp.pdb

    segment $seg { pdb tmp.pdb }
   #only for DNA
    #set resids [lsort -unique [$sel get resid]]
    #foreach r $resids {
    #   patch DEOX $seg:$r
    #}
    #regenerate angles dihedrals
    coordpdb tmp.pdb 
}
guesscoord

;## Escribiendo los output
writepsf ribosome_top.psf ; # Output PSF
writepdb ribosome_top.pdb ; # Output PDB
quit

