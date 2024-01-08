OUTPUT ?= $(shell basename "$(shell dirname "$(INPUT)")")
OUTPUT_DIRECTORY = $(shell pwd)/build
LATEXMK_ARGS ?= -f -file-line-error -shell-escape -logfilewarninglist -interaction=nonstopmode -halt-on-error -norc -pdflatex="lualatex %O %S" -pdflua
TEXINPUTS = ""
TEXLIVE_RUN = TEXINPUTS=$(TEXINPUTS)
LATEXMK_COMMAND = $(TEXLIVE_RUN) latexmk $(LATEXMK_ARGS)

# Make does not offer a recursive wildcard function, so here's one:
rwildcard=$(wildcard $1$2) $(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2))

setup:
	nix develop

ctfp:
	cd src; $(LATEXMK_COMMAND) -jobname=ctfp ctfp-reader.tex; cp ctfp.pdf $(OUTPUT_DIRECTORY)/

ctfp-ocaml:
	cd src; $(LATEXMK_COMMAND) -jobname=ctfp-ocaml ctfp-reader-ocaml.tex; cp ctfp-ocaml.pdf $(OUTPUT_DIRECTORY)/

ctfp-scala:
	cd src; $(LATEXMK_COMMAND) -jobname=ctfp-scala ctfp-reader-scala.tex; cp ctfp-scala.pdf $(OUTPUT_DIRECTORY)/

ctfp-print:
	cd src; $(LATEXMK_COMMAND) -jobname=ctfp-print ctfp-print.tex; cp ctfp-print.pdf $(OUTPUT_DIRECTORY)/

ctfp-print-ocaml:
	cd src; $(LATEXMK_COMMAND) -jobname=ctfp-print-ocaml ctfp-print-ocaml.tex; cp ctfp-print-ocaml.pdf $(OUTPUT_DIRECTORY)/

ctfp-print-scala:
	cd src; $(LATEXMK_COMMAND) -jobname=ctfp-print-scala ctfp-print-scala.tex; cp ctfp-print-scala.pdf $(OUTPUT_DIRECTORY)/

lint:
	$(foreach file, $(call rwildcard,$(shell dirname "$(INPUT)"),*.tex), latexindent -l -w $(file);)

