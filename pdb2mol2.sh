# Convet to mol2 all ligand 
echo "Convertin ligand from PDB to MOL2 ..!"
for f in M6M_*.pdb; do obabel $f -O ${f%.pdb}.mol2 -h ; done 
rm M6M_*.pdb 
echo "Fixing order of H atoms"
sleep 5 
for J in M6M_*.mol2; do perl sort_mol2_bonds.pl $J ${J%.mol2}_fix.mol2; done  
echo "DONE !!"



