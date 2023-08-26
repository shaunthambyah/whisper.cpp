#!/bin/bash

# Define the command
command="./main"
source_command=""
play_command=""

# Iterate through the arguments and build the command
for arg in "$@"; do
    

    # Check if the argument is "-f"
    if [ "$arg" = "-f" ]; then
        # Get the next argument and construct the source command
        next_arg="yes"
    elif [ -n "$next_arg" ]; then
        wts_file="${arg}.wts"
        mp4_file="${arg}.mp4"
        source_command="source \"$wts_file\""
        play_command="ffplay \"$mp4_file\""
        next_arg=""
    fi

    arg="\"$arg\""
    command="$command $arg"
done

# Print the final command
echo "Running command: $command"

eval "$command"

echo "Running command: $source_command"

eval "$source_command"

echo "Running command: $play_command"

eval "$play_command"
