// Asssignment mode: problems
#let problem-numbering = (_, ..n) => [Problem #numbering("1", ..n)]

#let problem-container = block.with(
  fill: rgb(245, 255, 245),
  width: 100%,
  inset: 8pt,
  radius: 4pt,
  stroke: rgb(128, 199, 128),
)

#let problem(
  numbering: problem-numbering,
  container: problem-container,
  title: none,
  body,
) = [
  #heading(level: 2, numbering: numbering, title) <problem-begin>
  #container(body)
  #metadata((numbering: numbering, title: title)) <problem-end>
]

// Report mode: sections
#let section(title, body, ..args) = [
  #heading(title, ..args) <section-begin>
  #body
  #metadata((title: title)) <section-end>
]

#let assignment-class(
  title: "Title",
  author: "Author",
  course-name: "Course Name",
  mode: "assignment",
  header: auto,
  footer: auto,
  body,
) = {
  let wrap-default = (value, default) => {
    if value == auto { default } else { value }
  }

  set document(title: title, author: author)
  set page(
    paper: "a4",
    header: wrap-default(header, context {
      let (page-number,) = counter(page).get()
      if page-number > 1 {
        align(right, text(size: 10pt)[
          *#course-name: #title*
          #if mode == "assignment" {
            // Display current problem
            let marker = query(selector(<problem-end>).after(here()))
            if marker.len() > 0 {
              let marker-loc = marker.first().location()
              let meta = marker.first().value
              let problem-title = if meta.title != none {
                meta.title
              } else {
                numbering(meta.numbering, ..counter(heading).at(marker-loc))
              }
              [| *#problem-title*]
            }
          } else if mode == "report" {
            // Display current section
            let marker = query(selector(<section-end>).after(here()))
            if marker.len() > 0 {
              let meta = marker.first().value
              [| *#meta.title*]
            }
          }
        ])
      }
    }),
    footer: wrap-default(footer, context {
      let (page-number,) = counter(page).get()
      let (total-pages,) = counter(page).final()
      align(center, text(size: 10pt,
        if text.lang == "zh" [
          第 #page-number 页，共 #total-pages 页
        ] else [
          Page #page-number of #total-pages
        ]
      ))
    }),
  )

  // Font settings
  let en-font = "New Computer Modern"
  set text(size: 11pt, font: (en-font, "FZShuSong-Z01S"))
  show strong: set text(font: (en-font, "FZHei-B01S"))
  show emph: set text(font: (en-font, "FZKai-Z03S"))
  show heading: set text(font: (en-font, "FZXiaoBiaoSong-B05S"))

  // Headings
  set heading(numbering: (..nums) => {
    let (first, ..more) = nums.pos()
    if more.len() == 0 {
      return numbering("一 ", first)
    } else {
      return numbering("1.", ..more)
    }
  }) if mode == "report"

  context {
    let indent = if text.lang == "zh" { 2em } else { 1em }
    set par(justify: true, first-line-indent: indent)
    set enum(indent: indent)
    set list(indent: indent)
    set terms(indent: indent, hanging-indent: -indent)
    // Workaround for first paragraph indent in CJK context
    show heading: it => {
      it
      if text.lang == "zh" {
        v(10pt, weak: true)
        box()
        v(5pt, weak: true)
      }
    }

    align(center, text(18pt)[#title])

    body
  }
}
