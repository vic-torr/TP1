#!/bin/bash

ls test_ex.sh test_fibo.sh test_median.sh test_op_arit.sh test_op_bit.sh

for file in $(ls test_ex.sh test_fibo.sh test_median.sh test_op_arit.sh test_op_bit.sh);
do
 /bin/bash ./$file;
done
