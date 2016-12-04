#!/bin/bash

options='-V papersize:A4,fontsize:12pt --smart --template=paper_template.tex'

echo "Building Satzung"
pandoc ${options} --toc satzung.md -o satzung.pdf


echo "Building Beitragsordnung"
pandoc ${options} beitragsordnung.md -o beitragsordnung.pdf


echo "Building GettingStarted"
pandoc ${options} --toc gettingstarted.md -o gettingstarted.pdf
