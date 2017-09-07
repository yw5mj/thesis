#! /bin/bash
outputfile=thesis_yanchu
if [ "$1" == "--bbl" ]
then
    rm main.bbl
fi
if ! [ -f "main.bbl" ]
then
    echo "======= RUNNING bibrun ======"
    ./bin/bibrun.sh
fi
mkdir -p output
cp main.bbl $outputfile.bbl
pdflatex -output-directory=output -jobname=$outputfile main.tex 
pdflatex -output-directory=output -jobname=$outputfile main.tex >/dev/null
mv output/$outputfile.pdf ~/www
rm $outputfile.bbl