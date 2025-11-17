#import "/src/lib.typ": *
#import util: cont-eq
#import "@preview/itemize:0.2.0" as el

#set text(lang: "zh")

#show: assignment-class.with(
  title: [作业标题],
  author: "作者姓名",
  course-name: "课程名称",
)

#show: el.default-enum-list

#problem(title: [一个简单的练习])[
  这是一个简单的练习，用来演示作业模板。

  1. 解答下列方程。
  2. 解释毕达哥拉斯定理，并用它求一条直角三角形的斜边长度，已知两条直角边长分别为 3 与 4。
  3. 用 Lorem Ipsum 文本写一小段短文。
]

#solution(title: [解一元二次方程])[
  解下列方程：

  1. $x^2 + 2x + 1 = 0$
  2. $x^2 - 5x + 6 = 0$

  提示：尝试对左侧进行因式分解。
][
  1. 方程 $x^2 + 2x + 1 = 0$ 可分解为 $(x + 1)(x + 1) = 0$，因此解为 $x = -1$。

  2. 方程 $x^2 - 5x + 6 = 0$ 可分解为 $(x - 2)(x - 3) = 0$，因此解为 $x = 2$ 和 $x = 3$。
]

#solution(title: [理解毕达哥拉斯定理])[
  解释毕达哥拉斯定理。

  然后用它来求一条直角三角形的斜边长度（直角边分别为 3 和 4）。
][
  毕达哥拉斯定理指出：在直角三角形中，斜边（与直角相对的那一边）长度的平方等于另外两条直角边长度的平方和。用公式表示为：
  $
    c^2 = a^2 + b^2,
  $
  #cont-eq 其中 $c$ 为斜边长度，$a$ 和 $b$ 为另外两条直角边的长度。

  在本例中，两条直角边的长度分别为 3 和 4。代入公式得：
  $
    c^2 = 3^2 + 4^2 = 9 + 16 = 25.
  $
  #cont-eq 两边同时开平方得：
  $
    c = sqrt(25) = 5.
  $
  #cont-eq 因此，斜边的长度为 $5$。
]

#solution(title: [使用 Lorem Ipsum])[
  #lorem(20)
][
  #lorem(100)
]
