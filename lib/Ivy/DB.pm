package Ivy::DB;
use common::sense;
use parent qw/Class::Accessor::Fast/;
use MongoDB;
use Data::Validator;

__PACKAGE__->mk_ro_accessors(qw/client db collection/);

sub new {
    my $class = shift;

    state $rule = Data::Validator->new(
        collection => { isa => 'Str' },
    )->with('Sequenced');
    my $option = $rule->validate(@_);

    my $client = MongoDB::MongoClient->new(
        host => 'localhost',
        port => 27017,
    );
    my $database   = $client->get_database('main');
    my $collection = $database->get_collection($option->{collection});

    return $class->SUPER::new({
        client     => $client,
        db         => $database,
        collection => $collection,
    });
}

1;
__END__
