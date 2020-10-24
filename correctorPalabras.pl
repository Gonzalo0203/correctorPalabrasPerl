#!/usr/bin/perl
#Autores: Hernández Hernández Gonzalo y Hernández Rivera Ángel Edmundo
#Fecha: 23-Octubre-2020
#Materia: Análisis de algoritmos 3CV4
#----------------------Corrector de palabras------------------------

my $fichero=shift;
open my $FICHERO, $fichero or die "No existe ".$fichero;

my ($lineas, $palabras, $caracteres, $contPalabras) = (0,0,0,0);
my @diccionario;
while (<$FICHERO>) { 
    $lineas++; 
    $caracteres += length($_);
    $palabras += scalar(split(/\s+/, $_));
    $contPalabras = scalar(split(/\s+/, $_));
    my @palabraAux = split(' ', $_);
    push @diccionario, @palabraAux; 
}
close ($FICHERO);

print("lineas=$lineas palabras=$palabras caracteres=$caracteres\n");
for(my $i = 0; $i<scalar(@diccionario); $i++){
    @diccionario[$i] = lc(@diccionario[$i]);
    print (@diccionario[$i]);
    print ("\n");
}

sub cadena_caracteres($cad){
    my @car = split(//, $cad);
    return (@car);
}

my $cades = "Hola";
@carr = &cadena_caracteres("Hola");
print (@carr[0]);
print (@carr[1]);
print (@carr[2]);
print (@carr[3]);