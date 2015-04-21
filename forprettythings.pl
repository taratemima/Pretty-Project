#!/usr/bin/perl
use warnings;
use strict;
use diagnostics;
use Math::Trig ':pi';
use 5.010;

sub CreateWardrobe{
$/ = "";

my @wardrobe = (
{
	Item => "Nooby Mini Skirt",
	Color => "Blue",
	Price => 45,
	Obtained => "No",
			},
		);

open(CLOSET,  "<prettythings.txt");

my $weirdcharacter = "*";
while(<CLOSET>){
	chomp;
	#s/\*//gm;
	#This intrepreted it as delete all
	my @choices = split(/\n/, $_);
	
	for (my $i = 0; $i < 250; $i++){
		(my $item, my $item_color, my $price) = split(/\t/, $choices[$i], 3);
		$wardrobe[$i]{Item} =$item;
		$wardrobe[$i]{Color} =$item_color;
		$wardrobe[$i]{Price} =$price;
		$wardrobe[$i]{Obtained} ="No";
		}
	}

return @wardrobe;	
}

#sub WardrobeChange{
#(my @war) = &CreateWardrobe;
#my $select = $_[0];

#for (my $j = 0; $j < $#war; $j++){
#	if ($war[$j]{Item} =~ m/$select/gm){
#		$war[$j]{Color} = (shift @col);
#		}
#	}
#return @war;
#}


#Test: it prints


sub BuyWithGold{
open(LIST, ">>thingstoget.txt");
my $gold = 695;
my @war = &CreateWardrobe;
for (my $p = 0; $p < $#war; $p++){
if ($war[$p]{Price} < $gold){
print (LIST " $war[$p]{Item} \n");
		}
	}

}


#write: combo colors 2, 3, or 4 times

sub PrintWardrobe{
my @war = &CreateWardrobe;


for my $i ( 0 .. $#war ) {
	for my $role ( keys %{ $war[$i] } ) {
	print "elt $i $role is $war[$i]{$role}\n";
		 }
	 }

}

#&PrintWardrobe;
&BuyWithGold;