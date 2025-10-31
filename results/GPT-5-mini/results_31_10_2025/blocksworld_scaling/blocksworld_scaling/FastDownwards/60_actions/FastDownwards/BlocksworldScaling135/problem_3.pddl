(define (problem blocks-multiagent-problem)
  (:domain blocks-multi-agent)

  (:objects
    i a e m n b g d c j k f l h - block
  )

  (:init
    (vowel i)
    (vowel a)
    (vowel e)

    (consonant m) (consonant n) (consonant b) (consonant g) (consonant d)
    (consonant c) (consonant j) (consonant k) (consonant f) (consonant l) (consonant h)

    (on i table)
    (on n i)
    (on d n)
    (on a d)
    (on j a)
    (on k j)
    (on f k)
    (on h f)

    (on m table)
    (on b m)
    (on g b)
    (on c g)
    (on e c)
    (on l e)

    (clear h)
    (clear l)

    (clear table)
  )

  (:goal (and
    (on n table)
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
    (clear a)
  ))
)