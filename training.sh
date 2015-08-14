#!/bin/bash

tesseract ftc.bematech.exp0.tif ftc.bematech.exp0.box box.train.stderr
tesseract ftc.sweda.exp0.tif ftc.sweda.exp0.box box.train.stderr
unicharset_extractor ftc.bematech.exp0.box ftc.sweda.exp0.box


shapeclustering -F ftc.font_properties -U unicharset *.tr
mftraining -F ftc.font_properties -U unicharset -O ftc.unicharset *.tr 


cntraining *.tr

mv shapetable ftc.shapetable
mv normproto ftc.normproto
mv inttemp ftc.inttemp
mv pffmtable ftc.pffmtable

combine_tessdata ftc.

cp ftc.traineddata /usr/local/Cellar/tesseract/3.02.02_3/share/tessdata/