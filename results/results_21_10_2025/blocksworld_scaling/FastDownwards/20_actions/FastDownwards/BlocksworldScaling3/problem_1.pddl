(define (problem BlocksworldScaling3-problem)
  (:domain BlocksworldScaling3)

  (:objects
    a b c d e f g h i j k l m n - block
    table - table
  )

  (:init
    ;; H-stack (bottom to top): h, k, d, g, a
    (on a g)
    (on g d)
    (on d k)
    (on k h)
    (on h table)

    ;; I-stack (bottom to top): i, c, b, j, n, e
    (on c i)
    (on b c)
    (on j b)
    (on n j)
    (on e n)
    (on i table)

    ;; L-stack (bottom to top): l, m, f
    (on m l)
    (on f m)
    (on l table)

    ;; Clear (tops of stacks)
    (clear a)
    (clear e)
    (clear f)

    ;; Ownership by agent constraints
    (vowel a)
    (vowel e)
    (vowel i)

    (consonant h)
    (consonant k)
    (consonant l)
    (consonant d)
    (consonant g)
    (consonant m)
    (consonant c)
    (consonant b)
    (consonant j)
    (consonant f)
    (consonant n)
  )

  (:goal (and
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
    (on l m)
    (on m n)
    (on n table)
  ))
)