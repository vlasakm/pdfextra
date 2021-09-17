# PDF Extra

PDF Extra provides extra PDF features for OpTeX (or in limited form for plain
LuaTeX and LuaLaTeX).

As a minimalistic package OpTeX doesn't support "advanced" features of PDF file
format in the base. This third party package aims to provide them. Summary of
supported features:

 - insertion of multimedia (audio, video, 3D);
 - hyperlinks and other actions,
 - trigger events;
 - transitions;
 - attachments.

The repository of PDF Extra is at https://github.com/vlasakm/pdfextra.

# Documentation

See `pdfextra-doc.pdf` for documentation. It contains user documentation as
well as technical documentation interleaved with source code.

# Installation instructions

Put `pdfextra.opm` where your TeX can find it. Additionaly, for plain/LaTeX you
need `pdfextra.tex`, and on top of that `pdfextra.sty` for LaTeX.

Or just copy paste anything you want.

# Usage

In OpTeX do: `\load [pdfextra]`.

In plain LuaTeX do: `\input pdfextra`.

In LuaLaTeX do: `\usepackage{pdfextra}`.

# License

This package is available under the Zero-Clause BSD license. See `LICENSE` for
more information.
