#!perl

use Test::More tests => 6;

use_ok( 'HTML::ExtractMain', 'extract_main_html' );

local $SIG{__WARN__} = sub { };

is( extract_main_html(),   undef, 'need defined content' );
is( extract_main_html(''), undef, 'need non-empty content' );

my $html = <<'END';
<div id="header">Header!</div>
<div id="nav"><a href="/">Home</a></div>
<div id="body">
    <p>Foo, bar.</p>
    <p>Bar</p>
</div>
<div id="footer">Footer</div>
END

my $r = extract_main_html($html);
chomp $r if $r;
is( $r,
    '<div id="body"><p>Foo, bar.</p><p>Bar</p></div>',
    'main body extracted' );

is( extract_main_html('<p>Hi!</p>'), '<p>Hi!</p>', 'simple content works' );

#------------------------------------------------------------------------------
# with HTML::TreeBuilder input

{
  require HTML::TreeBuilder;
  my $simple = '<p>Hi!</p>';
  my $tree = HTML::TreeBuilder->new_from_content($simple);
  my $got = extract_main_html($tree);
  is ($got, $simple, 'simple content as TreeBuilder');
}


#------------------------------------------------------------------------------

# Local Variables:
# mode: perltidy
# End:
