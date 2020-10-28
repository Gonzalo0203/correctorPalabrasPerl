#!/usr/bin/perl
#Autores: Hernández Hernández Gonzalo y Hernández Rivera Ángel Edmundo
#Fecha: 23-Octubre-2020
#Materia: Análisis de algoritmos 3CV4
#----------------------Corrector de palabras------------------------
use utf8;
#Se abre el documento
my $fichero=shift;
open my $FICHERO, $fichero or die "No existe ".$fichero;

my ($lineas, $palabras, $caracteres) = (0,0,0);
my @diccionario;
while (<$FICHERO>) { 
    $lineas++; 
    $caracteres += length($_);
    $palabras += scalar(split(/\s+/, $_));
    my @palabraAux = split(' ', $_);
    push @diccionario, @palabraAux; 
}
close ($FICHERO);

#print("lineas=$lineas palabras=$palabras caracteres=$caracteres\n");

#Pasar todas las palabras del archivo leído a minúsculas
for(my $i = 0; $i<scalar(@diccionario); $i++){
    @diccionario[$i] = lc(@diccionario[$i]);
}
#Palabra a buscar
my $cades = "nuto";
@cad1 = cadena_caracteres(lc($cades));
my $tam = scalar(@cad1);
#Verificar el tamaño de la cadena para saber con que cadenas comparar
my $j = 0;
my $palabrasRecom;
#Ciclo para recorrer las palabras del diccionario
while($j<scalar(@diccionario)){
    my $tamDic = length(@diccionario[$j]);
    my @arregloDic = cadena_caracteres(@diccionario[$j]);
    my $primerLetra = @arregloDic[0];
    my $ultimaLetra = @arregloDic[$tamDic-1];
    my ($numeroIguales, $numeroErrores, $k, $m, $total) = (0,0,0,0,0);
    #Se compara el tamaño de la cadena a buscar con la cadena a comparar del diccionario y si no cumple con el ± 2 se pasa de largo
    if($tamDic >= ($tam - 2) && $tamDic <= ($tam + 2)){
        if(@cad1[0] eq $primerLetra){#Si la cadena a evaluar empata en el primer caracter 
            $k = 0;
            $m = 0;
            while($k<scalar(@arregloDic)){ 
                    my $quivalencia = @arregloDic[$k] eq @cad1[$m];
                    if($quivalencia == 1){ 
                        $k++;
                        $m++;
                        $numeroIguales++;
                    }else{ 
                        $k++;
                        $numeroErrores++;
                    } 
            } 
            if($numeroIguales == $tam){ 
                $palabrasRecom = @diccionario[$j];
            } 
            $j++;
        } 
        elsif(@cad1[$tam-1] eq $ultimaLetra){#Si la cadena a evaluar empata en el ultimo caracter 
                $k = scalar(@arregloDic);
                $m = scalar(@cad1);
                while($k>0){ 
                        my $quivalencia = @arregloDic[$k-1] eq @cad1[$m-1];
                        if($quivalencia == 1){ 
                            $k--;
                            $m--;
                            $numeroIguales++;
                        }else{ 
                            $k--;
                            $numeroErrores++;
                        } 
                } 
                if($numeroIguales == $tam){ 
                    $palabrasRecom = @diccionario[$j];
                } 
                $j++;
        } 
        else{#Si la cadena no empieza con la primer letra de la cadena a evaluar y tampoco termina con la última
            $j++;
        } 
    }else{#En caso de que la cadena tenga una longitud diferente a ± 2 con respecto a la cadena a evaluar 
        $j++;
    }
}
print("Palabra original: $cades");
print("\n");
if(length($palabrasRecom) > 0){
    print("Recomendacion: $palabrasRecom");
}else{
  print("Recomendacion: Ninguna");  
}
#Función para pasar una cadena a un arreglo de caracteres
sub cadena_caracteres{
    my $cad = @_[0];
    my @car = split(//, $cad);
    return @car;
}
