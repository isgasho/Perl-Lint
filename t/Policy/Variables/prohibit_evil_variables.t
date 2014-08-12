use strict;
use warnings;
use Perl::Lint::Policy::Variables::ProhibitEvilVariables;
use t::Policy::Util qw/fetch_violations/;
use Test::Base::Less;

my $class_name = 'Variables::ProhibitEvilVariables';

filters {
    params => [qw/eval/], # TODO wrong!
};

for my $block (blocks) {
    my $violations = fetch_violations($class_name, $block->input, $block->params);
    is scalar @$violations, $block->failures, $block->dscr;
}

done_testing;

__DATA__

===
--- dscr: 2 evil variables
--- failures: 2
--- params: {prohibit_evil_variables => {variables => '$[ $SIG{__DIE__}'}}
--- input
print 'First subscript is ', $[, "\n";
local $SIG{__DIE__} = sub {warn "I cannot die!"};

===
--- dscr: plain evil variables
--- failures: 2
--- params: {prohibit_evil_variables => {variables => '$foo $bar'}}
--- input
my $foo = "I'm evil";
print $bar;

# ## name evil variables with brackets
# ## parms { variables => '${^WIN32_SLOPPY_STAT} %{^_Fubar}' }
# ## failures 2
# ## cut
#
# ${^WIN32_SLOPPY_STAT} and print "We are being sloppy\n";
# our %{^_Fubar};
#
# #-----------------------------------------------------------------------------
#
# ## name subscripted evil variables with brackets
# ## parms { variables => '%{^_Fubar}' }
# ## failures 1
# ## cut
#
# print "The value of \${^_Fubar}{baz} is ", ${^_Fubar}{baz}, "\n";
#
# #-----------------------------------------------------------------------------
#
# ## name No evil variables
# ## parms {variables => '$[ $SIG{__DIE__}'}
# ## failures 0
# ## cut
#
# print 'Perl version is ', $], "\n";
# local $SIG{__WARN__} = sub {print {STDERR} "Danger Will Robinson!\n"};
#
# #-----------------------------------------------------------------------------
#
# ## name 2 evil variables, with pattern matching
# ## parms { variables => '/\[/ /\bSIG\b/ ' }
# ## failures 2
# ## cut
#
# print 'First subscript is ', $[, "\n";
# local $SIG{__DIE__} = sub {warn "I cannot die!"};
#
# #-----------------------------------------------------------------------------
#
# ## name More evil variables, with mixed config
# ## parms { variables => ' $[ /\bSIG\b/ $^S' }
# ## failures 5
# ## cut
#
# print 'First subscript is ', $[, "\n";
# local $SIG{__DIE__} = sub {warn "I cannot die!"};
# print $^S ? 'Executing eval' : defined $^S ? 'Otherwise' : 'Parsing';
# local $SIG{__WARN__} = sub {print {STDERR} "Danger, Will Robinson!\n";
#
# #-----------------------------------------------------------------------------
#
# ## name Recognize use of elements of evil arrays and hashes
# ## parms { variables => '%SIG @INC' }
# ## failures 2
# ## cut
#
# local $SIG{__DIE__} = sub {warn "I cannot die!"};
# print '$INC[0] is ', $INC[0], "\n";
#
# #-----------------------------------------------------------------------------
#
# ## name Regexes with modifiers
# ## parms { variables => ' /(?x: \b SIG \b )/ /(?i:\binc\b)/ /(?ix: acme )/ ' }
# ## failures 4
# ## cut
#
# local $SIG{__DIE__} = sub {warn "I cannot die!"};
# print '$INC[0] is ', $INC[0], "\n";
# print '$inc[0] is ', $inc[0], "\n";
# my $Acme = 'For the discerning coyote';
#
# #-----------------------------------------------------------------------------
#
# ## name More evil variables, with more pattern matching
# ## parms { variables => '/foo|bar|baz/ ' }
# ## failures 4
# ## cut
#
# my $foo;
# my $bar;
# my $baz;
# my $foonly;
#
# #-----------------------------------------------------------------------------
#
# ## name Pattern matching exceptions
# ## parms { variables => '/(/' }
# ## failures 0
# ## error /invalid regular expression/
# ## cut
#
# print 'Hello World';
#
# #-----------------------------------------------------------------------------
#
# ## name Providing the description for variables, no regular expressions.
# ## parms { variables => q'$[ {Found use of $[. Code for first index = 0 instead} $SIG{__DIE__} <Found use of $SIG{__DIE__}. Use END{} or override CORE::GLOBAL::die instead>' }
# ## failures 2
# ## cut
#
# print 'First subscript is ', $[, "\n";
# local $SIG{__DIE__} = sub {warn "I cannot die!"};
#
# #-----------------------------------------------------------------------------
#
# ## name Providing the description for variables, regular expressions.
# ## parms { variables => q' /\bSIG\b/ {Found use of SIG. Do not use signals} /\bINC\b/ {Found use of INC. Do not manipulate @INC directly} ' }
# ## failures 2
# ## cut
#
# local $SIG{__DIE__} = sub {warn "I cannot die!"};
# print '$INC[0] is ', $INC[0], "\n";
#
# #-----------------------------------------------------------------------------
#
# ## name Providing the description for variables, regular expressions with modifiers.
# ## parms { variables => ' /(?x: \b SIG \b )/{We do not like signals.} /(?i:\binc\b)/[Do not fiddle with INC, no mater how it is capitalized] ' }
# ## failures 3
# ## cut
#
# local $SIG{__DIE__} = sub {warn "I cannot die!"};
# print '$INC[0] is ', $INC[0], "\n";
# print '$inc[0] is ', $inc[0], "\n";
#
# #-----------------------------------------------------------------------------
#
# ## name Providing the description for variables from file, no regular expressions.
# ## parms { variables_file => 't/Variables/ProhibitEvilVariables.d/variables-no-regular-expressions.txt' }
# ## failures 4
# ## cut
#
# print 'First subscript is ', $[, "\n";
# local $SIG{__DIE__} = sub {warn "I cannot die!"};
# print $^S ? 'Executing eval' : defined $^S ? 'Otherwise' : 'Parsing';
#
# #-----------------------------------------------------------------------------
#
# ## name Providing the description for variables from file, regular expressions.
# ## parms { variables_file => 't/Variables/ProhibitEvilVariables.d/variables-regular-expressions.txt' }
# ## failures 4
# ## cut
#
# print 'First subscript is ', $[, "\n";
# local $SIG{__DIE__} = sub {warn "I cannot die!"};
# print $^S ? 'Executing eval' : defined $^S ? 'Otherwise' : 'Parsing';
#
