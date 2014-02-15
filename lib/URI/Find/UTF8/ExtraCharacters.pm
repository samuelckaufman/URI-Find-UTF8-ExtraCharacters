package URI::Find::UTF8::ExtraCharacters;

use strict;
use warnings;
use Data::Dumper::Concise;

use base 'URI::Find::UTF8';

sub uric_set {
    my $self = shift;
    join('', map { quotemeta($_) } @{ $self->{_extra_characters} } )
        . $self->SUPER::uric_set;
}

sub new {
    my($class,$callback,%params) = @_;
    my $extra_characters = $params{extra_characters} || [];
    my $self = $class->SUPER::new($callback);
    $self->{_extra_characters} = $extra_characters;
    return $self;
}
1;
