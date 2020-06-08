use strict;

open (pdblist,"@ARGV[0]/PdbList");
my $jobsDir=qx(pwd);
chomp $jobsDir;
system("cp $jobsDir/prepare_receptor4.py @ARGV[0]/Pdbs/prepare_receptor4.py");
system("cp $jobsDir/prepare_ligand4.py @ARGV[0]/Pdbs/prepare_ligand4.py");

while(my $pdb=<pdblist>){
	chomp $pdb;
	if($pdb=~m/.pdb/){
		$pdb=$`;
	}

	system ("cd @ARGV[0]/Pdbs/;python prepare_receptor4.py -A hydrogens -r @ARGV[0]/Pdbs/$pdb.pdb -o @ARGV[0]/Pdbs/$pdb\_aux.pdbqt");
	#system ("cd @ARGV[0]/Pdbs/;babel -ipdb '$pdb.pdb' -opdbqt '$pdb.pdbqt' -h");
	#system ("cd @ARGV[0]/Pdbs/;obabel -ipdb '@ARGV[1]' -opdbqt -O '@ARGV[1]qt' -h");
}
system ("perl pdbfix.pl @ARGV[0]");
close (pdblist);

system ("cd @ARGV[0]/Pdbs/;python prepare_ligand4.py -A hydrogens -l @ARGV[0]/Pdbs/@ARGV[1] -o @ARGV[0]/Pdbs/@ARGV[1]qt");
#system ("cd @ARGV[0]/Pdbs/;babel -ipdb '@ARGV[1]' -opdbqt '@ARGV[1]qt' -h");
#system ("cd @ARGV[0]/Pdbs/;obabel -ipdb '@ARGV[1]' -opdbqt -O '@ARGV[1]qt' -h");
