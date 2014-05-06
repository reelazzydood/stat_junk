#!/usr/bin/perl -w
use strict;

my $val1 = 3;
my $val2 = 4;
my $total = sum($val1, $val2);
print "sum of $val1 and $val2 = $total\n";
my $val3 = 33;
my $val4 = 3;
my $total2 = sum($val3, $val4);
print "sum of $val3 and $val4 = $total2\n";
my $avgofall = average($val1, $val2, $val3, $val4);
print "average of all numbers: $avgofall\n";
my $test;
my $avtest = sum($test);
print "value of avtest: $avtest\n";
my $vartest = variance($val1, $val2, $val3, $val4, $test);
print "value of vartest: $vartest\n";
my $stdtest = st_dev($val1, $val2, $val3, $val4);
print "value of stdtest: $stdtest\n";

sub sum {
    my $sum = 0;
    foreach my $val (@_) {
        if($val) {
            $sum += $val;
        }
    }
    return $sum;
}

sub average {
    my $tot = 0;
    my $avg = 0;
    if(@_) {
        $tot = sum(@_);
        $avg = $tot/@_;
    }
    return $avg;	    
}

sub variance {
    my $avg = average(@_);
    my $var = 0;
    if($avg) {
        my $tmp = 0;
        my $num = 0;
	my $tot = 0;
        foreach my $val (@_) {
	    if($val) {
	        $tmp = $val - $avg;
                $num = $tmp * $val;
	        $tot += $num;
	    }
	}
	$var = $tot/@_;
    }
    return $var;
}

sub st_dev {
    my $st_dev = 0;
    if(@_) {
        $st_dev = variance(@_) ** 0.5;
    }
    return $st_dev;
}
