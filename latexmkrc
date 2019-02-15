#!/usr/bin/env perl

# allow recursive search
$latex  = 'platex -halt-on-error --shell-escape %O %S';
$dvipdf = 'dvipdfmx %S';
$bibtex = 'pbibtex';

# platex -> dvipdfmx
$pdf_mode = 3;

# mac setting
$pdf_previewer = 'open -a "Preview"';
