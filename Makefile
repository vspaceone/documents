#!/bin/bash

options='-V papersize:A4,fontsize:12pt --smart --template=paper_template.tex --latex-engine=xelatex'
options='-V papersize:A5,fontsize:12pt --smart --template=paper_template.tex --latex-engine=xelatex'


general = paper_template.tex

git log -1 --format="format:\
		\\gdef\\GITAbrHash{%h}\
		\\gdef\\GITAuthorDate{%ad}\
		\\gdef\\GITAuthorName{%an}" >> vc.tex

all: satzung.pdf beitragsordnung.pdf gettingstarted.pdf jahresbericht_2016.pdf

satzung.pdf: $(general) satzung.md
	echo "Building Satzung"
	pandoc ${options} --toc satzung.md -o satzung.pdf

beitragsordnung.pdf: $(general) beitragsordnung.md
	echo "Building Beitragsordnung"
	pandoc ${options} beitragsordnung.md -o beitragsordnung.pdf

gettingstarted.pdf: $(general) gettingstarted.md
	echo "Building GettingStarted"
	pandoc ${options} --toc gettingstarted.md -o gettingstarted.pdf

jahresbericht_2016.pdf: $(general) jahresbericht_2016.md
	echo "Building Jahresbericht 2016"
	pandoc ${options} --toc jahresbericht_2016.md -o jahresbericht_2016.pdf

clean:
	rm satzung.pdf
	rm beitragsordnung.pdf
	rm gettingstarted.pdf
	rm jahresbericht_2016.pdf
