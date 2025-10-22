#import "/src/lib.typ": *

#set text(lang: "en")

#show: assignment-class.with(
  title: [*Homework Title*],
  author: "Author Name",
  course-name: "Course Name",
)

#problem(title: [A Simple Exercise])[
  This is a simple exercise to demonstrate the assignment template.

  1. Solve the equations below.
  2. Explain the Pythagorean theorem and use it to find the length of the hypotenuse of a right-angled triangle with legs of lengths 3 and 4.
  3. Write a short paragraph using lorem ipsum text.
]

#solution(title: [Solving Quadratic Equations])[
  Solve the following equations:

  1. $x^2 + 2x + 1 = 0$
  2. $x^2 - 5x + 6 = 0$

  Hint: Try to factor the left-hand side.
][
  1. The equation $x^2 + 2x + 1 = 0$ can be factored as $(x + 1)(x + 1) = 0$. Therefore, the solution is $x = -1$.

  2. The equation $x^2 - 5x + 6 = 0$ can be factored as $(x - 2)(x - 3) = 0$. Therefore, the solutions are $x = 2$ and $x = 3$.
]

#solution(title: [Understanding the Pythagorean Theorem])[
  Explain the Pythagorean theorem.

  Then use it to find the length of the hypotenuse of a right-angled triangle with legs of lengths 3 and 4.
][
  The Pythagorean theorem states that in a right-angled triangle, the square of the length of the hypotenuse (the side opposite the right angle) is equal to the sum of the squares of the lengths of the other two sides. This can be expressed with the formula:
  $
    c^2 = a^2 + b^2,
  $
  where $c$ is the length of the hypotenuse, and $a$ and $b$ are the lengths of the other two sides.

  In our case, the lengths of the legs are 3 and 4. We can substitute these values into the formula:
  $
    c^2 = 3^2 + 4^2 = 9 + 16 = 25.
  $
  Taking the square root of both sides, we find:
  $
    c = sqrt(25) = 5.
  $
  Therefore, the length of the hypotenuse is $5$.
]

#solution(title: [Using Lorem Ipsum])[
  #lorem(20)
][
  #lorem(100)
]
