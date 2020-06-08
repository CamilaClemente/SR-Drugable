use strict;

open(table,"@ARGV[0]/@ARGV[1]/druggability.tab");
open(out,">@ARGV[0]/@ARGV[1]/Affinity.tab");
print out "PdbId PocketId Affinity RMSD\n";

while(my $table=<table>){
	chomp $table;
	my @var= split " ",$table;
	open(vinaout,"@ARGV[0]/@ARGV[1]/VinaFiles/@var[0]_@var[1]_@var[2]_ligand");
	while(my $vina=<vinaout>){
		chomp $vina;
		my @sp=split " ",$vina;
		if((@sp[1] eq "VINA") and (@sp[2] eq "RESULT:")){
			print out "@var[0] @var[1]_@var[2] @sp[3] @sp[4]\n";
		}

	}
	close(vinaout);

}
close(Table);
close(out);

open(affi,"@ARGV[0]/@ARGV[1]/Affinity.tab");
open(outtop,">@ARGV[0]/@ARGV[1]/Better_Affinity.tab");

print outtop "PdbId PocketId Affinity RMSD\n";

my $affi=<affi>;
my $id;
my $less=100;
my $rmsd;

while($affi=<affi>){
	chomp $affi;
	my @spa=split " ",$affi;
	if("@spa[0] @spa[1]" eq $id){
		$id="@spa[0] @spa[1]";
		if($less>@spa[2]){
			$less=@spa[2];
			$rmsd=@spa[3];
		}
	}
	else{
		if($less!=100){
			print outtop"$id $less $rmsd\n";
		}
		$less=@spa[2];
		$id="@spa[0] @spa[1]";
		$rmsd=@spa[3];
	}

}
print outtop"$id $less $rmsd\n";
close(affi);
close(outtop);

