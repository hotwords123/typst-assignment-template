// Math utilities

#let varnothing = math.diameter

#let ee = $upright(e)$.body
#let ii = $upright(i)$.body

#let pm = $plus.minus$.body
#let mp = $minus.plus$.body

#let argmin = $op(arg min, limits: #true)$.body
#let argmax = $op(arg max, limits: #true)$.body

// Probability and Statistics

#let Var = $op("Var")$.body
#let Cov = $op("Cov")$.body
#let style-expected-value = it => {
  show math.EE: math.op(math.EE)
  it
}
