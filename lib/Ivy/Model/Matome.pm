package Ivy::Model::Matome;
use common::sense;
use boolean;
use Ivy::Entity::Matome;
use Ivy::DB;
use Data::Validator;

use parent qw/Class::Accessor::Fast/;
__PACKAGE__->mk_accessors(qw/db/);

sub new {
    my $class = shift;
    my $db = Ivy::DB->new({collection=>'matome'});
    return $class->SUPER::new({
        db => $db,
    });
}

sub create {
    my $self = shift;
    state $rule = Data::Validator->new(
        entity => { isa => 'Ivy::Entity::Matome' },
    )->with('Sequenced');
    my $option = $rule->validate(@_);
    $self->db->collection->insert($option->{entity}->to_plain_object);
}

sub lookup {
    my $self = shift;
    state $rule = Data::Validator->new(
        url => { isa => 'Str' },
    )->with('Sequenced');
    my $option = $rule->validate(@_);
    my $res = $self->db->collection->find_one({url=>$option->{url}});
    return unless $res;
    Ivy::Entity::Matome->new($res);
}

sub update {
    my $self = shift;
    state $rule = Data::Validator->new(
        entity => { isa => 'Ivy::Entity::Matome' },
    )->with('Sequenced');
    my $option = $rule->validate(@_);
    my $entity = $option->{entity};
    $self->db->collection->update({url=>$entity->url}, $entity->to_plain_object);
}

sub delete {
    my $self = shift;
    state $rule = Data::Validator->new(
        url => { isa => 'Str' },
    )->with('Sequenced');
    my $option = $rule->validate(@_);
    $self->db->collection->remove({url=>$option->{url}});
}

1;
__END__
