# Pandoc Templates

Repo for pandoc markdown to pdf template file and useful commands

Eisvogel:           https://github.com/Wandmalfarbe/pandoc-latex-template

Pandoc Manual:      https://pandoc.org/MANUAL.html#variables-for-latex

Download Page:      https://github.com/jgm/pandoc/releases/tag/3.1.8

---

## Meta Data

useful yaml meta data

```yaml
---
title: <document title>
subtitle: <document sub-title>
author: <author>
geometry: margin=25mm
numbersections: true
date: \today
lof: true
toc: true
titlepage: true
titlepage-logo: Figures/UoA.png
logo-width: 90mm
---
```

### Reference metadata from external file

```yaml
---
include-metadata-from: eisvogel-project1.yaml
---
```

---

## Running locally

```
pandoc <file_name>.md -o <output_name>.pdf --template custom_basic --listings
```

## Running with docker

1. Install docker
1. Pull image
2. Run container

```
docker pull pandoc/extra
```

```
docker run --rm --volume "$(pwd):/data" --user $(id -u):$(id -g) --volume "$(pwd)/custom_basic:/custom_basic" pandoc/extra <file_name>.md -o <output_name>.pdf --template custom_basic --listings
```

### Building Container

```
docker build -t pandoc-custom .
```

```
docker run --rm --volume "$(pwd):/data" pandoc-custom input_file.md -o output_file.pdf
```

# Converting Jupyter Notebooks to Markdown

```
jupyter nbconvert --to markdown YourNotebook.ipynb
```

# Including Equations

Including equations can be achieved with the pandoc-eqnos filter. It is a python package, installed via pip. This has not been tested with the docker process, only running locally.

```
$$
math...
$$ {#eq:<name>}
```

This equation can then be referenced with `{@eq:<name>}` in text.

To compile with equations...

```
pandoc <input>.md -o <output>.pdf --template <template_name> --filter pandoc-eqnos --pdf-engine=xelatex --listings
```
