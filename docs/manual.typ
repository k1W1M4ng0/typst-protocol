#import "@preview/tidy:0.3.0"
#import "@preview/crudo:0.1.0"

#import "template.typ": *

#import "/src/lib.typ" as template

#let package-meta = toml("/typst.toml").package
// #let date = none
#let date = datetime(year: 2024, month: 10, day: 9)

#show: project.with(
  title: "TGM HIT protocol template",
  // subtitle: "...",
  authors: package-meta.authors.map(a => a.split("<").at(0).trim()),
  abstract: [
    A protocol template for students of the HIT department at TGM Wien.
  ],
  url: package-meta.repository,
  version: package-meta.version,
  date: date,
)

// the scope for evaluating expressions and documentation
#let scope = (template: template)

= Introduction

This template is aimed at students of the information technology department at the TGM technical secondary school in Vienna. It can be used both in the Typst app and using the CLI:

Using the Typst web app, you can create a project by e.g. using this link: #link("https://typst.app/?template=" + package-meta.name + "&version=latest").

To work locally, use the following command:

#raw(
  block: true,
  lang: "bash",
  "typst init @preview/" + package-meta.name
)

If you are getting started writing your protocol, you will likely be better off looking into the document created by the template: it contains instruction and examples on the most important features of this template. If you have not yet initialized the template, a rendered version is linked in the README. If you are new to Typst, also check out the Typst documentation: https://typst.app/docs/.

The rest of this manual documents the individual functions offered by this package. This is useful if you want to know what customization options are available, or you're not sure what parts of the template package do.

As a school-specific template, this package does not offer enough configurability to be used at different institutions. However, if you like this template, feel free to adapt the code (MIT-licensed) to your needs, or open a Github issue if you think the template could be adapted to work for your requirements.


= Module reference

== `tgm-hit-protocol`

#{
  let module = tidy.parse-module(
    read("/src/lib.typ"),
    // label-prefix: "tgm-hit-protocol.",
    scope: scope,
  )
  tidy.show-module(
    module,
    sort-functions: none,
    style: tidy.styles.minimal,
  )
}
