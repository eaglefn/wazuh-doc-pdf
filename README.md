Convert Wazuh Online Documentation to PDF

Overview

This script allows you to convert the Wazuh online documentation into a single PDF file. It uses wget to retrieve the list of URLs, filters and cleans the list, and then converts each HTML page to PDF using wkhtmltopdf. Finally, all individual PDF files are merged into a single document.

Prerequisites

To run this script, you need:

A patched version of wkhtmltopdf which supports advanced rendering features. You can download the patched version from wkhtmltopdf downloads page.

Ghostscript (gs) to merge the individual PDF files.

How to Use

Download wkhtmltopdf: Make sure you have the patched version of wkhtmltopdf installed. This is crucial for proper HTML to PDF conversion with styles and rendering. You can download it here.

Clone the Repository or Save the Script: Copy the script file named create-wazuh-pdf.sh to your local machine.

Make the Script Executable: Run the following command to make the script executable:

chmod +x create-wazuh-pdf.sh

**Ensure CSS File is Available: The script requires a CSS file named no-footer.css to style the PDF documents. This file must be in the same directory as the script.

Run the Script: Execute the script by running:

./create-wazuh-pdf.sh

The script will perform the following actions:

Generate a list of URLs from the Wazuh documentation.

Clean and filter the list to include only HTML pages.

Convert each HTML page to an individual PDF file.

Merge all the individual PDFs into a single PDF named merged-output.pdf.

Output

The final merged PDF containing the Wazuh documentation will be saved as merged-output.pdf in the current directory.

Note: The generated PDF is not a perfect replica of the online documentation. Images and screenshots are missing, and the document is optimized to use as little storage space as possible.

Notes

It is crucial to use the patched version of wkhtmltopdf, as the standard version may not render the documentation correctly.

Ensure that no-footer.css is available in the same directory, as it is used to remove unwanted footer elements from the PDFs.

Dependencies

wget

Patched version of wkhtmltopdf

Ghostscript (gs) to merge PDFs

Troubleshooting

If the script fails or the generated PDFs do not look correct, ensure:

You are using the patched version of wkhtmltopdf.

The CSS file (no-footer.css) is available in the same directory.

All dependencies (wget, wkhtmltopdf, gs) are correctly installed and accessible from your command line.

