#!/usr/bin/env perl

# allow recursive search
$latex  = 'platex -halt-on-error -shell-escape %O %S';
$dvipdf = 'dvipdfmx %S';

# platex -> dvipdfmx 
$pdf_mode = 3;
