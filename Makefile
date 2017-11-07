.SUFFIXES: .bb .tex .dvi .pdf

all: midterm_report.pdf

clean:
	rm -f *.aux *.dvi *.log *.bbl *.blg

.tex.dvi:
	platex -kanji=utf8 $<
	pbibtex $(basename $<)
	platex -kanji=utf8 $<
	platex -kanji=utf8 $<

.dvi.pdf:
	dvipdfmx $<

midterm_report.pdf: midterm_report.tex midterm_report.dvi
midterm_report.dvi: funinfosys.sty ref.bib