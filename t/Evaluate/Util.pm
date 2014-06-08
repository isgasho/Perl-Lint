package t::Evaluate::Util;
use strict;
use warnings;
use Perl::Lint;
use File::Temp qw/tempfile/;
use parent qw/Exporter/;
our @EXPORT_OK = qw/fetch_violations/;

sub fetch_violations {
    my ($class, $input, $args) = @_;

    my ($fh, $filename) = tempfile(UNLINK => 1);
    print $fh $input;
    close $fh;

    my ($tokens, $src) = Perl::Lint::_tokenize($filename);
    my $violations = "Perl::Lint::Evaluator::$class"->evaluate($filename, $tokens, $src, $args);
}

1;

