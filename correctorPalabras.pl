#!/usr/bin/perl
#Autores: Hernández Hernández Gonzalo y Hernández Rivera Ángel Edmundo
#Fecha: 23-Octubre-2020
#Materia: Análisis de algoritmos 3CV4
#----------------------Corrector de palabras------------------------

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

print("lineas=$lineas palabras=$palabras caracteres=$caracteres\n");

#Pasar todas las palabras del archivo leído a minúsculas
for(my $i = 0; $i<scalar(@diccionario); $i++){
    @diccionario[$i] = lc(@diccionario[$i]);
}

#Palabra a buscar
my $cades = "Hola";
@cad1 = cadena_caracteres($cades);
my $tam = scalar(@cad1);
#Verificar el tamaño de la cadena para saber con que cadenas comparar
my $j = 0;
while($j<scalar(@diccionario)){
    my $tamDic = length(@diccionario[$j]);
    #Se compara el tamaño de la cadena a buscar con la cadena a comparar del diccionario y si no cumple con el ± 2 se pasa de largo
    if($tamDic >= ($tam - 2) && $tamDic <= ($tam + 2)){
        print("Palabra correcta: " . @diccionario[$j]);
        print("\n");
        $j++;
    }else{
        print("Palabra incorrecta: " . @diccionario[$j]);
        print("\n");
        $j++;
    }
}

#Función para pasar una cadena a un arreglo de caracteres
sub cadena_caracteres{
    my $cad = @_[0];
    my @car = split(//, $cad);
    return @car;
}

#Función para comparar los arreglos de caracteres
sub comparar_caracteres{
    #Cadena del diccionario
    my @arregloUno = @_[0];
    #Cadena a comparar
    my @arregloDos = @_[1];
    

}