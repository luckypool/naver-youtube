package Ivy::Adapter::Scraper;
use common::sense;
use URI;
use Web::Scraper;

my $scraper = scraper {
    process "a.mdMTMWidget01ItemVideo01Play01", "links[]" => '@href';
};

my $pager = scraper {
    process "div.MdPagination03 a", "pages" => 'TEXT';
};

sub scrape {
    my ($self, $url) = @_;
    my $uri = URI->new($url);
    return [] unless $uri->host eq 'matome.naver.jp';
    my $res = $pager->scrape($uri);
    return [
        map { @{$_->{links}} }
        map {
            my $target_uri = $uri->clone;
            $target_uri->query_form(page=>$_);
            $scraper->scrape($target_uri);
        } (1, @{$res->{pages}})
    ];
}


1;
__END__

=encoding utf8

=head1 NAME

Ivy::Adapter::Scraper -- Naverまとめから youtube のリンクのみを抽出する

=cut
