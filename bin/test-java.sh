#!/bin/sh
cd java || exit 1

dirs=$(ls -d -- */)
exit_code=0

# Exercism gradle stuff fails with OpenJDK 22, but runs with 19 and 21 (tested
# on inobook-v2 WSL with Ubuntu 22.04 LTS and AoC Docker image with Ubuntu 23.10
# respectively).
# However, installing OpenJDK 21 in the Docker image broke the Scala/sbt stuff,
# so that was removed and we are sticking with OpenJDK 19 for now.
if [ -d /usr/lib/jvm/java-19-openjdk-amd64 ]; then
	export JAVA_HOME=/usr/lib/jvm/java-19-openjdk-amd64
	echo using JAVA_HOME=$JAVA_HOME
else
	echo "No OpenJDK 19 found"
	exit 1
fi

for dir in $dirs; do
	cd "$dir" || exit 1
	if ! ./gradlew test; then
		exit_code=1
	fi
	cd ..
done

return $exit_code
