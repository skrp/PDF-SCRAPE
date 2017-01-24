use warnings; use strict;
use CAM::PDF;
#########################
# RIPP - scrape pdf files
my ($file) = @ARGV;
my $doc; my $str; my $batch; my $end; my $p;
$doc = CAM::PDF->new($file) || die "$CAM::PDF::errstr\n";
open(my $fh, '>', 'tmp.txt'); # tmp to verify data post-extraction 
my $pages = $doc->numPages(); $p = '1'; $end = $pages; $end++;
while ($p != $end)
{ # remove unnessary data on rip
      $str = $doc->getPageText($p);
      $str =~ s/TRASHDATA_item//g; # remove individual strings
      my $rm1 = "Page $p of ".$pages;
      my $rm2 = "TRASHDATA_begin"; my $rm22 = "TRASHDATA_end"; 
      $str =~ s/$rm1.*//s; # isolate & remove entire string sections
      $str =~ s/$rm2.*$rm22//s;
      print $fh $str;
      $p++;
}
