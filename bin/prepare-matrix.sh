#!/bin/bash

# A script to dynamically prepare a test matrix based on Git changes.
# It outputs a JSON array of languages to test.

# Exit immediately if a command exits with a non-zero status.
set -e

# The event name is passed as the first argument.
EVENT_NAME="$1"
BASE_REF="$2"

# Define the full list of languages for a full test run.
FULL_LANGUAGE_LIST=(
    "AWK"
    "Bash"
    "Clojure"
    "Common LISP"
    "Crystal"
    "C"
    "C++"
    "C#"
    "Elixir"
    "Elm"
    "Erlang"
    "Fortran"
    "F#"
    "Gleam"
    "Go"
    "Groovy"
    "Haskell"
    "Java"
    "JavaScript"
    "jq"
    "Julia"
    "Kotlin"
    "MIPS Assembly"
    "Nim"
    "Perl"
    "PowerShell"
    "Prolog"
    "Python"
    "R"
    "Ruby"
    "Rust"
    "Scheme"
    "Scala"
    "Standard ML"
    "Swift"
    "Tcl"
    "TypeScript"
    "WebAssembly"
    "Zig"
)

# Define a mapping from the folder name to the full language name.
# This ensures that the matrix names are correct even if the folder names are
# different (e.g., "mips" folder maps to "MIPS Assembly").
declare -A MAPPINGS=(
    ["awk"]="AWK"
    ["bash"]="Bash"
    ["clojure"]="Clojure"
    ["common-lisp"]="Common LISP"
    ["crystal"]="Crystal"
    ["c"]="C"
    ["cpp"]="C++"
    ["csharp"]="C#"
    ["elixir"]="Elixir"
    ["elm"]="Elm"
    ["erlang"]="Erlang"
    ["fortran"]="Fortran"
    ["fsharp"]="F#"
    ["gleam"]="Gleam"
    ["go"]="Go"
    ["groovy"]="Groovy"
    ["haskell"]="Haskell"
    ["java"]="Java"
    ["javascript"]="JavaScript"
    ["jq"]="jq"
    ["julia"]="Julia"
    ["kotlin"]="Kotlin"
    ["mips"]="MIPS Assembly"
    ["nim"]="Nim"
    ["perl5"]="Perl"
    ["powershell"]="PowerShell"
    ["prolog"]="Prolog"
    ["python"]="Python"
    ["r"]="R"
    ["ruby"]="Ruby"
    ["rust"]="Rust"
    ["scheme"]="Scheme"
    ["scala"]="Scala"
    ["sml"]="Standard ML"
    ["swift"]="Swift"
    ["tcl"]="Tcl"
    ["typescript"]="TypeScript"
    ["wasm"]="WebAssembly"
    ["zig"]="Zig"
)

# Check if the event is a scheduled workflow.
if [[ "$EVENT_NAME" == "schedule" ]]; then
    echo "Running on a schedule, preparing a full matrix." >&2
    LANGUAGES_TO_TEST=("${FULL_LANGUAGE_LIST[@]}")
else
    echo "Running on a push or pull_request, detecting changes." >&2

    # Determine the base for the diff.
    if [[ "$EVENT_NAME" == "pull_request" ]]; then
        # For a PR, diff against the base branch.
        # Try the base ref as-is first, then try with origin/ prefix
        if git rev-parse --verify "$BASE_REF" >/dev/null 2>&1; then
            BASE_SHA=$(git rev-parse "$BASE_REF")
        elif git rev-parse --verify "origin/$BASE_REF" >/dev/null 2>&1; then
            BASE_SHA=$(git rev-parse "origin/$BASE_REF")
        else
            echo "Error: Could not resolve base reference: $BASE_REF" >&2
            exit 1
        fi
    else
        # For a push, diff against the previous commit on the same branch.
        BASE_SHA=$(git rev-parse HEAD~1)
    fi

    # Get the list of changed files from the last commit.
    # Using mapfile to correctly handle filenames with spaces.
    mapfile -t CHANGED_FILES < <(git diff --name-only "$BASE_SHA")

    LANGUAGES_TO_TEST=()

    # Check for changes in key directories that should trigger a full build.
    for file in "${CHANGED_FILES[@]}"; do
        if [[ "$file" == "bin/"* ]] || [[ "$file" == ".github/workflows/"* ]]; then
            echo "Changes detected in a shared resource ($file). Preparing a full matrix." >&2
            LANGUAGES_TO_TEST=("${FULL_LANGUAGE_LIST[@]}")
            break
        fi
        # Extract the top-level directory (language folder).
        DIR=$(echo "$file" | cut -d'/' -f1)

        # Check if the directory is a known language folder
        if [[ -n "$DIR" ]]; then
            if [[ -v MAPPINGS["$DIR"] ]]; then
                LANGUAGES_TO_TEST+=("${MAPPINGS["$DIR"]}")
            fi
        fi
    done

    if [[ ${#LANGUAGES_TO_TEST[@]} -eq 0 ]]; then
        # If no relevant changes found, add a placeholder to create an empty matrix.
        # The matrix will have no jobs, so no tests run.
        LANGUAGES_TO_TEST=("")
    else
        # Remove duplicates and prepare the final list.
        mapfile -t sorted_unique_languages < <(printf "%s\n" "${LANGUAGES_TO_TEST[@]}" | sort -u)
        LANGUAGES_TO_TEST=("${sorted_unique_languages[@]}")
    fi
fi

# Convert the array to a JSON string for the matrix output.
# The placeholder "" from the empty case becomes "[]", a valid empty JSON array.
if [[ ${#LANGUAGES_TO_TEST[@]} -eq 1 && "${LANGUAGES_TO_TEST[0]}" == "" ]]; then
    json_languages="[]"
else
    json_languages="[$(printf '"%s",' "${LANGUAGES_TO_TEST[@]}" | sed 's/,$//')]"
fi

echo "$json_languages" >&1
