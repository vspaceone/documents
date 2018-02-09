#!/bin/bash

output=out/

options=-V papersize:A4,fontsize:12pt --smart --latex-engine=xelatex

paper_template = --template=paper_template.tex
letter_template = --template=letter_template.tex

all: out/satzung.pdf out/beitragsordnung.pdf out/gettingstarted.pdf out/jahresbericht_2017.pdf out/jahresbericht_2016.pdf out/protokoll_jahreshauptversammlung_2016_2017.pdf out/einladung_JHV18.pdf

################################
# Satzung
################################

out/satzung.pdf: dokumente/satzung/satzung.md
	echo "Building Satzung"
	pandoc ${options} ${paper_template} --toc dokumente/satzung/satzung.md -o ${output}satzung.pdf

out/beitragsordnung.pdf: dokumente/satzung/beitragsordnung.md
	echo "Building Beitragsordnung"
	pandoc ${options} ${paper_template} dokumente/satzung/beitragsordnung.md -o ${output}beitragsordnung.pdf

################################
# Jahresberichte
################################

out/jahresbericht_2016.pdf: dokumente/jahresberichte/jahresbericht_2016.md
	echo "Building jahresbericht_2016"
	pandoc ${options} ${paper_template} --toc dokumente/jahresberichte/jahresbericht_2016.md -o ${output}jahresbericht_2016.pdf

out/jahresbericht_2017.pdf: dokumente/jahresberichte/jahresbericht_2017.md
	echo "Building jahresbericht_2017"
	pandoc ${options} ${paper_template} --toc dokumente/jahresberichte/jahresbericht_2017.md -o ${output}jahresbericht_2017.pdf

################################
# Sonstige
################################

out/gettingstarted.pdf: dokumente/gettingstarted.md
	echo "Building GettingStarted"
	pandoc ${options} ${paper_template} --toc dokumente/gettingstarted.md -o ${output}gettingstarted.pdf


out/protokoll_jahreshauptversammlung_2016_2017.pdf:  dokumente/protokoll_jahreshauptversammlung_2016_2017.md
	echo "Building protokoll_jahreshauptversammlung_2016_2017"
	pandoc ${options} ${paper_template} --toc dokumente/protokoll_jahreshauptversammlung_2016_2017.md -o ${output}protokoll_jahreshauptversammlung_2016_2017.pdf


out/einladung_JHV18.pdf: dokumente/einladung_JHV18.tex
	echo "Building einladung_JHV18"
	xelatex dokumente/einladung_JHV18.tex -o ${output}einladung_JHV18.pdf
	mv einladung_JHV18.pdf ${output}
	rm -f *.aux *.log *.out

clean:
	rm -f ${output}*.pdf ${output}*.aux ${output}*.log ${output}*.out
