#!/usr/bin/env perl
$latex = 'platex %O -kanji=utf8 -no-guess-input-enc -synctex=1 -interaction=nonstopmode %S';
$dvipdf = 'dvipdfmx %O -o %D %S';
$pdf_mode = 3;
