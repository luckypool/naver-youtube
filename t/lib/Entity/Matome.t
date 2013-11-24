use common::sense;
use Test::More;
use Test::Deep;

my $class;
BEGIN {
    use_ok $class='Ivy::Entity::Matome';
}

subtest 'basic' => sub {
    my $params = {url=>'aaa', videos=>[qw/a b c/]};
    my $entity = new_ok $class, [$params];
    cmp_deeply $entity->to_plain_object, $params;
};

done_testing;
