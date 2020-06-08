use strict;

open(lista,"/home/camila/bioinformatica/SCREENING/listanr.tab");
open(sal,">/home/camila/bioinformatica/SCREENING/drogables.tab");

while(my $lista=<lista>){
	chomp $lista;
	open(info,"/home/camila/bioinformatica/SCREENING/pdbtry/$lista\_out/$lista\_info.txt");
	my $pocket;
	while(my $info=<info>){
		chomp $info;
		my @sp=split " ",$info;
		if(@sp[0] eq "Pocket"){$pocket=$info;}
		if(@sp[0] eq "Druggability"){
			if(@sp[3] > 0.6){
				print sal "$lista $pocket @sp[3]\n";
			}
		}
		
	}
	close(info);
}
close(lista);
close(sal);
