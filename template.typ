// Asssignment mode: problems
#let problem-counter = counter("problem")

#let problem-begin() = {
  problem-counter.step()
  [== Problem #problem-counter.display() <problem-begin>]
}
#let problem-body = block.with(
  fill: rgb(245, 255, 245),
  width: 100%,
  inset: 8pt,
  radius: 4pt,
  stroke: rgb(128, 199, 128),
)
#let problem-end(meta: "") = [#metadata(meta) <problem-end>]

#let problem(meta: "", body) = {
  problem-begin()
  problem-body(body)
  problem-end(meta: meta)
}

// Report mode: sections
#let legacy-section-header = false

#let section-begin(title, ..args) = [#heading(title, ..args) <section-begin>]
#let section-end(meta: "") = [#metadata(meta) <section-end>]

#let section(meta: "", title, body, ..args) = {
  section-begin(title, ..args)
  body
  section-end(meta: meta)
}

#let assignment-class(
  title: "Title",
  author: "Author",
  course-name: "Course Name",
  mode: "assignment",
  body,
) = {
  set document(title: title, author: author)
  set page(
    paper: "a4",
    header: context {
      let (page-number,) = counter(page).get()
      if page-number > 1 {
        align(right, text(size: 10pt)[
          *#course-name: #title*
          #if mode == "assignment" {
            // Display current problem
            let marker = query(selector(<problem-end>).after(here()))
            if marker.len() > 0 {
              let marker-loc = marker.first().location()
              let (problem-number,) = problem-counter.at(marker-loc)
              [| *Problem #problem-number*]
            }
          } else if mode == "report" {
            // Display current section
            if legacy-section-header {
              let elems = query(heading.where(level: 1).before(here()))
              if elems.len() > 0 {
                let body = elems.last().body
                [| *#body*]
              }
            } else {
              let marker = query(selector(<section-end>).after(here()))
              if marker.len() > 0 {
                let marker-loc = marker.first().location()
                let section-elems = query(selector(<section-begin>).before(marker-loc))
                if section-elems.len() > 0 {
                  let section-title = section-elems.last().body
                  [| *#section-title*]
                }
              }
            }
          }
        ])
      }
    },
    footer: context {
      let (page-number,) = counter(page).get()
      let (total-pages,) = counter(page).final()
      align(center, text(size: 10pt,
        if text.lang == "zh" [
          第 #page-number 页，共 #total-pages 页
        ] else [
          Page #page-number of #total-pages
        ]
      ))
    },
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

  set par(justify: true, first-line-indent: 2em)
  // Workaround for first paragraph indent in CJK context
  show heading: it => {
    it
    v(10pt, weak: true)
    box()
    v(5pt, weak: true)
  }

  align(center, text(18pt)[#title])

  body
}
