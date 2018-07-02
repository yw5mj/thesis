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
if [ "$1" != "--test" ]
then
    pdflatex -output-directory=output -jobname=$outputfile main.tex >/dev/null
fi
rm $outputfile.bbl
if [[ "$(hostname)" == *".cern.ch" ]]
then
    mv output/$outputfile.pdf ~/www
fi

