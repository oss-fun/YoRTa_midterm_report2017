.SUFFIXES: .bb .tex .dvi .pdf

PDFIMAGES = graph1

all: midterm_report.pdf

clean:
	rm -f *.xbb *.aux *.dvi *.log *.bbl *.blg

.pdf.bb:
	extractbb $<

.tex.dvi:
	platex -kanji=utf8 $<
	pbibtex $(basename $<)
	platex -kanji=utf8 $<
	platex -kanji=utf8 $<

.dvi.pdf:
	dvipdfmx $<

midterm_report.pdf: midterm_report.tex midterm_report.dvi
midterm_report.dvi: funinfosys.sty ref.bib $(addsuffix .bb, $(PDFIMAGES))