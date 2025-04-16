# Orthogonal Graph Drawing with ASP

## Description

This project implements a graph drawing system using Answer Set Programming (ASP). It takes a graph as input and generates a planar orthogonal drawing where vertices are placed on a grid and edges are drawn as sequences of horizontal and vertical line segments. The system ensures there are no edge crossings and maintains aesthetic drawing criteria. Additionally, a user can limit the grid size.

## Installation

Install Clingo (ASP solver).

Install Python to generate random datasets (the `gen.py` script) and generate a SVG file from Clingo's output (the `gen_svg_from_output.py` script). The latter script requires the `svgwrite` library installed.

## Usage

```console
clingo test01.lp encoding.lp
```

## Samples

![](test05.png)

![](test12.png)

![](test25.png)

## Authors

Contributors names and contact info:

-   [Wojciech Wieczorek](https://kiia.ubb.edu.pl/pracownicy/dr-habwojciechwieczorek),
-   [Łukasz Strąk](https://ab.us.edu.pl/emp?id=47011),
-   [Arkadiusz Nowakowski](https://ab.us.edu.pl/emp?id=46971).
