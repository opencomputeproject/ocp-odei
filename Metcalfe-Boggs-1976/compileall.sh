#!/bin/bash
# Display which script is being used
echo "Using compileall.sh for main.tex in this folder"
sleep 1

# Create an output directory if it doesn't exist
mkdir -p output

# Change to the directory of the script
cd "$(dirname "$0")"

echo "Starting LaTeX compilation..."

# First pass with xelatex, directing output files to the 'output' folder
echo "Running xelatex (first pass)..."
/Library/TeX/texbin/xelatex -output-directory=output main.tex

# Compile the nomenclature, directing output files to the 'output' folder
echo "Compiling nomenclature..."
/Library/TeX/texbin/makeindex output/main.nlo -s nomencl.ist -o output/main.nls

# Compile the index, directing output to the 'output' folder
echo "Compiling index..."
/Library/TeX/texbin/makeindex output/main

# Compile the bibliography, directing output files to the 'output' folder
echo "Compiling bibliography..."
/Library/TeX/texbin/biber output/main

# Second pass with xelatex, directing output files to the 'output' folder
echo "Running xelatex (second pass)..."
/Library/TeX/texbin/xelatex -output-directory=output main.tex

# Compile the glossary, directing output files to the 'output' folder
echo "Compiling glossary..."
/Library/TeX/texbin/makeglossaries output/main

# Final pass with xelatex, directing output files to the 'output' folder
echo "Running xelatex (final pass)..."
/Library/TeX/texbin/xelatex -output-directory=output main.tex

# Move the generated PDF to the main directory, replacing the existing one if it exists
if [ -f "output/main.pdf" ]; then
    echo "Moving the PDF from output folder to the main folder..."
    mv -f output/main.pdf ./main.pdf
else
    echo "PDF not found in output folder."
fi

# Tag the PDF with the color Yellow
tag --add "Yellow" "main.pdf"

# Open the generated PDF in Preview
open -a Preview "main.pdf"

echo "LaTeX compilation finished!"

# Add a delay (e.g., 2 seconds)
sleep 2

# Close the Terminal window automatically
osascript -e 'tell application "Terminal" to close first window' & exit
