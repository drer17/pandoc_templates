# Define a Makefile variable for the template file
TEMPLATE_FILE = custom_basic.latex
NAME = custom_basic

# Define a Makefile target to download the custom_basic.latex file
download_template:
	curl -o $(TEMPLATE_FILE) https://raw.githubusercontent.com/drer17/pandoc_templates/main/custom_basic.latex

# Define a Makefile target to generate PDFs for all .md files in the project
generate_pdfs: $(patsubst %.md,%.pdf,$(wildcard *.md))

# Define a rule to convert .md files to .pdf files
%.pdf: %.md
#FOR WINDOWS
#docker run --rm -v "$(PWD):/data" -u $(shell id -u):$(shell id -g) -v "$(PWD)/custom_basic:/custom_basic" pandoc/extra $< -o $@ --template $(NAME) --listings
#LOCALLY
	pandoc $< -o $@ --template $(NAME) --filter pandoc-eqnos --pdf-engine=xelatex --listings


# Define a Makefile target to remove the template file
clean_template:
	rm -f $(TEMPLATE_FILE)

# Define a Makefile target that depends on downloading the template, generating PDFs, and then cleaning up
all: download_template generate_pdfs clean_template

.PHONY: all compile test clean
