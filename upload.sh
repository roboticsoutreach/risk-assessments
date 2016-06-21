#!/bin/sh

# Build all PDFs and upload to dl.kierdavis.com
# TODO: automate this with something like drone.io

pdflatexflags="-file-line-error -halt-on-error -interaction nonstopmode"

root=$(dirname $0)
root=$(realpath -L "$root")

outputdir="/tmp/srobo-soton-risk-assessment-pdfs"
mkdir -p "$outputdir" || exit 1

for filename in $(find $root/20* -name '*.tex' -print | sort); do
    pdf=$(echo "$filename" | sed 's/.tex/.pdf/')
    if [ ! -f "$pdf" -o "$filename" -nt "$pdf" ]; then # if $pdf does not exist, or if $filename is newer than $pdf
        dir=$(dirname "$filename")
        base=$(basename "$filename")

        cd "$dir"
        pdflatex $pdflatexflags -draftmode "$base" || exit 1
        pdflatex $pdflatexflags "$base" || exit 1
    fi

    cp "$pdf" "$outputdir"
done

rsync --archive --verbose --compress --delete "$outputdir/" "kier@dl.kierdavis.com:/var/www/dl.kierdavis.com/www/htdocs/srobo-soton-risk-assessments/latest/" || exit 1

rm -r "$outputdir"
