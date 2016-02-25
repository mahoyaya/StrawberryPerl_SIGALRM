#!/usr/bin/env perl
use strict;
use warnings;
use POSIX qw(SIGALRM);

print scalar localtime . "\n";

alarm 3;
sleep 2;
print scalar localtime . "\n";
alarm 0;

eval {
    local $SIG{ALRM} = sub { die };
    alarm 3;
    sleep 5;
    print scalar localtime . "\n";
};
if ( $@ ) {
    print "timeout.";
    warn $@;
}


exit;
