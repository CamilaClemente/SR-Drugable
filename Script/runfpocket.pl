use strict;
open(list, "@ARGV[0]/PdbList");

while(my $pdb=<list>){
	chomp $pdb;
	if($pdb=~m/.pdb/){
		$pdb=$`;
	}
	system ("cd @ARGV[0]/Pdbs/;fpocket -f $pdb.pdb");
	system ("cp -r @ARGV[0]/Pdbs/$pdb\_out @ARGV[0]/fpocket/$pdb\_out; rm -r @ARGV[0]/Pdbs/$pdb\_out");
}
close (lista);
