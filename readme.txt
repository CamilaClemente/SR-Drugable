Nombre

The main goal of XXX is to perform a reverse screening of a specific ligand. We highlight that the important aspect of this pipeline is that it detects drugable pockets of a protein and calculates its center of mass to performed a guided docking. So, you don't need to know the coordinates of the pockets to be analyzed!

The input files are: a PDBList (list of the PDB files of the proteins that will be analyzed) and a ligand to do the docking.

Dependencies, you need to install de followed softwares: fpocket (https://github.com/Discngine/fpocket), Autodock Vina (http://vina.scripps.edu/download.html), MGLTools-1.5.6 (http://mgltools.scripps.edu/downloads) (or babel, sudo apt-get install obabel) and Pymol (sudo apt-get install pymol).


How to run
The pipeline is code in perl.
To run, $perl main.pl JobID PdbsList Ligand.pdb
Example, $perl main.pl Malaria MalariaPdbList thymol.pdb

To run this pipeline you how two option:
 - If you have a data set of the protein for de screening in PDB format and you want to use them, you have to define a PATH where the structures are, to do this in Script/cleanpdb.pl in 4 line in my $pathPDB=""; you have to put your path.
 - If you don't have the PDB structures the pipeline will download all the PDBs on your list.
 
In case you can't download and install MGLTools-1.5.6, you can use babel to convert PDB into PDBqt format. In Script/receptorprepare.pl you should comment or uncomment the corresponding lines (please note that are differents babel version, use the corresponding). 
