use common::sense;
use Test::More;
use Test::Deep;

my $class;
BEGIN {
    use_ok $class='Ivy::Adapter::Scraper';
}

subtest 'basic' => sub {
    ok my $res = $class->scrape('http://matome.naver.jp/odai/2132631999432112601');
    cmp_deeply $res, array_each(isa('URI'));
    ok my $res = $class->scrape('http://matome.naver.jp/odai/2138447683310091501');
    cmp_deeply $res, array_each(isa('URI'));
};

done_testing;
