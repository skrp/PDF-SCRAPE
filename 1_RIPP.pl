use warnings; use strict;
use CAM::PDF;
#########################
# RIPP - scrape pdf files
my $file = 'tst.pdf';
my $doc; my $str; my $batch; my $end; my $p;
$doc = CAM::PDF->new($file) || die "$CAM::PDF::errstr\n";
open(my $fh, '>', 'tmp.txt'); # must verify data struct post-extraction 
my $pages = $doc->numPages(); $p = '1'; $end = $pages; $end++;
while ($p != $end)
{
      $str = $doc->getPageText($p);
      $str =~ s/TRASHDATA_item//g;
      my $rm1 = "Page $p of ".$pages;
      my $rm2 = "TRASHDATA_begin"; my $rm22 = "TRASHDATA_end";
      $str =~ s/$rm1.*//s;
      $str =~ s/$rm2.*$rm22//s;
      print $fh $str;
      $p++;
}
