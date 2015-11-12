package Mojolicious::Plugin::Materialize;

=encoding utf8

=head1 NAME

Mojolicious::Plugin::Materialize - Mojolicious Plugin for Materialize framework

=head1 SYNOPSIS

    # Mojolicious
    $self->plugin('Materialize');

    # Mojolicious::Lite
    plugin 'Materialize';

=head1 DESCRIPTION

L<< Mojolicious::Plugin::Materialize >> is a L<< Mojolicious >> plugin.

=cut

use Mojo::Base 'Mojolicious::Plugin';
use Mojo::ByteStream;

our $VERSION = '0.1';

=head1 METHODS

L<Mojolicious::Plugin::Materialize> inherits all methods from
L<Mojolicious::Plugin> and implements the following new ones.

=head2 register

    $plugin->register(Mojolicious->new);

Register plugin in L<Mojolicious> application.

=cut

sub register 
{
    my ($self, $app) = @_;
    
    $app->helper(MD_button     => sub { md_button(@_)    });
}

=head2 md_button

    %= MD_button label => 'Button Label';
    %= MD_button icon => 'add', type => 'fab';

Generates HTML code for Materialize button

=cut

sub md_button
{
    my %attr = @_ % 2 ? (value => shift, @_) : @_;
   
	my $color = ($attr{color} ? " $attr{color}" : ''); 
	my $size = ($attr{size} ? " btn-$attr{size}" : '');
    my $type = ($attr{type} ? 'btn-' . $attr{type} : 'btn');
	my $icon = ($attr{icon} ? md_icon($attr{icon}, $attr{icon_pos}) : '');
    my $inner = $icon . $attr{label};
    my $str = '<a class="' . $type . $color . $size . '">' . $inner . '</a>';
    
    return (Mojo::ByteStream->new($str));
}

=head2 md_icon

=cut

sub md_icon
{
    my ($icon, $pos) = @_;
    
	$pos = (defined $pos ? " $pos" : '');
    my $str = '<i class="material-icons' . $pos . '">' . $icon . '</i>';
    
    return (Mojo::ByteStream->new($str));
}

1;

=head1 AUTHOR

Sébastien Thébert <stt@onetool.pm>

=cut
