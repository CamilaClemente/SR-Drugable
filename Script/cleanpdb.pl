use strict;
open (pdblist,"@ARGV[0]/PdbList");
print "Cleanning Pdbs\n";
my $pathPDB=""; #In case you have a pdb dataset.

while (my $pdb=<pdblist>){
	chomp $pdb;
	if($pdb=~m/.pdb/){
		$pdb=$`;
	}
	if(-e "$pathPDB/$pdb.pdb"){
		system("cp $pathPDB/$pdb.pdb $pdb.pdb @ARGV[0]/Pdbs/$pdb\_aux.pdb");
      			  }
     	else{
         	system("wget https://files.rcsb.org/view/$pdb.pdb -O @ARGV[0]/Pdbs/$pdb\_aux.pdb");
       			}
	open (pdb, "@ARGV[0]/Pdbs/$pdb\_aux.pdb");
	open (pdbout, ">@ARGV[0]/Pdbs/$pdb.pdb");
	
	while (my $linea=<pdb>){
		chomp $linea;
		my @nmr=split " ",$linea;
		my @varpdb=split "",$linea;
		my $atom= "@varpdb[0]@varpdb[1]@varpdb[2]@varpdb[3]";
		my $ter= "@varpdb[0]@varpdb[1]@varpdb[2]";
		if (($atom eq "ATOM")or($ter eq "TER")){
			print pdbout "$linea\n";
			}
		if (@nmr[0] eq "ENDMDL"){
			print pdbout "$linea\n";
			last;
		}

	}

	close(pdb);
	close(pdbout);
	
	system("rm @ARGV[0]/Pdbs/$pdb\_aux.pdb");
}
close(pdblist);
