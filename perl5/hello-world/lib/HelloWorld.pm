package HelloWorld;

use Exporter qw<import>;
our @EXPORT_OK = qw<hello>;

sub hello () {
    return 'Hello, World!';
}
