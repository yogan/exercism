#!/bin/sh
JAR=$(dirname "$0")/mars.jar
java -jar "$JAR" nc runner.mips impl.mips
