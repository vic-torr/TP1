#!/bin/bash
nome_teste="ex"
files=("ex_main" "ex_func" );
echo ${files[@]};
input=201
base_dir=$(pwd)
make_cmd=make
#montador=$base_dir/bin/montador
montador=./bin/montador
rmon="./bin/montador"
echo $rmon;
#emulador=$base_dir/validation/vm
emulador=./validation/vm
remu=./validation/vm
ligador=./bin/ligador

$make_cmd clean
$make_cmd
echo ;
for file in ${files[@]}; do
    echo "$montador ./tst/$file.amv > ./validation/out_$file.o";
    $montador ./tst/$file.amv > ./validation/out_$file.o || echo montagem falhou: $file;
    cat ./validation/out_$file.o
    echo ;
    arquivos_saida+=(./validation/out_$file.o )
done
echo "arquivos_saida: ${arquivos_saida[@]}"
saida_ligador=./validation/out_${files[0]}.mv

echo "$ligador ${arquivos_saida[@]} > $saida_ligador && cat $saida_ligador || echo Ligacao falhou: ${arquivos_saida[@]};
";
#$ligador ${arquivos_saida[@]} || echo Ligacao falhou: ${arquivos_saida[@]}
$ligador ${arquivos_saida[@]} || echo Ligacao falhou: ${arquivos_saida[@]};

#gdb -args $ligador ${arquivos_saida[@]} > $saida_ligador || echo Ligacao falhou: ${arquivos_saida[@]};
#gdb -args $ligador ${arquivos_saida[@]}


saida_emulador=saida_emulador_$nome_teste.txt
echo entradas: $input
echo "$remu  -v $saida_ligador <<< "$input" > $saida_emulador || echo emulacao falhou: $saida_ligador"
echo "Saida Ligador:"
cat $saida_ligador;
echo;
$remu  -v $saida_ligador <<< "$input" > $saida_emulador || echo emulacao falhou: $saida_ligador;
cat $saida_emulador; 
 
 
