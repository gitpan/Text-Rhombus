use ExtUtils::MakeMaker;
WriteMakefile(
    DISTNAME     => 'Text-Rhombus',
    NAME         => 'Text::Rhombus',
    VERSION_FROM => 'lib/Text/Rhombus.pm',
    PREREQ_PM    => { Exporter => 0 },
    'dist'       => { COMPRESS => 'gzip', SUFFIX => 'gz' },
    ($] >= 5.005 
      ? (ABSTRACT_FROM => 'lib/Text/Rhombus.pm') : ()
    ),
);
