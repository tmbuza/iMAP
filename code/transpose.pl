#!usr/bin/perl;

# transpose.pl - (c) 2008
# Authors: Teresia Buza and Ranjit Kumar
# E-mail: tbuza@cvm.msstate.edu

# PURPOSE: The purpose of this script is to convert row data into column while maintaining the primary identifier.

#	Input:	
#	File containing data to be transposed e.g Affymetrix GO for Biological process, cellular component 
#	and molecular function.
#	Format of input:
#	Q9YI45	0004672 // protein kinase activity // inferred from electronic annotation /// 0004713 // protein-tyrosine 
#	kinase activity // inferred from electronic annotation /// 0005021 // vascular endothelial growth factor receptor 
#	activity // inferred from electronic annotation  

#	Output: 
#	Q9YI45	0004672 // protein kinase activity // inferred from electronic annotation	
#	Q9YI45	0004713 // protein-tyrosine kinase activity // inferred from electronic annotation
#	Q9YI45	0005021 // vascular endothelial growth factor receptor activity // inferred from electronic annotation

#	Example invocations
#   transpose.pl array array_out 

use strict;

#	Get filenames from command line argument
my $infile = $ARGV[0];
my $outfile = $ARGV[1];

#	Open input file and create output
open(INFILE, "$infile") || die "Cannot open $infile for reading!";
open(OUTFILE, ">$outfile") || die "Cannot open $outfile for writing!";

#	Loop
while(<INFILE>){
	chomp($_);
	my @data = split("\t",$_);
	my @datawithin = split("//",$data[1]);
	my $length = $#datawithin+1;
	my $counter = 0;
	while($length != $counter)
	{
 		print OUTFILE "$data[0]\t$datawithin[$counter]\n";

# 	print OUTFILE "$data[0]\t","$datawithin[$counter]\t$data[2]\n";
# 	print OUTFILE "$data[0]\t","$datawithin[$counter]\t$data[2]\t$data[3]\n";
	
# 	print OUTFILE "$datawithin[$counter]\t$data[1]\t$data[2]\t$data[3]\n";
# 		$counter++;

# 		print OUTFILE "$datawithin[$counter]\t","$data[1]\t","$data[2]\t","$data[3]\t","$data[4]\t","$data[5]\t",
# 		"$data[6]\t","$data[7]\t","$data[8]\t","$data[9]\t","$data[10]\t","$data[11]\t","$data[12]\t",
#  		"$data[13]\t","$data[14]\t","$data[15]\t","$data[16]\n";#"$data[17]\n"; #"$data[18]\t","$data[19]\t","$data[20]\t",
# # 		"$data[21]\t","$data[22]\t","$data[23]\t","$data[24]\t","$data[25]\t","$data[26]\t","$data[27]\t",
# # 		"$data[28]\t","$data[29]\t","$data[30]\t","$data[31]\t","$data[32]\t","$data[33]\t","$data[34]\t",
# # 		"$data[35]\t","$datawithin[$counter]\n";
#  		$counter++;
	}
}