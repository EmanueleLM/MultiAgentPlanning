(define (problem combined-blockstack)
  (:domain combined-vowel-consonant)

  (:objects
    a b c d e f g h i j k l - block
  )

  (:init
    (vowel a) (vowel e) (vowel i)
    (consonant b) (consonant c) (consonant d) (consonant f) (consonant g) (consonant h) (consonant j) (consonant k) (consonant l)

    (ontable h)
    (on b h)
    (on c b)
    (on e c)
    (on f e)
    (clear f)

    (ontable l)
    (on j l)
    (on i j)
    (clear i)

    (ontable k)
    (on d k)
    (on g d)
    (clear g)

    (ontable a)
    (clear a)

    (handempty-v)
    (handempty-c)
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