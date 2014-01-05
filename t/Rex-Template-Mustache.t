use strict;
use warnings;

use Test::More tests => 4;

use_ok 'Rex';
use_ok 'Rex::Template::Mustache';

Rex->import("-base");
Rex::Template::Mustache->import;

file("test.txt", content => template('test.mustache', game => "rex"));

my ($ok) = grep { /The name is the rex/ } cat("test.txt");

ok($ok, "template written");

file("test2.txt",
   content => template('@foo.txt.tpl', name => "barbaz"));

my ($ok2) = grep { /The name is: barbaz/ } cat("test2.txt");

ok($ok2, "template from __DATA__ written");

unlink("test.txt");
unlink("test2.txt");

__DATA__

@foo.txt.tpl
This is an other Template
The name is: {{name}}
@end



