#!/usr/bin/perl

use strict;
use warnings;

use Text::Rhombus q/rhombus/;

print rhombus(
    lines   =>         31,
    letter  =>        'c',
    case    =>    'upper',
    fillup  =>        '+',
);
