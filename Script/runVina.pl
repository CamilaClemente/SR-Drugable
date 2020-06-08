use strict;
open (coordtab, "@ARGV[0]/@ARGV[1]/Druggability_CMCoordinates");

while (my $line=<coordtab>){
	chomp $line;
	
	my @var= split " ", $line;
	
	my $centerx= @var[5];
	my $centery= @var[6];
	my $centerz= @var[7];

	system("cp @ARGV[0]/@ARGV[1]/Pdbs/@ARGV[2]qt $jobsDir/OutPutFiles$jobID/VinaFiles/@ARGV[2]qt;cp @ARGV[0]/@ARGV[1]/Pdbs/@var[0].pdbqt $jobsDir/OutPutFiles$jobID/VinaFiles/@var[0].pdbqt");
	
	system ("cd $jobsDir/OutPutFiles$jobID/VinaFiles;vina --receptor @var[0].pdbqt --ligand @ARGV[2]qt --center_x $centerx --center_y $centery --center_z $centerz --size_x 25 --size_y 25 --size_z 25 --out @var[0]_@var[1]_@var[2]_ligand");
	
	system("rm $jobsDir/OutPutFiles$jobID/VinaFiles/@ARGV[2]qt;rm $jobsDir/OutPutFiles$jobID/VinaFiles/@var[0].pdbqt; rm $jobsDir/OutPutFiles$jobID/VinaFiles/@var[0]_@var[1]_@var[2]_ligand");
}

close (coordtab);
