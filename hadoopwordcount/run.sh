#!/bin/bash

hdfs dfs -rm -r /input 1 > /dev/null 2>&1
hdfs dfs -mkdir /input 1 > /dev/null 2>&1
hdfs dfs -copyFromLocal novel.txt /input/ 1 > /dev/null 2>&1
hdfs dfs -rm -r /output 1 > /dev/null 2>&1
echo "Start:" `date`
hadoop jar word_count_mr-0.0.1-SNAPSHOT.jar org.led.hadoop.word_count.WordCount /input /output 1 > /dev/null 2>&1
echo "Stop:"  `date`
hdfs dfs -copyToLocal /output mr_output
hdfs dfs -rm -r /output


