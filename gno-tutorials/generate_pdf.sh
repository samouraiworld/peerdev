#!/bin/bash

# Make the pdf directory if it doesn't exist
mkdir -p pdf

# Find all markdown files starting with 'slides-' in their name
find . -type f -name "slides*.md" | while read slides_md; do
  # Get the directory name where the markdown file is located
  folder=$(dirname "$slides_md")

  # Extract the base name of the file (to differentiate multiple presentations)
  filename=$(basename "$slides_md")

  echo "Generating PDF for $folder/$filename"

  # Create the corresponding directory in 'pdf' to preserve structure
  mkdir -p "pdf/$folder"

  # Run the Slidev export command to generate the PDF for the specific markdown file
  npx slidev export "$folder/$filename" --output slides-export.pdf

  # Move the generated PDF to the corresponding directory in 'pdf'
  mv slides-export.pdf "pdf/$folder/slides.pdf"
done

echo "✅ All PDFs generated and saved in the 'pdf' directory, preserving directory structure!"
