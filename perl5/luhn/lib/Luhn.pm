package Luhn;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_luhn_valid>;

sub is_luhn_valid ($) {
    my $num = shift;
    $num =~ s/\s//g;
    return 0 if $num =~ /\D|^0$/;

    sub double {
        my $digit   = shift;
        my $doubled = $digit * 2;
        $doubled -= 9 if $doubled > 9;
        return $doubled;
    }

    my $d      = False;
    my @digits = map { $d = !$d; $d ? double $_ : $_ } reverse split //, $num;

    my $sum = 0;
    $sum += $_ for @digits;
    return $sum % 10 == 0;
}
