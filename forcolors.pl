#!/usr/bin/perl
use warnings;
use strict;
use diagnostics;
use Math::Trig ':pi';
use 5.010;

sub CreateColorList{
$/ = "";

open(COLOR,  "<colors.txt");
my @colors;
while(<COLOR>){
	chomp;
	@colors = split(/,/m, $_);
	}

return @colors;	
}

sub TwoColorMix{
my @paintbox = &CreateColorList;

while(@paintbox){
my $starter = shift(@paintbox);
for (my $c = 0; $c < $#paintbox; $c++){
my $mixture = join(" and ", $starter, $paintbox[$c]);
print "$mixture \n";
		}
	}
}

&TwoColorMix;