#!/bin/sh


hdfs dfs -rm -r /input 1 > /dev/null 2>&1
hdfs dfs -mkdir /input 1 > /dev/null 2>&1
hdfs dfs -copyFromLocal novel.txt /input/ 1 > /dev/null 2>&1
hdfs dfs -rm -r /output 1 > /dev/null 2>&1
echo "Start:" `date`
/opt/spark/default/bin/spark-submit --class org.led.bd.word_count_spark.MainApp --master local[4] word_count_spark-0.0.1-SNAPSHOT.jar 1 > /dev/null 2>&1
echo "Stop:"  `date`
hdfs dfs -copyToLocal /output spark_output 
hdfs dfs -rm -r /output 
