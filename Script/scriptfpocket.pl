use strict;
open(lista, "/home/camila/bioinformatica/SCREENING/listanr.tab");

while(my $lista=<lista>){
	chomp $lista;
	system ("cd /home/camila/bioinformatica/SCREENING/pdbtry/;fpocket -f $lista.pdb ");
}
close (lista);
