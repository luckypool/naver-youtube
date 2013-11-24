use common::sense;
use Test::More;
use Test::Deep;
use Ivy::Entity::Matome;
use Data::Dumper;

my $class;
BEGIN {
    use_ok $class='Ivy::Model::Matome';
}

my $model = new_ok $class;
my $url   = 'dummy';
my $videos = [qw|
    dcZ4IPOAJo4
    w9eegNYLd_c
    -NxFVrEG3rk
    QPeWFIZbiP0
    Ja2x1fy32Js
    KfgiQJso6xI
    HN_LQHvLrm0
    b4dxv_73ZbE
    31wt9hQivxQ
    N0r1434e53E
|];

subtest 'crud' => sub {
    my $entity = Ivy::Entity::Matome->new({
        url    => $url,
        videos => $videos,
    });
    ok my $res = $model->create($entity);
    isa_ok $res, 'MongoDB::OID';

    ok my $lookup = $model->lookup({url=>$url});
    cmp_deeply $lookup->to_plain_object, {%{$entity->to_plain_object},_id=>$res->value};

    my $new_entity = Ivy::Entity::Matome->new({
        url    => $url,
        videos => [],
    });
    ok $model->update($new_entity);

    ok my $new_lookup = $model->lookup({url=>$url});
    cmp_deeply $new_lookup->to_plain_object, {
        %{$new_entity->to_plain_object},
        _id => $res->value,
    };

    ok $model->delete({url=>$url});
    is $model->lookup({url=>$url}), undef;
};

done_testing;
