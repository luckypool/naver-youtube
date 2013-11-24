package Ivy::Entity::Matome;
use common::sense;
use parent qw/Class::Accessor::Fast/;
__PACKAGE__->mk_accessors(qw/_id url videos/);

sub to_plain_object {
    my $self = shift;
    return +{
        url    => $self->url,
        videos => $self->videos,
        defined $self->_id ? (_id=>$self->_id->value) : (),
    };
}

1;
__END__
