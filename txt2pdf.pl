use warnings; use strict;
use CAM::PDF;
###########################
# PDF - text to pdf printer

my ($file, $line, $name) = @ARGV;
my ($pdf, $i); my $col = 3;

die "ARG1 file ARG2 lines ARG3 name" unless (defined $file);
$line = 1 unless (int($line));
$name = 'tmp' unless (defined $name);

open(my $ifh, '<', $file);
my @lines = readline $ifh;
close $ifh; chomp @lines;

my $pdf = CAM::PDF->new('$name.pdf') or die "$CAM::PDF::errstr\n";
while (mod $i == 0 && mod $col == 0)
{
  my $pay = shift @lines;
  print $pdf toPDF("$pay\n");
  
  $pdf->appendPDF() if ();
}
