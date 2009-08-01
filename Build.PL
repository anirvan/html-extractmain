use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
                       module_name => 'HTML::ExtractMain',
                       license     => 'perl',
                       dist_author => 'Anirvan Chatterjee <anirvan@cpan.org>',
                       dist_version_from => 'lib/HTML/ExtractMain.pm',
                       build_requires    => {
                                           'Carp'              => 0,
                                           'HTML::TreeBuilder' => 3.23,
                                           'Scalar::Util'      => 1.18,
                                           'Test::More'        => 0,
                       },
                       add_to_cleanup     => ['HTML-ExtractMain-*'],
                       create_makefile_pl => 'traditional',
);

$builder->create_build_script();

# Local Variables:
# mode: perltidy
# End:
