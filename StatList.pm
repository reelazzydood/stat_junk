#!/usr/bin/perl -w
package StatList;
use strict;

# constructor version 1
sub new {
    my $class = shift;
	
	my $self = bless {
	    LIST => []
	}, $class;
	if(@_) {
	    push @{$self->{LIST}}, @_;
	}
	return $self;
}

# constructor version 2
sub new2 {
    my $class = shift;
	my $self = {};
	if(@_) {
	    push(@{$self->{LIST}}, @_);
	} else {
	    $self->{LIST} = ();
	}
	bless($self, $class);
	return $self;
}

sub pp {
    my $self = shift;
	print "\n$self = (";
	if($self->{LIST}) {
	    my $len = scalar @{$self->{LIST}};
        foreach my $val (@{$self->{LIST}}) {
		    if($len > 1) {
			    print "$val,";
				$len--;
			} else {
                print "$val";
			}
	    }
    }
	print ")\n";
}

sub sum {
    my $self = shift;
    my $sum = 0;
    foreach my $val (@{$self->{LIST}}) {
        if($val) {
            $sum += $val;
        }
    }
    return $sum;
}

sub average {
    my $self = shift;
	my @rep = @{$self->{LIST}};
    my $tot = 0;
    my $avg = 0;
    if(@rep) {
	    unshift(@rep, $self);
        $tot = sum(@rep);
        $avg = $tot/@{$self->{LIST}};
    }
    return $avg;        
}

sub variance {
    my $avg = average(@_);
    my $self = shift;
	my @rep = @{$self->{LIST}};
    my $var = 0;
    if($avg) {
        my $tmp = 0;
        my $num = 0;
        my $tot = 0;
        foreach my $val (@rep) {
            if($val) {
                $tmp = $val - $avg;
                $num = $tmp * $val;
                $tot += $num;
            }
        }
        $var = $tot/@rep;
    }
    return $var;
}

sub st_dev {
    my $self = shift;
	my @rep = @{$self->{LIST}};
    my $st_dev = 0;
    if(@rep) {
	    unshift(@rep, $self);
        $st_dev = variance(@rep) ** 0.5;
    }
    return $st_dev;
}
1;