use ExtUtils::MakeMaker;
WriteMakefile(
    NAME         => 'Text::Rhombus',
    VERSION_FROM => 'lib/Text/Rhombus.pm',
    PREREQ_PM    => { Exporter => 0 },
    ($] >= 5.005 
      ? (ABSTRACT_FROM => 'lib/Text/Rhombus.pm') : ()
    ),
);
