use strict; use warnings;
open(my $fh, "<", 'tmp.txt');
my @line = readline $fh; chomp @line; close $fh;
my @method; my @name; my @date_of_service; my @code; my @charge; my @payment; my @writeoff; my @imeth;
my $i = 0; my $count = 0; my $ttl = 0; my $u = 0;
foreach (@line)
    { $ttl++; } # get @line count + 1
while($i < $ttl) {
    $i++, next if !($line[$i] =~ /^Payment \- / && $line[$i] !~ /Total:$/);
    my $meth = $method[$u] = $line[$i]; # CREATE HASH
    $i++; $u++;
    do {
        $imeth[$count] = $meth; # $hash name
        $name[$count] = $line[$i]; # $hash[0]
        $date_of_service[$count] = $line[++$i];
        $code[$count] = $line[++$i];
        $charge[$count] = $line[++$i];
        $payment[$count] = $line[++$i];
        $writeoff[$count] = $line[++$i]; #$hash[5]
        $i++; $count++;
    } until ($line[$i] =~ /Total:$/);
}
for (0 .. --$count) {
    print "$imeth[$_]\n";
    print "$name[$_]\n";
    print "$date_of_service[$_]\n";
    print "$code[$_]\n";
    print "$charge[$_]\n";
    print "$payment[$_]\n";
    print "$writeoff[$_]\n";
    print "+++++++++++++\n";
}
