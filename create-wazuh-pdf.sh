#!/bin/bash

# URL source
source_url="https://documentation.wazuh.com/current/index.html"

# File to store the original URL list
input_file="url-list.txt"
# File to store the cleaned URL list
output_file="cleaned-url-list.txt"
# Target file for the merged PDF
merged_pdf="merged-output.pdf"
# Path to the current directory
script_dir=$(dirname "$0")
# CSS file for PDF styling
css_file="${script_dir}/no-footer.css"

# Step 0: Check if the CSS file exists
if [[ ! -f "$css_file" ]]; then
    echo "The CSS file 'no-footer.css' was not found in the directory $script_dir."
    echo "Please add the file and rerun the script."
    exit 1
fi

# Step 1: Create the URL list with wget and save it to url-list.txt
echo "Creating the URL list from $source_url..."
wget --spider --force-html -r -l2 "$source_url" 2>&1 | grep '^--' | awk '{ print $3 }' > "$input_file"

# Check if the URL list was successfully created
if [[ ! -s "$input_file" ]]; then
    echo "The URL list could not be created or is empty."
    exit 1
fi

# Step 2: Clean the URL list, keep only .html URLs, and remove duplicates
echo "Cleaning the URL list..."
grep '\.html$' "$input_file" | sort -u > "$output_file"

# Check if the cleaned list is not empty
if [[ ! -s "$output_file" ]]; then
    echo "No valid HTML URLs found. Aborting."
    exit 1
fi

# Step 3: Convert HTML files to PDF
echo "Converting HTML files to PDF..."
mkdir -p pdf_output # Create a directory for the PDF files

while read -r url; do
  # Create the PDF filename from the URL
  pdf_name=$(echo "$url" | sed -e 's/https\?:\/\///' -e 's/[^a-zA-Z0-9]/-/g').pdf
  pdf_path="pdf_output/$pdf_name"
  
  # Check if the PDF already exists to avoid unnecessary work
  if [[ ! -f "$pdf_path" ]]; then
    # wkhtmltopdf command to convert the URL to a PDF file
    wkhtmltopdf -R 0 -L 0 -T 0 -B 0 -s A4 --user-style-sheet "$css_file" --disable-smart-shrinking --lowquality --image-quality 75 --enable-local-file-access --disable-javascript "$url" "$pdf_path"
    if [[ $? -eq 0 ]]; then
      echo "Created: $pdf_path"
    else
      echo "Error creating: $pdf_path"
    fi
  else
    echo "Skipped (already exists): $pdf_path"
  fi
done < "$output_file"

# Step 4: Merge all PDF files into a single file
echo "Merging all PDFs into $merged_pdf..."
if ls pdf_output/*.pdf 1> /dev/null 2>&1; then
  gs -dBATCH -dNOPAUSE -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -sOutputFile="$merged_pdf" pdf_output/*.pdf
  if [[ $? -eq 0 ]]; then
    echo "All PDF files were successfully merged into $merged_pdf."
  else
    echo "Error merging the PDFs."
  fi
else
  echo "No PDF files found for merging."
fi
