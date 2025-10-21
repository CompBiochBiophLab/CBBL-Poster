# .latexmkrc for JBI2025
# Purpose: make `latexmk -pdf JBI2025_FEEC.tex` reproducible and make the repo's `common/` styles available.

use strict;
use warnings;
use Cwd 'abs_path';
use File::Spec;

# Compute absolute paths so TEXINPUTS works when latexmk is run from this directory.
my $proj_dir   = File::Spec->rel2abs('.');
my $common_dir = File::Spec->catdir($proj_dir, '..', 'common');

# TEXINPUTS separator: ':' on Unix, ';' on Windows
my $sep = ($^O =~ /MSWin32/i) ? ';' : ':';
$ENV{'TEXINPUTS'} = $common_dir . $sep . ($ENV{'TEXINPUTS'} // '');

# Build and auxiliary directories (keeps repo root clean)
$out_dir = 'pdf';
$aux_dir = 'build';

# pdflatex command: write output to $out_dir
$pdflatex = 'pdflatex -interaction=nonstopmode -file-line-error -synctex=1  -output-directory=' . $out_dir . ' %O %S';

# Bib tool configuration: leave defaults (latexmk will choose bibtex or biber depending on files)
$bibtex = 'bibtex %O %B';
$biber  = 'biber %O %B';

# Build mode: produce PDF
$pdf_mode = 1;
# ensure failure is clearly propagated
$failure_cmd = 'echo "latexmk: build failed" 1>&2; exit 1';