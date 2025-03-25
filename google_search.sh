#!/bin/bash

# RayGray Google Search Script
clear
echo "================================================="
echo "     Advanced Google Search by RayGray"
echo "================================================="
echo "Enter your search query with operators (e.g., intitle, inurl):"
echo "For example: intitle:example inurl:page"
echo "================================================="

# Read user input
read -p "Search Query: " search_query

# Validate input
if [ -z "$search_query" ]; then
  echo "Please enter a search query."
  exit 1
fi

# Format the query for Google
encoded_query=$(echo "$search_query" | sed 's/ /+/g')

# Open Google search in a browser
echo "Searching Google for: $search_query"
termux-open-url "https://www.google.com/search?q=$encoded_query"

# End the script
exit 0
