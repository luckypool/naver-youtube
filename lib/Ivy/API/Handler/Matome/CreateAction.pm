package Ivy::API::Handler::Matome::CreateAction;
use common::sense;
use parent qw/Plack::Component/;
use Plack::Response;

sub call {
    my ($self, $env) = @_;

    my $res = Plack::Response->new(200);
    $res->content_type('text/html');
    $res->body("Hello World");

    return $res->finalize;
}

1;
__END__
