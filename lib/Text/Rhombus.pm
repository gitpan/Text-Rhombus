# $Id: Rhombus.pm,v 0.04 2004/01/16 00:03:12 sts Exp $

package Text::Rhombus;

use 5.006;
use strict;
use warnings;

our $VERSION = '0.04';

use Exporter;
use base qw(Exporter);

our (@EXPORT_OK, %EXPORT_TAGS, @subs);

@subs = qw(rhombus);

@EXPORT_OK = @subs;
%EXPORT_TAGS = (  all  =>    [ @subs ]
);

=head1 NAME

Text::Rhombus - draw an alphanumerical rhombus.

=head1 SYNOPSIS

 use Text::Rhombus q/rhombus/;

 print rhombus(
     lines   =>         31,
     letter  =>        'c',
     case    =>    'upper',
     fillup  =>        '+',
 );

=head1 DESCRIPTION

see above.

=head1 FUNCTIONS

=head2 rhombus

Draws an alphanumerical rhombus.

 $rhombus = rhombus(
     lines   =>         31,
     letter  =>        'c',
     case    =>    'upper',
     fillup  =>        '+',
 );

Returns the rhombus in a scalar context.

Omitting options will return a rhombus of 25 lines. 

B<options>

=over 4

=item *

=item B<lines>

amount of lines.

=item B<letter>

alphanumerical letter to start with.

=item B<case>

lower/upper case of the letters within the rhombus.

=item B<fillup>

fillup character.

=back

=cut

sub rhombus {
    my %o = @_;
    
    my ($rhombus, $lines, $letter,
        $case, $fillup);
    
    $lines  = $o{lines}  ||      25;
    $letter = $o{letter} ||     'a';
    $case   = $o{case}   || 'upper'; 
    $fillup = $o{fillup} ||     '+'; 
        
    $letter = $case eq 'upper' ? uc $letter : lc $letter;
    
    $lines++ if $lines % 2 == 0;
    
    my ($line, $repeat) = (1,1);
    for (; $line <= $lines; $line++) {
        my $space = ($lines - $repeat) / 2;
	$rhombus .= $fillup x $space;
        $rhombus .= $letter x $repeat; 
        $rhombus .= $fillup x $space."\n";
	
	$repeat = $line < ($lines / 2)
	  ? $repeat + 2
	  : $repeat - 2;

        $letter = chr(ord ($letter) + 1);

        if ($letter !~ /[a-z]/i) {
	    $letter = $case eq 'upper' ? 'A' : 'a';
	}
    }
    
    return $rhombus;
}

1;
__END__

=head2 EXPORT

C<rhombus()> upon request.

B<TAGS>

C<:all - *()>

=head1 SEE ALSO

perl(1)

=head1 LICENSE

This program is free software; 
you may redistribute it and/or modify it under the same terms as Perl itself.

=head1 AUTHOR

Steven Schubiger

=cut
