#!/bin/sh
cd java || exit 1

dirs=$(ls -d -- */)
exit_code=0

# Exercism gradle stuff fails with OpenJDK 22, but runs with 21 (AoC Docker
# image with Ubuntu 23.10) and 19 (inobook-v2 WSL with Ubuntu 22.04 LTS).
if [ -d /usr/lib/jvm/java-21-openjdk-amd64 ]; then
  export JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
  echo using JAVA_HOME=$JAVA_HOME
elif [ -d /usr/lib/jvm/java-19-openjdk-amd64 ]; then
  export JAVA_HOME=/usr/lib/jvm/java-19-openjdk-amd64
  echo using JAVA_HOME=$JAVA_HOME
else
  echo "No OpenJDK 19 or 21 found"
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
