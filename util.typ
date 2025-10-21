// Math
#let varnothing = math.diameter

#let ee = $upright(e)$.body
#let ii = $upright(i)$.body
#let pm = $plus.minus$.body
#let mp = $minus.plus$.body

// Deprecated: use vb in physica instead
// #let ubold(x) = $upright(bold(#x))$

#let argmin = $op(arg min, limits: #true)$.body
#let argmax = $op(arg max, limits: #true)$.body

// Probability and Statistics
#let Var = $op("Var")$.body
#let Cov = $op("Cov")$.body
#let style-expected-value = it => {
  show math.EE: math.op(math.EE)
  it
}

// Deprecated: use pdv in physica instead
// #let deriv(f, x, order: none, marker: math.dif) = if order == none {
//   $(#marker #f) / (#marker #x)$
// } else {
//   $(#marker^#order #f) / (#marker #x^#order)$
// }
// #let pderiv = deriv.with(marker: math.partial)

// Deprecated: use eval in physica instead
// #let val(f, c) = $lr(#f|)_#c$

// Deprecated: use corresponding in physica instead
// #let braket(..args) = math.lr(math.angle.l + args.pos().join($,$) + math.angle.r)

// Algorithm
#let call(proc, ..args) = smallcaps(proc) + $($ + args.pos().join([, ]) + $)$

#let three-line-table(
  // columns: (),
  top-stroke: 1pt,
  middle-stroke: .5pt,
  bottom-stroke: 1pt,
  header-rowspan: 1,
  ..args
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
