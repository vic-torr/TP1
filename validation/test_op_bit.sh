#!/bin/bash

file=operacoes_bit  
input="1\n0"
base_dir=/media/vektor/Data/UFMG/Compiladores/TP1/compilers-tp1
make_cmd=make

montador_dir=$base_dir/montador
montador=$base_dir/montador/bin/montador
rmon=./bin/montador
emulador_dir=$base_dir/emulador
emulador=$base_dir/emulador/bin/vm
remu=./bin/vm

cd $montador_dir && echo cd $montador_dir

$make_cmd clean
$make_cmd
#rm $montador_dir/validation/$file* 2> /dev/null;
$rmon ./tst/$file* > ./validation/out_$file.mv || echo montagem falhou: $file;
cat ./validation/out_$file.mv 
echo cp validation/$file.mv $emulador_dir/tst/out_$file.mv  
cp validation/out_$file.mv $emulador_dir/tst/out_$file.mv  
 
cd $emulador_dir && echo cd $emulador_dir

#$make_cmd clean
#$make_cmd
echo ##rm $emulador_dir/validation/* 2>/dev/null;
##rm $emulador_dir/validation/* 2>/dev/null;
echo entradas: $input
echo Inputs: $input > ./validation/out_$file.mv 
echo "$remu  ./tst/out_$file.mv < $input> ./validation/out_$file.mv || echo emulacao falhou: $file;"
$remu  -v ./tst/out_$file.mv <<< "$input" > ./validation/out_$file.mv || echo emulacao falhou: $file;
cat ./validation/out_$file.mv; 
 
 
