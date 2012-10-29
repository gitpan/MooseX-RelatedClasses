
use strict;
use warnings;

use 5.006;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Parameterized role for related class attributes",
  "AUTHOR" => "Chris Weyl <cweyl\@alumni.drew.edu>",
  "BUILD_REQUIRES" => {
    "File::Find" => 0,
    "File::Temp" => 0,
    "Moose" => 0,
    "Moose::Util::TypeConstraints" => 0,
    "Test::Moose::More" => "0.014",
    "Test::More" => "0.88",
    "strict" => 0,
    "warnings" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "MooseX-RelatedClasses",
  "EXE_FILES" => [],
  "LICENSE" => "lgpl",
  "NAME" => "MooseX::RelatedClasses",
  "PREREQ_PM" => {
    "Moose::Autobox" => 0,
    "MooseX::AttributeShortcuts" => "0.015",
    "MooseX::Role::Parameterized" => 0,
    "MooseX::Traits" => 0,
    "MooseX::Types::Common::String" => 0,
    "MooseX::Types::LoadableClass" => 0,
    "MooseX::Types::Moose" => 0,
    "MooseX::Types::Perl" => 0,
    "MooseX::Util" => 0,
    "String::CamelCase" => 0,
    "String::RewritePrefix" => 0,
    "namespace::autoclean" => 0
  },
  "VERSION" => "0.001",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



