use strict;
open (tablanr,"/home/camila/Documentos/autodock_vina_1_1_2_linux_x86/bin/ListaFallados");

while (my $pdb=<tablanr>){
	chomp $pdb;

	system ("python prepare_receptor4.py -A hydrogens -r /home/camila/Documentos/autodock_vina_1_1_2_linux_x86/bin/pdbout/$pdb.pdb -o $pdb.pdbqt");
		

}

close (tablanr);
