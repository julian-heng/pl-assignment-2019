# Scripting- Week 5
## Source Code
### BASH
\lstinputlisting[style=code,language=bash]{./5/conf.bash}


### Perl
\lstinputlisting[style=code,language=perl]{./5/conf.perl}


### Ruby
\lstinputlisting[style=code,language=ruby]{./5/conf.ruby}


## Reflection
### BASH

Bash is the first language I've learned. I've had about 2 years experience
writing shell scripts that I know that I can do any programming problem just in
Bash. I also know when that problem is not suitable for Bash.

Bash is very orthogonal. String addition can be done using `printf -v
var_name`, or using `var_name="${str1} Another string ${str2}"`. No integer
data types, all numbers are represented as strings, and Bash can only handle
integer arithmetics using `$(())` in addition to float or integer arithmetics
using external tools using `bc` or `dc`. Bash natively supports regex (`[[
"${str}" =~ ${regex} ]]`) as well as using standard UNIX programs like `grep`
and `awk` to do regex. Thus this can reduce Bash's simplicity and thus makes
shell script harder to read and maintain.

All variables declared in a function scope within Bash is global by default,
unless `local` builtin is specified. By default, that would reduce readability
if that same variable is used in a different function, making it difficult to
trace the flow of the program. Hence structured programming is violated.
However, Bash does not have a keyword for goto, thus structured programming is
not violated in that sense.

Bash's array passing ends up as one giant array in a function, which violates
the preservation of information principal. This will hinder writability as you
can't pass in 2 arrays at a time, unless you do a hack job of giving the sizes
of the arrays as you pass them in.

Bash immediately exits when it detects an invalid syntax within the language,
thus it does not violate the security principle, unlike Python. This helps the
reliability of the script. It is important to note however that it will catch
`[[ condition ]]` syntax errors but not `[ condition ]` because the former is
shell syntax whereas the later is a command or builtin.

```
$ which [
/usr/bin/[
$ type [
[ is a shell builtin
$ type [[
[[ is a shell keyword
```


### Perl

Perl is very hard for me to get used to. It somewhat follows Bash's way of
doing function arguments, in that every argument you pass into a function get
concatenated into a single list accessible via a special variable that expands
to every element (Bash: `$@`, Perl: `@_`) and a way to access each individual
element passed into the function (Bash: `$1 $2 $3 ...`, Perl: `$_[0], $_[1]
...`). But Perl goes one step a bit too far and manage to involve pointers into
it's subroutine. Bash does not do this in that you can technically pass in
multiple arrays, but it's all one big array and you'd just give up and choose a
better language for the job. Unlike Perl which enables you by giving you
pointers, allowing arrays to be passed into subroutines through a nasty
work around. This is in violation of preservation of information.

Perl has no regularity. `print($var);` or `print $var`?  Both. `my $var` or
`my($var)`? Both, again. Semicolons can be omitted, and the code will work.
Sometimes you need the semicolon or else it won't run.  Subroutines can be
called with or without `&` preceding it. I didn't know that you meant to call
it with `&`, but I didn't know because my code works anyway, so who cares.
This makes Perl multitudes harder for readability, as everyone's code will
deviate ever so slightly, and writability for the irregularity in the language.


### Ruby

Initally, Ruby feels just like Python, but as this is my first time writing in
Ruby and my Ruby program is literally one line long, it's not easy to write
about a language I have almost next to no experience with.

Ruby overally feels like an improvement of Perl. It does not take in any ideas
from shell which does not apply well for large scale projects.


## Weekly Question

Which of these languages was hardest to write this program in, and why?

Perl, without a doubt. Initially, it felt very similar to Bash, since it
borrowed a lot of ideas for it initially (arrays are flat in
subroutines/functions, string manipulation, etc). But the more I wrote my
program in Perl, the more it's lack of syntax uniformity and regularity put me
off completely. The added complexity pasted onto of Perl, presented as multiple
options, is not something I desire in a programming language.