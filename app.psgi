use common::sense;
use Plack::Builder;
use Ivy::Web;
use Ivy::API::Handler::Matome::CreateAction;
use Ivy::API::Handler::Matome::FindAction;

get '/matome' => builder {
    Ivy::API::Handler::Matome::FindAction->new;
};

post '/matome' => builder {
    Ivy::API::Handler::Matome::CreateAction->new;
};

builder {
    enable "Static",
        path => sub { s!^/static/!! || m!(jpe?g|gif|png|js)$! },
        root => './static';
    Ivy::Web->to_app;
}
