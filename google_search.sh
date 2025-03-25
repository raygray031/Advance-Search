#!/bin/bash

# RayGray Advanced Google Search Script
clear
echo "================================================="
echo "     Advanced Google Search by RayGray"
echo "================================================="

while true; do
  echo ""
  echo "Choose a search option:"
  echo "1. Search by Title (intitle)"
  echo "2. Search by URL (inurl)"
  echo "3. Search by Site (site)"
  echo "4. Search by File Type (filetype)"
  echo "5. Search by Exact Phrase (quotes)"
  echo "6. Search by Related Sites (related)"
  echo "7. Search by Cache Version (cache)"
  echo "8. Custom Query (No Operator)"
  echo "9. Exit"
  echo "================================================="

  # Read user choice
  read -p "Enter your choice (1-9): " choice

  # Check if the user wants to exit
  if [[ "$choice" == "9" ]]; then
    echo "Goodbye!"
    exit 0
  fi

  # Validate input
  if [[ ! "$choice" =~ ^[1-8]$ ]]; then
    echo "Invalid choice. Please enter a number between 1 and 9."
    continue
  fi

  # Get the search keyword from the user
  read -p "Enter your search keyword: " keyword

  # Validate keyword input
  if [ -z "$keyword" ]; then
    echo "You must enter a search keyword."
    continue
  fi

  # Format search query based on choice
  case $choice in
    1) query="intitle:$keyword" ;;
    2) query="inurl:$keyword" ;;
    3) read -p "Enter site domain (e.g., example.com): " site
       query="site:$site $keyword" ;;
    4) read -p "Enter file type (e.g., pdf, doc, xls): " filetype
       query="filetype:$filetype $keyword" ;;
    5) query="\"$keyword\"" ;;
    6) query="related:$keyword" ;;
    7) query="cache:$keyword" ;;
    8) query="$keyword" ;;
  esac

  # Encode query for URL
  encoded_query=$(echo "$query" | sed 's/ /+/g')

  # Open Google search in browser
  echo "Searching Google for: $query"
  termux-open-url "https://www.google.com/search?q=$encoded_query"

  # Wait for a moment before looping back
  echo ""
  echo "Search completed! Press Enter to search again or select an option from the menu."
  read -p ""

done
