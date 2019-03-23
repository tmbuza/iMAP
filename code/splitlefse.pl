#!usr/bin/perl;

use strict;

#	Get filenames from command line argument
my $infile = $ARGV[0];
my $outfile = $ARGV[1];
my $datawithin;

#	Open input file and create output
open(INFILE, "$infile") || die "Cannot open $infile for reading!";
open(OUTFILE, ">$outfile") || die "Cannot open $outfile for writing!";

#	Loop
while(<INFILE>){
	chomp($_);
	my @data = split("\t", $_, 2);
	my @datawithin = split('\|', $data[0]); # \| must be in single quotes
	print OUTFILE "$datawithin[0]\t$datawithin[1]\t$datawithin[2]\t$datawithin[3]\t$datawithin[4]\t$datawithin[5]\t$datawithin[6]\t$data[1]\n";
}
