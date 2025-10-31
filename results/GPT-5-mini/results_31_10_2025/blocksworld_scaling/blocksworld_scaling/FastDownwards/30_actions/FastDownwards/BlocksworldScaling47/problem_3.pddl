(define (problem stacking-11blocks)
  (:domain blocks-multiagent)
  (:objects
    a b c d e f g h i j k - block
    table - support
  )

  (:init
    (vowel a) (vowel e) (vowel i)
    (consonant b) (consonant c) (consonant d) (consonant f)
    (consonant g) (consonant h) (consonant j) (consonant k)

    (on a g)
    (on g h)
    (on h table)

    (on b d)
    (on d f)
    (on f k)
    (on k table)

    (on i table)

    (on j e)
    (on e c)
    (on c table)

    (clear a)
    (clear b)
    (clear i)
    (clear j)
  )

  (:goal (and
    (on k table)
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