#!/usr/bin/perl 
#===============================================================================
#
#         FILE:  Create_File_List.pl
#
#        USAGE:  ./Create_File_List.pl  
#
#  DESCRIPTION:  Creates a csv list of png files in directory asumming
#  filenames uses '-' as channel separator
#
#      OPTIONS:  ---
# REQUIREMENTS:  ---
#         BUGS:  ---
#        NOTES:  ---
#       AUTHOR:  YOUR NAME (), 
#      COMPANY:  
#      VERSION:  1.0
#      CREATED:  07/06/2013 05:56:14 PM
#     REVISION:  ---
#===============================================================================

use strict;
use warnings;

my @filelist=<*.png>;
my %prefixhash;
my %suffixhash;
my @temp;


for(my $i=0;$i<=$#filelist;$i++)
{
   @temp= split('-',$filelist[$i]);
   print  $filelist[$i],"\t",$temp[0],"\n";
   if(!exists $prefixhash{$temp[0]})
    {
        $prefixhash{$temp[0]}=0;
    }   
    if(!exists $suffixhash{$temp[1]})
    {
        $suffixhash{$temp[1]}=0;
    }   

}
 

open OUT, ">Sample_FileList.csv" or die $!;
foreach my $pkey (keys %prefixhash)
{
    my $counter=1;
    foreach my $skey(sort(keys %suffixhash))
    {
        print OUT '../Sample_Images/',$pkey,'-',$skey;
        $counter=$counter+1;
        if($counter == scalar(keys(%suffixhash)+1))
        {
            print OUT "\n";
        }
        else
        {
            print OUT ",";
        }
    }
}

close(OUT);
