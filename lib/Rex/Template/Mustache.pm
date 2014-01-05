package Rex::Template::Mustache;

use strict;
use warnings;

our $VERSION = "0.1";

use Text::Caml;

use Rex -base;

sub import {
	set template_function => sub {
		my ($content, $vars) = @_;
		my $caml = Text::Caml->new();

		return $caml->render($content,$vars);
	}
}
1;
__END__

=head2 NAME

Rex::Template::Mustache - Use Text::Caml with Rex

=head2 SYNOPSIS
Include within your I<Rexfile>

        use Rex::Template::Mustache

        task prepare => sub {
                file "example_file",
                content => mustache("template",
                {
                        var1  => $var1,
                        arr1  => \@arr1,
                        hash1 => \%hash1,
                });
        );

=head2 SEE ALSO

See L<Rex::Template::TT> for the inspiration for this.

=head2 AUTHOR

Richard Fox, E<lt>richard.fox@ahref.co.uk<gt>

=head2 COPYRIGHT AND LICENSE

Copyright (C) 2014 by Richard Fox

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.14.2 or,
at your option, any later version of Perl 5 you may have available.

=cut
