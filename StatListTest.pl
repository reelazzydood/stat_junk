#!/usr/bin/perl -w
use strict;
use StatList;

#test first constructor
my $list1 = StatList->new((0,1,2,3,4,5,6));
my $list2 = StatList->new();
$list1->pp;
$list2->pp;
my $sum1 = $list1->sum;
print "$sum1\n";
my $sum2 = $list2->sum;
print "$sum2\n";
my $avg1 = $list1->average;
print "$avg1\n";
my $avg2 = $list2->average;
print "$avg2\n";
my $var1 = $list1->variance;
print "$var1\n";
my $var2 = $list2->variance;
print "$var2\n";
my $std1 = $list1->st_dev;
print "$std1\n";
my $std2 = $list2->st_dev;
print "$std2\n";

#test second constructor
my $list3 = StatList->new((0,'two',3,4,'five'));
my $list4 = StatList->new();
$list3->pp;
$list4->pp;