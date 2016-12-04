#!/usr/bin/env perl

use Getopt::Std;


getopts('thr:');

print <<USO if $opt_h;
Uso:
    sorteio [opções] <arquivo de nomes>

Opções:
    -t       : Apenas mostra um sorteio.
               Não gera mensagens.
    -r [num] : Usa essa semente

    -h       : help

As opções podem ser agrupadas, por exemplo:
    sorteio -th nomes

O arquivo de nomes consiste de várias linhas onde cada
linha tem um nome seguido pelo endereço eletrônico.

USO

undef $/;
if (defined $opt_r)
{
    $rseed=$opt_r;
}
else
{
    $rseed=time();
}
srand($rseed);
$_= <>;
my %nomes  = split(/\n/);		# terse, heh?

# nomes e parceiros
my @aux = keys %nomes;
my @p=();

# sorteia 
while (@aux) {
    push @p, splice @aux, @aux * rand,1; #Pega um elemento aleatório e coloca em p
}
push @p, $p[0];

# manda as mensagens

format =
 @<<<<<<<<<<<<<<<<<<<<<<<<<<< : @<<<<<<<<<<<<<<<<<<<<<<<<<<<
  $p[$i], $p[$i+1]
.
 
for $i (0 .. ($#p-1)) {
  write if $opt_t;
  next if $opt_t;

  open (M, "| mail $nomes{$p[$i]} -s \"Amigo secreto de $p[$i].\"");
#  open (M, "| less");
  print M <<L ;
Subject: Amigo secreto de $p[$i].
Oi $p[$i], eis o seu amigo secreto:
$p[$i+1]

Guarde essa mensagem, pois não existem cópias dela.
Cuidado para ninguém ver!
.
L
    close M;
}
print "$rseed\n";
