// A table with three horizontal lines: at the top, between the header and body, and at the bottom.
#let three-line-table(
  // columns: (),
  top-stroke: 1pt,
  middle-stroke: .5pt,
  bottom-stroke: 1pt,
  header-rowspan: 1,
  ..args,
) = {
  let cells = args.pos()
  let attrs = args.named()

  // let num-columns = if cells.first().func() == table.header {
  //   1
  // } else if type(columns) == int {
  //   calc.max(1, columns)
  // } else if type(columns) == array {
  //   calc.max(1, columns.len())
  // } else {
  //   1
  // }

  // let head = cells.slice(0, num-columns)
  // let body = cells.slice(num-columns)

  table(
    stroke: none,
    align: center + horizon,
    ..attrs,
    table.hline(y: 0, stroke: top-stroke),
    table.hline(y: header-rowspan, stroke: middle-stroke),
    ..cells,
    table.hline(stroke: bottom-stroke),
  )
}
