#!/usr/bin/env perl

use Mojolicious::Lite;

plugin 'Materialize';

get '/' => sub {
	my $self = shift;
	$self->render('demo');
};

app->start;

__DATA__

@@ demo.html.ep
% layout 'default';
% title 'Mojolicious::Plugin::Materialize demo';

<h1><%= title %></h1>

<h2>Buttons</h2>

<h3>Button with label</h3>
<pre>
%%= MD_button label => 'Button with only Label';
</pre>
%= MD_button label => 'Button with only Label';

<pre>
%%= MD_button label => 'Button with \'cloud\' icon on the left', icon => 'cloud', icon_pos => 'left', color => 'blue';
</pre>
%= MD_button label => 'Button with \'cloud\' icon on the left', icon => 'cloud', icon_pos => 'left', color => 'blue';

<pre>
%%= MD_button label => 'Button with \'call\' icon on the right', icon => 'call', icon_pos => 'right', color => 'green';
</pre>
%= MD_button label => 'Button with \'call\' icon on the right', icon => 'call', icon_pos => 'right', color => 'green';

<h3>Floating Button with icon</h3>

<pre>
%%= MD_button type => 'floating', color => 'red', icon => 'mode_edit';
</pre>
%= MD_button type => 'floating', color => 'red', icon => 'mode_edit';

<pre>
%%= MD_button type => 'floating', color => 'yellow', size => 'large', icon => 'add';
</pre>
%= MD_button type => 'floating', color => 'yellow', size => 'large', icon => 'add';

@@ layouts/default.html.ep
<!DOCTYPE html>
<html>
    <head>
    <title><%= title %></title>
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.2/css/materialize.min.css">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.2/js/materialize.min.js"></script>
    </head>
    <body>
    <%= content %>
    </body>
</html>
