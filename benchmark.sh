#bin/bash
name=benchmark
if [[ -e $name.txt ]] ; then
    i=0
    while [[ -e $name-$i.txt ]] ; do
        let i++
    done
    name=$name-$i
fi
touch "$name".txt
 > benchmark.txt
echo "Starting Temp" >> $name.txt
vcgencmd measure_temp | tee -a $name.txt
echo "Test 1" >> $name.txt
sysbench --test=cpu --cpu-max-prime=20000 --num-threads=4 run | grep execution\ time >> $name.txt
echo "Temp Post test 1" >> $name.txt
vcgencmd measure_temp | tee -a $name.txt
echo "Test 2"  >> $name.txt
sysbench --test=cpu --cpu-max-prime=20000 --num-threads=4 run | grep execution\ time >> $name.txt
echo "Temp Post test 2" >> $name.txt
vcgencmd measure_temp | tee -a $name.txt
echo "Test 3"  >> $name.txt
sysbench --test=cpu --cpu-max-prime=20000 --num-threads=4 run | grep execution\ time >> $name.txt
echo "Temp Post test 3" >> $name.txt
vcgencmd measure_temp | tee -a $name.txt
echo "Test 4"  >> $name.txt
sysbench --test=cpu --cpu-max-prime=20000 --num-threads=4 run | grep execution\ time >> $name.txt
echo "Temp Post test 4" >> $name.txt
vcgencmd measure_temp | tee -a $name.txt
echo "Test 5"  >> $name.txt
sysbench --test=cpu --cpu-max-prime=20000 --num-threads=4 run | grep execution\ time >> $name.txt
echo "Final Temp" >> $name.txt
vcgencmd measure_temp | tee -a $name.txt
echo "OI IM DONE BITCH"

