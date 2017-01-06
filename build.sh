#!/bin/bash

options='-V papersize:A4,fontsize:12pt --smart --template=paper_template.tex --latex-engine=xelatex'

git log -1 --format="format:\
		\\gdef\\GITAbrHash{%h}\
		\\gdef\\GITAuthorDate{%ad}\
		\\gdef\\GITAuthorName{%an}" >> vc.tex

echo "Building Satzung"
pandoc ${options} --toc satzung.md -o satzung.pdf

echo "Building Beitragsordnung"
pandoc ${options} beitragsordnung.md -o beitragsordnung.pdf

echo "Building GettingStarted"
pandoc ${options} --toc gettingstarted.md -o gettingstarted.pdf

echo "Building Jahresbericht 2016"
pandoc ${options} --toc jahresbericht_2016.md -o jahresbericht_2016.pdf
