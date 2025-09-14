#!/bin/bash
LANGUAGE="$1"
if [[ -z "$LANGUAGE" ]]; then
    echo "Error: No language specified."
    echo "Usage: ./bin/test.sh \"<language>\""
    exit 1
fi

case "$LANGUAGE" in
"C++")
    ./bin/test-cpp.sh
    ;;
"C#")
    ./bin/test-dotnet.sh csharp
    ;;
"F#")
    ./bin/test-dotnet.sh fsharp
    ;;
*)
    LANG=$(echo "$LANGUAGE" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
    ./bin/test-"$LANG".sh
    ;;
esac
