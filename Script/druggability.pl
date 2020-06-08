use strict;

open (pdblist,"@ARGV[0]/PdbList");
open (sal,">@ARGV[0]/druggability.tab");

while(my $pdb=<pdblist>){
	chomp $pdb;
	if($pdb=~m/.pdb/){
		$pdb=$`;
	}
	open(info,"@ARGV[0]/fpocket/$pdb\_out/$pdb\_info.txt");
	my $pocket;
	my $s=0;
	while(my $info=<info>){
		chomp $info;
		my @sp=split " ",$info;
		if(@sp[0] eq "Pocket"){$pocket=$info;}
		if(@sp[0] eq "Druggability"){
				if(@sp[3] > 0.6){
					print sal "$pdb $pocket @sp[3]\n";
				}
			}
		
		}
	close(info);
}
close(pdb);
close(sal);
