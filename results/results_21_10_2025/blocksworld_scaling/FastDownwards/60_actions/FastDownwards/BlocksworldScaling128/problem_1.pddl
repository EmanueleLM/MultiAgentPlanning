(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)

  (:objects
    b e l a n g j m c k f d h i - block
  )

  (:init
    ; types
    (vowel a)
    (vowel e)
    (vowel i)

    (consonant b)
    (consonant l)
    (consonant n)
    (consonant g)
    (consonant j)
    (consonant m)
    (consonant c)
    (consonant k)
    (consonant f)
    (consonant d)
    (consonant h)

    ; initial stacks: Stack1 bottom->top = b, e, n, g, m, k, f, i
    (ontable b)
    (on e b)
    (on n e)
    (on g n)
    (on m g)
    (on k m)
    (on f k)
    (on i f)

    ; Stack2 bottom->top = l, a, j, c, d, h
    (ontable l)
    (on a l)
    (on j a)
    (on c j)
    (on d c)
    (on h d)

    ; initial clear (top) facts
    (clear i)
    (clear h)
  )

  (:goal (and
    (ontable n)
    (on m n)
    (on l m)
    (on k l)
    (on j k)
    (on i j)
    (on h i)
    (on g h)
    (on f g)
    (on e f)
    (on d e)
    (on c d)
    (on b c)
    (on a b)
  ))
)