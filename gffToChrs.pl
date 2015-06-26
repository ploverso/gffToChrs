#!/usr/bin/perl

# Usage: gffToChrs.pl $inFile $outDir
# inFile: The input .gff file
# $outDir: The directory into which to write the chromosome gff file.

# Example usage:
# perl gffToChrs.pl myGffFile.gff ./

use warnings;
use strict;

#Takes an input file and a output directory
#Returns nothing- output is written to file
sub processGff{
	
	my $inFile = shift;
	my $outDir = shift;
	open my $gffData, "<", $inFile or die "could not open $inFile";
	
	while(<$gffData>){
		my $line = $_;
		
		# Skip comments
		next if ($line =~ m/^#/);
		
		my @line = split(/\t/, $line);
		my $chr = $line[0];
		
		my $outfile = $outDir . "/" . $chr . ".gff";
		open my $fh, '>>', $outfile or die "could not open $outfile";
		print $fh $line;
		close $fh;
	}
	close $gffData;
}


my ($inFile, $outDir) = @ARGV;
processGff($inFile, $outDir);
