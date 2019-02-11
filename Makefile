.PHONY : main cls doc clean all install FORCE_MAKE

NAME = ustcthesis
UTREE = $(shell kpsewhich --var-value TEXMFHOME)
LOCAL = $(shell kpsewhich --var-value TEXMFLOCAL)

main : cls FORCE_MAKE
	latexmk -xelatex -shell-escape -use-make

all : main doc

cls : $(NAME).cls

doc : $(NAME).pdf

$(NAME).cls : $(NAME).dtx
	xetex $<

$(NAME).pdf : $(NAME).dtx FORCE_MAKE
	latexmk -xelatex $<

clean :
	latexmk -c
	latexmk -c $(NAME).dtx

install : cls doc
	sudo mkdir -p $(LOCAL)/{tex,source,doc}/latex/$(NAME)
	sudo cp $(NAME).dtx $(LOCAL)/source/latex/$(NAME)
	sudo cp $(NAME).cls $(LOCAL)/tex/latex/$(NAME)
	sudo cp $(NAME).pdf $(LOCAL)/doc/latex/$(NAME)
