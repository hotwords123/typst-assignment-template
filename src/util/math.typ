// Math utilities

#let ee = $upright(e)$.body
#let ii = $upright(i)$.body

#let pm = $plus.minus$.body
#let mp = $minus.plus$.body

#let argmin = $op(arg min, limits: #true)$.body
#let argmax = $op(arg max, limits: #true)$.body

// https://typst-doc-cn.github.io/guide/FAQ/math-inline-display.html
#let always-display-math(it) = {
  show math.equation.where(block: false): math.display
  it
}

// https://typst-doc-cn.github.io/guide/FAQ/emptyset.html
#let use-varnothing(it) = {
  show math.equation: set text(features: ("cv01",))
  it
}

// https://github.com/typst/typst/issues/1028
#let fix-inline-math-bounds(it) = {
  show math.equation.where(block: false): set text(top-edge: "bounds", bottom-edge: "bounds")
  it
}

// Probability and Statistics

#let Var = $op("Var")$.body
#let Cov = $op("Cov")$.body

#let given = $mid(|)$.body

#let style-expected-value(it) = {
  show math.EE: math.op(math.EE)
  it
}
