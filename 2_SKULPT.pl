use strict; use warnings;
################################
# SKULPT - build a custom report
open(my $fh, "<", 'tmp.txt');
my @line = readline $fh; chomp @line; close $fh;
my @name; my @date_of_service; my @payment;
my $count = 0; my $i = 0; my $n = 0;
while($i < $#line) {
    if (($line[$i] =~ /^[A-Z]/) and ($line[$i] =~ /,/)) {
        $name[$count] = $line[$i]; $i++;
        $date_of_service[$count] = $line[$i];
        $i++; $i++; $i++;
        $payment[$count] = $line[$i];
        $i++;
        $count++;
    }
    else
        { $i++; }
}
while ($n < $count) {
    print "$name[$n]  :  $date_of_service[$n]  :  $payment[$n]\n";
    $n++;
}
