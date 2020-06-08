use strict;

my $pdbslist=$ARGV[1];
my $jobID=$ARGV[0];
my $jobsDir=qx(pwd);
chomp $jobsDir;
my $scriptfiles="$jobsDir/Script";
chomp @ARGV[2];
my $range = 50;

# create random integer as low as 0 and as high as 9

my $c=0;

close(frases);

print "
  ____________Star  Girls___________
 |	 _______    _________	    |
 |	|  _____|  |  _   _  |      |
 |	|  |	   | | | | | |      |
 |	|  |       | | |_| | |      |
 |	|  |____   | |     | |      |
 |      |_______|  |_|     |_|      |
 |_________The Drug Machine_________| 

 \"Stay hungry, stay foolish. Steve Jobs\"

\n";

#--- Remove directories if exists

system("rm -r $jobsDir/OutPutFiles$jobID");
#system("rm -r $jobsDir/OutPut$jobID");

#--- Make directories----

system("mkdir $jobsDir/OutPutFiles$jobID"); 
system("mkdir $jobsDir/OutPutFiles$jobID/Pdbs");
system("mkdir $jobsDir/OutPutFiles$jobID/VinaFiles");
system("mkdir $jobsDir/OutPutFiles$jobID/fpocket");

#system("mkdir $jobsDir/OutPut$jobID");
#system("mkdir $jobsDir/OutPut$jobID/PDB");
#system("mkdir $jobsDir/OutPut$jobID/VisualizationScript");

#--- Start Pipeline ---

system("cp $pdbslist $jobsDir/OutPutFiles$jobID/PdbList");
system("cp @ARGV[2] $jobsDir/OutPutFiles$jobID/Pdbs/@ARGV[2]");
system("cd $scriptfiles; perl cleanpdb.pl $jobsDir/OutPutFiles$jobID"); #Pdbs Cleaner
system("cd $scriptfiles; perl runfpocket.pl $jobsDir/OutPutFiles$jobID"); #Run fpocket
system("cd $scriptfiles; perl druggability.pl $jobsDir/OutPutFiles$jobID"); #Druggability Filter
system("cd $scriptfiles; perl obtaincenterofmass.pl $jobsDir/OutPutFiles$jobID"); #Obtain Center Of Mass
system("cd $scriptfiles; perl receptorprepare.pl $jobsDir/OutPutFiles$jobID @ARGV[2]");#Generate Pdbqt files
system("cd $scriptfiles; perl runVina.pl $jobsDir /OutPutFiles$jobID @ARGV[2]");#Run Vina
system("cd $scriptfiles; perl vinaFilter.pl $jobsDir /OutPutFiles$jobID");# Filter Vina Results
