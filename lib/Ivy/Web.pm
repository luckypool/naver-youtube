package Ivy::Web;
use common::sense;
use Router::Simple::Sinatraish;

sub import {
    Router::Simple::Sinatraish->export_to_level(1);
}

sub to_app {
    my ($class) = caller(0);
    return sub {
        my $env = shift;
        if (my $route = $class->router->match($env)) {
            return $route->{code}->($env);
        } else {
            return [404, [], ['not found']];
        }
    };
}

1;
__END__
