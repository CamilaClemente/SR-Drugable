use strict;
open (table,"@ARGV[0]/druggability.tab");

open (outtab, ">@ARGV[0]/Druggability_CMCoordinates");

while (my $table=<table>){
	chomp $table;
	my @varcm= split " ", $table;
	open (out,">@ARGV[0]/pymolcm.pml");
	print out "load @ARGV[0]/fpocket/@varcm[0]\_out/pockets/pocket@varcm[2]_atm.pdb\nimport center_of_mass\ncom pocket@varcm[2]_atm, state=1\nquit";

	system ("pymol @ARGV[0]/pymolcm.pml > @ARGV[0]/salidacm;tail -3 salidacm > @ARGV[0]/aux");
	open (aux, "@ARGV[0]/aux");
	my $line=<aux>;
	print outtab "$table $line";
}
close (tablacm);
system("rm @ARGV[0]/pymolcm.pml;rm @ARGV[0]/salidacm; @ARGV[0]/aux");
