use strict;

open (pdblist,"@ARGV[0]/PdbList");

while (my $pdb=<pdblist>){
	chomp $pdb;
	if($pdb=~m/.pdb/){
		$pdb=$`;
	}
	open(pdbaux, "@ARGV[0]/Pdbs/$pdb\_aux.pdbqt");
	open(pdbfix, ">@ARGV[0]/Pdbs/$pdb.pdbqt");
	while (my $pdbaux=<pdbaux>){
		chomp $pdbaux;
		my @sp=split "", $pdbaux;
		if(@sp[21] eq " "){
			print pdbfix "@sp[0]@sp[1]@sp[2]@sp[3]@sp[4]@sp[5]@sp[6]@sp[7]@sp[8]@sp[9]@sp[10]@sp[11]@sp[12]@sp[13]@sp[14]@sp[15]@sp[16]@sp[17]@sp[18]@sp[19]@sp[20]@sp[22]@sp[23]@sp[24]@sp[25]@sp[26]@sp[27]@sp[28]@sp[29]@sp[30]@sp[31]@sp[32]@sp[33]@sp[34]@sp[35]@sp[36]@sp[37]@sp[38]@sp[39]@sp[40]@sp[41]@sp[42]@sp[43]@sp[44]@sp[45]@sp[46]@sp[47]@sp[48]@sp[49]@sp[50]@sp[51]@sp[52]@sp[53]@sp[54]@sp[55]@sp[56]@sp[57]@sp[58]@sp[59]@sp[60]@sp[61]@sp[62]@sp[63]@sp[64]@sp[65]@sp[66]@sp[67]@sp[68]@sp[69]@sp[70]@sp[71]@sp[72]@sp[73]@sp[74]@sp[75]@sp[76]@sp[77]@sp[78]@sp[79]@sp[80]\n";
		}
		else{
			print pdbfix "$pdbaux\n";
		}	
	}
	close(pdbaux);
	close(pdbfix);	
	system("rm @ARGV[0]/Pdbs/$pdb\_aux.pdbqt");
}
close(lista);	

	
