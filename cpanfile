requires "Class::Accessor::Fast";
requires "Data::Validator";
requires "MongoDB";
requires "Plack";
requires "Plack::Builder";
requires "Plack::Middleware::Static";
requires "Plack::Response";
requires "Router::Simple::Sinatraish";
requires "Text::Xslate";
requires "URI";
requires "Web::Scraper";
requires "boolean";
requires "common::sense";

on test => sub {
    requires "Test::Deep";
    requires "Test::Harness";
    requires "Test::More";
    requires "Test::Pretty";
};

on dev => sub {
    requires "Data::Dumper";
};
