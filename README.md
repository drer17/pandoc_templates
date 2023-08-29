# Pandoc Templates

Repo for pandoc markdown to pdf template file and useful commands

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

---

## Running locally

```
pandock example.md -o example.pdf --template custom_basic --listings
```

## Running with docker

```
docker run --rm --volume "$(pwd):/data" --user $(id -u):$(id -g) --volume "$(pwd)/custom_basic:/custom_basic" pandoc/extra example.md -o example.pdf --template custom_basic --listings
```
