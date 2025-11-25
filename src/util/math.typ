// Math utilities

#let varnothing = math.diameter

#let ee = $upright(e)$.body
#let ii = $upright(i)$.body

#let pm = $plus.minus$.body
#let mp = $minus.plus$.body

#let argmin = $op(arg min, limits: #true)$.body
#let argmax = $op(arg max, limits: #true)$.body

#let always-display-math = it => {
  show math.equation.where(block: false): math.display
  it
}

// Probability and Statistics

#let Var = $op("Var")$.body
#let Cov = $op("Cov")$.body

#let given = $mid(|)$.body

#let style-expected-value = it => {
  show math.EE: math.op(math.EE)
  it
}
