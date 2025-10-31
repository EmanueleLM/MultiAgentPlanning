(define (problem rearrange-blocks)
  (:domain blocksworld-agents)
  (:objects
    a e i - vowel
    h k d l g f b c j - consonant
  )

  (:init
    ;; Initial stacks given in the specification:
    ;; Stack 1 (bottom -> top): h, k, g, i, b, c
    (on k h)
    (on g k)
    (on i g)
    (on b i)
    (on c b)
    (ontable h)

    ;; Stack 2 (bottom -> top): d, l, e, f, a, j
    (on l d)
    (on e l)
    (on f e)
    (on a f)
    (on j a)
    (ontable d)

    ;; Only the tops are clear initially: c and j
    (clear c)
    (clear j)

    ;; Hand is empty initially
    (handempty)
  )

  (:goal (and
    ;; Goal single tower with l on table and the specified order above it:
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f g)
    (on g h)
    (on h i)
    (on i j)
    (on j k)
    (on k l)
    (ontable l)
  ))
)