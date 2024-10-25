# Convert Wazuh Online Documentation to PDF

## Overview

This script converts the Wazuh online documentation into a single PDF file. It uses wget to retrieve the list of URLs, filters and cleans the list, and then converts each HTML page to a PDF using wkhtmltopdf. Finally, all individual PDF files are merged into one document using Ghostscript.

## Prerequisites

To run this script, you need:

A patched version of wkhtmltopdf which supports advanced rendering features. You can download the patched version from the wkhtmltopdf downloads page.
Ghostscript (gs) to merge the individual PDF files.

## How to Use

### Step 1: Download wkhtmltopdf

Ensure you have the patched version of wkhtmltopdf installed. This is crucial for proper HTML to PDF conversion with styles and rendering. You can download it here.

### Step 2: Clone the Repository

Clone this repository to your local machine:

`git clone <repository-url>`

### Step 3: Make the Script Executable

Navigate to the directory and make the script executable:

`cd <repository-directory>`
`chmod +x create-wazuh-pdf.sh`

### Step 4: Ensure CSS File is Available

The script requires a CSS file named no-footer.css to style the PDF documents. This file must be in the same directory as the script. Ensure that no-footer.css is present before running the script.

### Step 5: Run the Script

Execute the script by running:

`./create-wazuh-pdf.sh`

The script performs the following actions:

Generates a list of URLs from the Wazuh documentation.
Cleans and filters the list to include only HTML pages.
Converts each HTML page into an individual PDF file.
Merges all the individual PDFs into a single PDF named merged-output.pdf.

## Output

The final merged PDF containing the Wazuh documentation will be saved as merged-output.pdf in the current directory.
Note: The generated PDF is not a perfect replica of the online documentation. Images and screenshots are missing, and the document is optimized to use as little storage space as possible.

## Notes

It is crucial to use the patched version of wkhtmltopdf, as the standard version may not render the documentation correctly.
Ensure that no-footer.css is available in the same directory, as it is used to remove unwanted footer elements from the PDFs.

## Dependencies

wget
Patched version of wkhtmltopdf
Ghostscript (gs) to merge PDFs

## Troubleshooting

If the script fails or the generated PDFs do not look correct, ensure:
You are using the patched version of wkhtmltopdf.
The CSS file (no-footer.css) is available in the same directory.
All dependencies (wget, wkhtmltopdf, gs) are correctly installed and accessible from your command line.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
Contributing
Contributions are welcome! If you have suggestions for improvements, feel free to open an issue or submit a pull request.

## Contact

For any questions or issues, feel free to reach out via the issues page of this repository.

