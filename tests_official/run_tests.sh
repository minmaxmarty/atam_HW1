#!/bin/bash

# This script runs all tests by assembling the solution and the test together.

solution=$1
tests_folder=$2

if [ -z "$solution" ] || [ -z "$tests_folder" ]; then
    echo "Usage: $0 <solution_file.asm> <tests_folder>"
    exit 1
fi

# Track failures
fail_count=0
failed_tests=()

# Iterate over all .asm test files
for testfile in "$tests_folder"/*.asm; do
    echo "Running test: $(basename "$testfile")"

    # Assemble solution and test together
    as "$solution" "$testfile" -o merged.o
    if [ $? -ne 0 ]; then
        echo "Failed to assemble solution + test: $testfile"
        fail_count=$((fail_count + 1))
        failed_tests+=("$(basename "$testfile")")
        continue
    fi

    # Link
    ld merged.o -o merged.out
    if [ $? -ne 0 ]; then
        echo "Failed to link merged.o for test: $testfile"
        fail_count=$((fail_count + 1))
        failed_tests+=("$(basename "$testfile")")
        continue
    fi

    # Run with timeout
    timeout 60s ./merged.out
    if [ $? -eq 0 ]; then
        echo -e "$(basename "$testfile") : \033[32mPASS\033[0m"
    else
        echo -e "$(basename "$testfile") : \033[31mFAIL\033[0m"
        fail_count=$((fail_count + 1))
        failed_tests+=("$(basename "$testfile")")
    fi
done

# Clean up
rm -f merged.*

# Summary
echo
echo "======================================="
echo "Total failed tests: $fail_count"
if [ $fail_count -ne 0 ]; then
    echo "Failed tests:"
    for test in "${failed_tests[@]}"; do
        echo "- $test"
    done
fi
echo "======================================="
