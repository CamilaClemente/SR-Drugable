use strict;
open (tablafinal,"/home/camila/Documentos/autodock_vina_1_1_2_linux_x86/bin/TablaCoordenadas");

	while (my $linea=<tablafinal>){
	chomp $linea;

	
	my @var= split " ", $linea;
	
	my $centerx= @var[5];
	my $centery= @var[6];
	my $centerz= @var[7];


	system ("vina --receptor @var[0].pdbqt --ligand Timol.pdbqt --center_x $centerx --center_y $centery --center_z $centerz --size_x 25 --size_y 25 --size_z 25 --out @var[0]_@var[1]_@var[2]_ligandT");

	#system ("vina --receptor @var[0].pdbqt --ligand Mentol.pdbqt --center_x $centerx --center_y $centery --center_z $centerz --size_x 11 --size_y 11 --size_z 11 --out @var[0]_@var[1]_@var[2]_ligandM");

	#system ("vina --receptor @var[0].pdbqt --ligand Eugenol.pdbqt --center_x $centerx --center_y $centery --center_z $centerz --size_x 12 --size_y 12 --size_z 12 --out @var[0]_@var[1]_@var[2]_ligandE");
		
	#system ("mv @var[0]_@var[1]_@var[2]_ligandT /home/camila/Documentos/autodock_vina_1_1_2_linux_x86/bin/Timol/@var[0]_@var[1]_@var[2]_ligandT");
	#system ("mv @var[0]_@var[1]_@var[2]_ligandM /home/camila/Documentos/autodock_vina_1_1_2_linux_x86/bin/Mentol/@var[0]_@var[1]_@var[2]_ligandM");
	#system ("mv @var[0]_@var[1]_@var[2]_ligandE /home/camila/Documentos/autodock_vina_1_1_2_linux_x86/bin/Eugenol/@var[0]_@var[1]_@var[2]_ligandE");
}

close (tablafinal);
