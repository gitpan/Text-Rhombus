package Text::Rhombus;

$VERSION = '0.11';
@EXPORT_OK = qw(rhombus);

use strict;
use base qw(Exporter);

sub rhombus {
    my %o = @_;    
    my ($rhombus, $lines, $letter,
       $case, $fillup);
    
    $lines  = $o{lines}  ||      25;
    $letter = $o{letter} ||     'a';
    $case   = $o{case}   || 'upper'; 
    $fillup = $o{fillup} ||     '+'; 
        
    $letter = $case eq 'upper' 
      ? uc $letter 
      : lc $letter;   
       
    $lines++ if ($lines % 2 == 0);
    
    my ($line, $repeat) = (1,1);
    
    for (; $line <= $lines; $line++) {
        my $space = ($lines - $repeat) / 2;
	my $fillup_space = $fillup x $space;
	
	$rhombus .= $fillup_space;
        $rhombus .= $letter x $repeat; 
        $rhombus .= $fillup_space."\n";
	
	$repeat = $line < ($lines / 2)
	  ? $repeat + 2
	  : $repeat - 2;

        $letter = chr( ord( $letter ) + 1 );

        if ($letter !~ /[a-z]/io) {
	    $letter = $case eq 'upper' 
	      ? 'A' : 'a';
	}
    }    
    
    return $rhombus;
}

1;
__END__

=head1 NAME

Text::Rhombus - Draw an alphanumerical rhombus

=head1 SYNOPSIS

 use Text::Rhombus qw(rhombus);

 print rhombus(
     lines   =>         31,
     letter  =>        'c',
     case    =>    'upper',
     fillup  =>        '+',
 );

=head1 FUNCTIONS

=head2 rhombus

Draws an alphanumerical rhombus.

 $rhombus = rhombus(
     lines   =>         31,
     letter  =>        'c',
     case    =>    'upper',
     fillup  =>        '+',
 );

Returns the rhombus as string.

Omitting options will return a rhombus of 25 lines. 

B<options>

=over 4

=item *

=item B<lines>

amount of lines.

=item B<letter>

alphanumerical letter to start with.

=item B<case>

lower / upper case of the letters within the rhombus.

=item B<fillup>

fillup character.

=back

=head1 EXPORT

C<rhombus()> is exportable.

=cut
