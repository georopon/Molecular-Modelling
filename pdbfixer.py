#; Write by: Ropón-Palacios G,
from pdbfixer import PDBFixer
from simtk.openmm.app import PDBFile
fixer = PDBFixer(filename='CoV-protease.pdb')
fixer.findMissingResidues()
fixer.findNonstandardResidues()
fixer.replaceNonstandardResidues()
fixer.removeHeterogens(False)
fixer.findMissingAtoms()
fixer.addMissingAtoms()
fixer.addMissingHydrogens(7.0)
#fixer.addSolvent(fixer.topology.getUnitCellDimensions())
PDBFile.writeFile(fixer.topology, fixer.positions, open('cov-protease-fixed.pdb', 'w'))
