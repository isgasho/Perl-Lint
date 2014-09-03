package Perl::Lint::Policy::RegularExpressions::ProhibitEnumeratedClasses;
use strict;
use warnings;
use List::Util ();
use Perl::Lint::Constants::Type;
use parent "Perl::Lint::Policy";

use constant {
    DESC => 'Use named character classes',
    EXPL => [248],
};

my @patterns = (
   [q{ },'\\t','\\r','\\n'] => ['\\s', '\\S'],
   ['A-Z','a-z','0-9','_']  => ['\\w', '\\W'],
   ['A-Z','a-z']            => ['[[:alpha:]]','[[:^alpha:]]'],
   ['A-Z']                  => ['[[:upper:]]','[[:^upper:]]'],
   ['a-z']                  => ['[[:lower:]]','[[:^lower:]]'],
   ['0-9']                  => ['\\d','\\D'],
   ['\w']                   => [undef, '\\W'],
   ['\s']                   => [undef, '\\S'],
);

my %ordinals = (
    ord "\n" => '\\n',
    ord "\f" => '\\f',
    ord "\r" => '\\r',
    ord q< > => q< >,
);

sub evaluate {
    my ($class, $file, $tokens, $src, $args) = @_;

    my @violations;
    for (my $i = 0, my $token_type; my $token = $tokens->[$i]; $i++) {
        $token_type = $token->{type};

        if ($token_type == REG_EXP || $token_type == REG_REPLACE_FROM) {
            my $regex = $token->{data};
            if (my @captures = $regex =~ / (\\)* \[ (\^?) (.+) ] /gx) {
                while (@captures) {
                    my $backslashes = shift @captures;
                    my $is_negate   = shift @captures;
                    my $in_brackets = shift @captures;

                    if ($backslashes && length($backslashes) % 2 != 0) { # escaped
                        next;
                    }

                    my @parts = $in_brackets =~ m/([^\\]-[^\\] | [_ ] | \\[trnws] | \\0[0-7]+ | \\x[0-9a-f])/gx;
                    my %parts = map {$_ => 1} @parts;
                    for (my $j = 0; $j < @patterns; $j += 2) {
                        if (List::Util::all { $parts{$_} } @{$patterns[$j]}) {
                            my $index = 0;
                            if ($is_negate) {
                                $index = 1;
                            }

                            if ($patterns[$j+1]->[$index]) {
                                push @violations, {
                                    filename => $file,
                                    line     => $token->{line},
                                    description => DESC,
                                    explanation => EXPL,
                                    policy => __PACKAGE__,
                                };
                                last;
                            }
                        }
                    }
                }
            }
        }
    }

    return \@violations;
}

1;

