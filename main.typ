// Template for the IU University of Applied Sciences case studies and written
// assignments.
//
// Copyright (c) 2024 Benjamin Thomas Schwertfeger
// https://github.com/btschwertfeger
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// -----------------------------------------------------------------------------
//
// NOTE: Compile using typst>=v0.12.0
//
// NOTE: The IU University of Applied Sciences requires the Arial font for all
//       documents. This font must be downloaded and installed on your system.
//       Custom font paths can be used like:
//       $ typst c main.typ --font-path /home/<username>/.local/share/fonts/
//
// -----------------------------------------------------------------------------

// Define page layout
#set page(
  paper: "a4",
  margin: (
  top: 2cm,
  bottom: 2cm,
  left: 2cm,
  right: 2cm,
))

// Define default text style
#set text(
    font: "Arial",
    size: 11pt,
    lang: "en"
)

// Define default paragraph style
#let leading = 1em // this seems to equal 1.5 in Word and Google Docs
#set par(
  justify: true,
  leading: leading,
  linebreaks: "optimized",
  spacing: leading + 6pt,
)

// Display inline code in a small box that retains the correct baseline.
#show raw: it => block(
  fill: rgb("#1d2433"),
  text(fill: rgb("#a2aabc"), it)
)
#show raw.where(block: false): box.with(
  fill: rgb("#1d2433"),
  inset: (x: 3pt, y: 0pt),
  outset: (y: 3pt),
  radius: 2pt,
)

// Display block code in a larger block with more padding.
#show raw.where(block: true): block.with(
  fill: rgb("#1d2433"),
  inset: 10pt,
  radius: 4pt,
)

#let today = datetime.today().display("[month repr:long] [day], [year]")

// Heading text size and numbering
#show heading: set text(size: 12pt)
#set heading(numbering: "1.1")

// Vertical space before and after heading
#show heading: it => {
  v(1em)
  it
  v(1em)
}

// Custom separator for lists beginning with /
#set terms(separator: [: ])

// Title page ------------------------------------------------------------------

#line(start: (0%, 5%), end: (8.5in, 5%), stroke: (thickness: 2pt))

#align(horizon + left)[
  #par(leading: 0.5em, [
    #text(size: 24pt, [
      Case Study: The black sheep \
      #text(size: 10pt)[_IU International University of Applied Sciences_]
    ])
  ])
  #par(leading: 1em,[
  Author: Max Mustermann \
  Matriculation no.: IUxxxxxx
  \
  Study: Master of Science, _Study-name_ \
  Course: _Course-name_ (_course-id_) \
  Tutor: Prof. Dr. _Monika Mustermann_ \
  \
  Date: #today
  ])
]

#pagebreak()

/* -------------------------------------------------------------------------- */

#set page(numbering: "I")

#outline()

#pagebreak()

/* -------------------------------------------------------------------------- */

#outline(title: "Figures", target: figure.where(kind: image))

#pagebreak()

/* -------------------------------------------------------------------------- */

#outline(title: "Listings", target: figure.where(kind: raw))

#pagebreak()

/* -------------------------------------------------------------------------- */

#heading(numbering: none, outlined: false)[Abbreviations]

#table(
  columns: (auto, 1fr),
  align: (left, left),
  stroke: none,
  column-gutter: 1em,
  row-gutter: 0.5em,
  [*IaC*], [Infrastructure as Code],
  [*KPI*], [Key Performance Indicator],
  [*LDAP*], [Lightweight Directory Access Protocol],
  [*RBAC*], [Role-Based Access Control],
  [*VM*], [Virtual Machine],
  [*VNC*], [Virtual Network Computing],
)

#pagebreak()
/* -------------------------------------------------------------------------- */

#set page(numbering: "1")
#counter(page).update(1)

= Executive Summary

An executive summary is a brief section that summarizes the main points of the
document. It is intended to provide a high-level overview of the content and is
often used to help readers quickly understand the key takeaways without having
to read the entire document.

#pagebreak()

/* -------------------------------------------------------------------------- */

= Introduction

A nice introduction to the topic at hand. This is where you set the stage for
the rest of the document and provide some context for the reader.

#pagebreak()

/* -------------------------------------------------------------------------- */

= Approach

The approach section is where you outline the methodology or approach you took
to address the problem or question at hand. This is where you describe the steps
you took to conduct your research or analysis and explain why you chose to take
that approach.

Citing and referencing documents is easy and _"Eating your own dog food"_
is considered as best practice @dogfood and citing more then one reference can
be quite useful @git @gitbook @gitflow.

== Lists

Bored of writing information in text? Bullet lists can be a good alternative:

- #lorem(10)
- #lorem(20)
- #lorem(5)

And more fancy lists can be useful too:

/ Option 1: #lorem(20)
/ Option 2: #lorem(15)
/ Option 3: #lorem(25)

== Figures

@figure1-label is a good example of a figure.

#figure(
  image("media/github-actions.png", format: "png", width: 100%),
  caption: [Example figure],
)<figure1-label>

== Code Listings

Show you skills and knowledge by adding code listings to your document:

#figure(
  ```sh
  # Show any code snippet here
  user@workstation:~/$ sudo apt update
  user@workstation:~/$ sudo apt upgrade -y
  user@workstation:~/$ sudo apt autoremove -y
  ```,
  caption: [This is my first listing],
)

#figure(
  ```yaml
  # Example YAML file
  stages:
    - build
    - test
    - deploy

  &defaults
    timeout: 60
    retry: 3

  build:
    <<: *defaults
    script:
      - echo "Building the app..."

  ...
  ```,
  caption: [Listing for demonstrating a YAML file],
)

#pagebreak()

/* -------------------------------------------------------------------------- */

= Expected Outcomes

The expected outcomes section is where you outline what you expect to achieve
or learn from your research or analysis. This is where you describe the goals
of your project and what you hope to accomplish by the end of it.

#pagebreak()

#let appendix(body) = {
  set heading(numbering: "A.1", supplement: [Appendix])
  counter(heading).update(0)
  body
}

#show: appendix

= Appendix

Here goes the additional information.

#pagebreak()

/* -------------------------------------------------------------------------- */

#bibliography(
    "references.yaml",
    style: "apa",
)
