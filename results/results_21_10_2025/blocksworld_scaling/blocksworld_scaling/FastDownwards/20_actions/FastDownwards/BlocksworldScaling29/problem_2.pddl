(define (problem vc-stacking-problem)
  (:domain vc-stacking-domain)
  (:objects
    a b c d e f g h i j k l - block
    table - place
  )

  (:init
    (vowel a)
    (vowel e)
    (vowel i)

    (consonant b)
    (consonant c)
    (consonant d)
    (consonant f)
    (consonant g)
    (consonant h)
    (consonant j)
    (consonant k)
    (consonant l)

    (on a table)
    (ontable a)
    (on f a)
    (on l f)
    (on c l)
    (on j c)
    (on g j)
    (on b g)

    (on d table)
    (ontable d)
    (on e d)
    (on i e)
    (on k i)
    (on h k)

    (clear b)
    (clear h)
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
    (ontable l)
  ))
)