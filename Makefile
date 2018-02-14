#!/bin/bash

OUTPUT_DIR=out/


PAPER_TEMPLATE = --template=paper_template.tex
LETTER_TEMPLATE = --template=letter_template.tex

# Echo command
ECHO_CMD=$(shell which echo)
ECHO_FLAGS=-e
ECHO=$(ECHO_CMD) $(ECHO_FLAGS)

# latex engine
LATEX_ENGINE=xelatex

# pandoc compiler
PANDOC_CMD=$(shell which pandoc)
PANDOC_OPTIONS=-V papersize:A4,fontsize:12pt --smart --latex-engine=$(LATEX_ENGINE)
PANDOC=$(PANDOC_CMD) $(PANDOC_OPTIONS)

# The command to remove something
RM_CMD=$(shell which rm)
RM_FLAGS=-f
RM=$(RM_CMD) $(RM_FLAGS)

MAKE_LOG=make.log

all: out/satzung.pdf out/beitragsordnung.pdf out/gettingstarted.pdf out/jahresbericht_2017.pdf out/jahresbericht_2016.pdf out/protokoll_jahreshauptversammlung_2016_2017.pdf out/einladung_JHV18.pdf

################################
# Satzung
################################

out/satzung.pdf: dokumente/satzung/satzung.md
	@$(ECHO) "\t[Pandoc]\tBuilding Satzung"
	@$(PANDOC) ${PAPER_TEMPLATE} --toc dokumente/satzung/satzung.md -o ${OUTPUT_DIR}satzung.pdf &>> $(MAKE_LOG)

out/beitragsordnung.pdf: dokumente/satzung/beitragsordnung.md
	@$(ECHO)"\t[Pandoc]\tBuilding Beitragsordnung"
	@$(PANDOC) ${PAPER_TEMPLATE} dokumente/satzung/beitragsordnung.md -o ${OUTPUT_DIR}beitragsordnung.pdf &>> $(MAKE_LOG)

################################
# Jahresberichte
################################

out/jahresbericht_2016.pdf: dokumente/jahresberichte/jahresbericht_2016.md
	@$(ECHO) "\t[Pandoc]\tBuilding jahresbericht_2016"
	@$(PANDOC) ${PAPER_TEMPLATE} --toc dokumente/jahresberichte/jahresbericht_2016.md -o ${OUTPUT_DIR}jahresbericht_2016.pdf &>> $(MAKE_LOG)

out/jahresbericht_2017.pdf: dokumente/jahresberichte/jahresbericht_2017.md
	@$(ECHO) "\t[Pandoc]\tBuilding jahresbericht_2017"
	@$(PANDOC) ${PAPER_TEMPLATE} --toc dokumente/jahresberichte/jahresbericht_2017.md -o ${OUTPUT_DIR}jahresbericht_2017.pdf &>> $(MAKE_LOG)

################################
# Sonstige
################################

out/gettingstarted.pdf: dokumente/gettingstarted.md
	@$(ECHO) "\t[Pandoc]\tBuilding GettingStarted"
	@$(PANDOC) ${PAPER_TEMPLATE} --toc dokumente/gettingstarted.md -o ${OUTPUT_DIR}gettingstarted.pdf &>> $(MAKE_LOG)


out/protokoll_jahreshauptversammlung_2016_2017.pdf:  dokumente/protokoll_jahreshauptversammlung_2016_2017.md
	@$(ECHO) "\t[Pandoc]\tBuilding protokoll_jahreshauptversammlung_2016_2017"
	@$(PANDOC) ${PAPER_TEMPLATE} --toc dokumente/protokoll_jahreshauptversammlung_2016_2017.md -o ${OUTPUT_DIR}protokoll_jahreshauptversammlung_2016_2017.pdf &>> $(MAKE_LOG)


out/einladung_JHV18.pdf: dokumente/einladung_JHV18.tex
	@$(ECHO) "\t[Latex]\tBuilding einladung_JHV18"
	@$(LATEX_ENGINE) dokumente/einladung_JHV18.tex -o ${OUTPUT_DIR}einladung_JHV18.pdf &>> $(MAKE_LOG)
	mv einladung_JHV18.pdf ${OUTPUT_DIR}
	@$(RM) *.aux *.log *.out

clean:
	@$(ECHO) "\t[Clean]\t*.pdf"
	@$(RM) ${OUTPUT_DIR}*.pdf
	@$(ECHO) "\t[Clean]\t*.aux"
	@$(RM) ${OUTPUT_DIR}*.aux 
	@$(ECHO) "\t[Clean]\t*.log"
	@$(RM) ${OUTPUT_DIR}*.log 
	@$(ECHO) "\t[Clean]\t*.out"
	@$(RM) ${OUTPUT_DIR}*.out
	@$(ECHO) "\t[Clean]\tmake.log"
	@$(RM) make.log
