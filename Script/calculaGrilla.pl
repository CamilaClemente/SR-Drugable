use strict;
open (tablacm,"/home/camila/SynologyDrive/FC-Project/bioinformaticaUNVM/SCREENING/tabla_coordenadas");
#/home/camila/bioinformaticaUNVM/SCREENING/pdbtry/1AG1_out/pockets/pocket1_atm.pdb

open (salida, ">tabla_coordenada_grilla");
my $x; my $y; my $z;
my @coordx;
my @coordy;
my @coordz;
my $Deucx=0;my $Deucy=0;my $Deucz=0;

while (my $tabla=<tablacm>){
	chomp $tabla;
	my @varcm= split " ", $tabla;
	my $mx=0; my $my=0;my $mz=0;
	open (pdb, "/home/camila/bioinformaticaUNVM/SCREENING/pdbtry/@varcm[0]_out/pockets/pocket@varcm[2]_atm.pdb");
	my $i=0;
	while (my $pdb=<pdb>){
		chomp $pdb;
		my @varpdb=split "",$pdb;
		my $atom= "@varpdb[0]@varpdb[1]@varpdb[2]@varpdb[3]";
		my $alfa= "@varpdb[14]@varpdb[15]";
		if ($atom eq "ATOM"){
			$x= "@varpdb[29]@varpdb[30]@varpdb[31]@varpdb[32]@varpdb[33]@varpdb[34]@varpdb[35]@varpdb[36]@varpdb[37]";
			$y= "@varpdb[38]@varpdb[39]@varpdb[40]@varpdb[41]@varpdb[42]@varpdb[43]@varpdb[44]@varpdb[45]@varpdb[46]";
			$z= "@varpdb[47]@varpdb[48]@varpdb[49]@varpdb[50]@varpdb[51]@varpdb[52]@varpdb[53]@varpdb[54]@varpdb[55]";
			my @spc=split " ",$x;
			@coordx[$i]=@spc[0];
			my @spc=split " ",$y;
			@coordy[$i]=@spc[0];
			my @spc=split " ",$z;
			@coordz[$i]=@spc[0];
			$i++;
			}
	}
	close(pdb);
	my $d=0;
	while($d<$i){
		my $r=0;
		while($r<$i){
			$Deucx=@coordx[$d]-@coordx[$r];
			$Deucy=@coordy[$d]-@coordy[$r];
			$Deucz=@coordz[$d]-@coordz[$r];
			if($Deucx<0){$Deucx=$Deucx*(-1);}
			if($Deucy<0){$Deucy=$Deucy*(-1);}
			if($Deucz<0){$Deucz=$Deucz*(-1);}
			if($Deucx>$mx){
				$mx=$Deucx;
				print "@coordx[$d]-@coordx[$r] $Deucx\n";
				}
			if($Deucy>$my){
				$my=$Deucy;
				print "@coordy[$d]-@coordy[$r] $Deucy\n";
				}
			if($Deucz>$mz){
				$mz=$Deucz;
				print "@coordz[$d]-@coordz[$r] $Deucz\n";
				}
			$r++;
			}
		$d++;
		}
	print salida "$tabla $mx $my $mz\n";
}
close (tablacm);
