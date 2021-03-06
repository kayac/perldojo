package Dojo::Models;
use strict;
use warnings;
use Ark::Models '-base';
use Carp;
use Dojo::Model::Gravatar;

register Questions => sub {
    my ($self) = @_;

    $self->ensure_class_loaded('Dojo::Model::Questions');
    Dojo::Model::Questions->new;
};

register AnswerSheet => sub {
    my ($self) = @_;

    $self->ensure_class_loaded('Dojo::Model::AnswerSheet');
    Dojo::Model::AnswerSheet->new;
};


register Storage => sub {
    my ($self) = @_;
    $self->ensure_class_loaded("Dojo::Model::Storage");

    my $args = $self->get('conf')->{storage}->{backend};
    croak "config.storage.backend required" unless $args;

    Dojo::Model::Storage->new(
        backend => $self->adaptor($args),
    );
};

1;

