#!/bin/bash

# Function to display help message
show_help() {
  echo "Usage: $0 [-n] [-v] SEARCH_STRING FILE"
  echo ""
  echo "Options:"
  echo "  -n        Show line numbers with matches"
  echo "  -v        Invert match (show non-matching lines)"
  echo "  --help    Show this help message"
  exit 0
}

# Default options
show_line_numbers=false
invert_match=false

# Parse command-line options
while getopts ":nv" opt; do
  case $opt in
    n) show_line_numbers=true ;;
    v) invert_match=true ;;
    \?) echo "Error: Invalid option -$OPTARG"; show_help ;;
  esac
done

# Shift parsed options
shift $((OPTIND - 1))

# Handle --help separately
if [[ "$1" == "--help" ]]; then
  show_help
fi

# Validate arguments
search_string="$1"
file="$2"

if [[ -z "$search_string" || -z "$file" ]]; then
  echo "Error: Missing search string or file."
  show_help
fi

if [[ ! -f "$file" ]]; then
  echo "Error: File '$file' does not exist."
  exit 1
fi

# Process file line by line
line_number=0
while IFS= read -r line; do
  ((line_number++))
  
  if echo "$line" | grep -iqF "$search_string"; then
    matched=true
  else
    matched=false
  fi

  if $invert_match; then
    matched=$(! $matched && echo true || echo false)
  fi

  if [[ "$matched" == true ]]; then
    if $show_line_numbers; then
      printf "%d:%s\n" "$line_number" "$line"
    else
      echo "$line"
    fi
  fi

done < "$file"