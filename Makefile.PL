use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    DISTNAME     => 'Text-Rhombus',
    NAME         => 'Text::Rhombus',
    VERSION_FROM => 'lib/Text/Rhombus.pm',
    PREREQ_PM    => { Exporter => 0 },
    'dist'       => { COMPRESS => 'gzip', SUFFIX => 'gz' },
    ($] >= 5.005 ? 
       (ABSTRACT_FROM => 'lib/Text/Rhombus.pm',
        AUTHOR        => 'Steven Schubiger') : ()),
);
