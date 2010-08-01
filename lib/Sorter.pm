# implement this
package Sorter;

use strict;
use warnings;

sub new {
  bless [], 'Sorter';
}

sub set_values {
  my $self = shift;
  @$self = @_;
}

sub get_values {
  @{$_[0]};
}

sub sort {
  sub swap {
    my $array = shift;
    my $l = shift;
    my $r = shift;
    my $tmp = $array->[$l];
    $array->[$l] = $array->[$r];
    $array->[$r] = $tmp;
  }

  my $self = shift;
  my ($l, $r) = @_;
  $l = defined($l) ? $l : 0;
  $r = defined($r) ? $r : $#$self;

  return if ($r <= $l);

  my $pv = $self->[$l];
  my $left =  $l + 1;
  my $right = $r;
  while (1) {
    ++$left  while ($left  <= $r && $self->[$left]  <= $pv);
    --$right while ($right >= $l && $self->[$right] >= $pv);
    last     if ($left > $right);
    &swap($self, $left++, $right--);
  }
  &swap($self, $l, $right--) if ($right > $l);
  $self->sort($left, $r);
  $self->sort($l, $right);
}

1;
__END__
