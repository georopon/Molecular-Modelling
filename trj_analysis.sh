#!/bin/bash
echo "A Meta-script for run Traj Analysis from Protein-Ligand Complex!!" 
echo "@autor: ROPON-PALACIOS G., PhD (c)"
echo "Copyright (c) 2019 KIPU Bioinformatics"
echo "E-mail: biodano.geo@gmail.com"
echo "date: March 14, 2019."
echo "usage: bash trjanalysis.sh" 
echo "Waiting .... processing data"
sleep 10
echo "Analysing data from NIPAH drugs"
sleep 5
echo  "¡wainting...!"
#echo "Checking if your simulation a completed ..."
#sleep 4
#check -f md_0_1.xtc 
#echo "Converting XTC traj for pdb snapshots..."
#echo "View your pdb snaphots with molecular view tool as Pymol"
#echo "Change -dt command into script for customized resolution of snapshots ..."
#echo "¡wainting...!"
#trjconv -s md_0_1.tpr -f md_0_1.xtc -o snapshot.pdb -pbc nojump -dt 1000 
#clear
#echo "processing accurate data ... XTC file"
#sleep 5
#echo  "0" | trjconv -s md_0_1.tpr -f md_0_1.xtc -o md_0_1_noPBC.xtc -pbc mol -ur compact
#clear
#echo "Analysing RMSD"
#sleep 3
#echo  "¡processing ... RMSD!"
#sleep 5
#echo "¡processing ... RMSD from Protein-Ligand Complex"
#sleep 3
#echo -e "4\n13" | g_rms -s md_0_1.tpr -f md_0_1_noPBC.xtc -o rmsd_complex.xvg -tu ns 
#clear
#echo "¡processing ... RMSD from Protein only"
#sleep 3
#echo -e "4\n4" | g_rms -s md_0_1.tpr -f md_0_1_noPBC.xtc -o rmsd_protein.xvg -tu ns 
#clear
#echo "¡processing ... RMSD from Lingand only"
#sleep 3
#echo -e "13\n13" | g_rms -s md_0_1.tpr -f md_0_1_noPBC.xtc -o rmsd_ligand.xvg -tu ns 
#clear
#-- RMSF Analysis 
#echo "Analysing RMSF"
#sleep 3
#echo "¡procesing ... RMSF"
#sleep 5
#echo "1" | g_rmsf -s md_0_1.tpr -f md_0_1_noPBC.xtc -o rmsf_fullprotein.xvg -res 
#clear
#-- Hbond Analysis
#echo "Analysing Hbond"
#sleep 3
#echo "processing ... Hbonds"
#echo -e "1\n13" |  g_hbond -f md_0_1_noPBC.xtc -s md_0_1.tpr -num hydrogen2-bond-protein-ligand.xvg -#tu ns
#clear
#-- Distance Hbond analysis
echo "Analysing Hbond distance cutoff < 3.5 Angstrom"
sleep 2
echo "setting ... cutoff"
sleep 5
echo "processing 4 Hbond ..."
sleep 2
echo "processing ... 1er hbond"
sleep 5
gmx distance -s md_0_1.tpr -f md_0_1_noPBC.xtc -select 'resname "UNL" and name ODB plus resid 508 and name H' -oall tyr508-hbond.xvg -tu ns

echo "processinbash g ... 2do hbond"
sleep 5
gmx distance -s md_0_1.tpr -f md_0_1_noPBC.xtc -select 'resname "UNL" and name HCL plus resid 560 and name NZ' -oall lys560-hbond.xvg -tu ns

echo "processing ... 3er hbond"
sleep 5
gmx distance -s md_0_1.tpr -f md_0_1_noPBC.xtc -select 'resname "UNL" and name OBK plus resid 236 and name HE' -oall arg236-hbond.xvg -tu ns

echo "processing ... 4to hbond"
sleep 5
gmx distance -s md_0_1.tpr -f md_0_1_noPBC.xtc -select 'resname "UNL" and name OBK plus resid 240 and name O' -oall cys240-hbond.xvg -tu ns

echo "Finshing script ..."
sleep 2
echo "wainting ..."
echo "Thanks for use this script"
sleep 5 
