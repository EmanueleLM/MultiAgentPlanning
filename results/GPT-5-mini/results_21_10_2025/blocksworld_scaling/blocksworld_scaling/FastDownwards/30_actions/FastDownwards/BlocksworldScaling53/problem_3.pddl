(define (problem BlocksworldScaling53-instance)
  (:domain blocks-multiagent)

  (:objects
    a b c d e f g h i j k l m n o - block
    table - place
  )

  (:init
    (on i table)
    (on c i)
    (on h c)

    (on n table)
    (on o n)
    (on l o)

    (on e table)
    (on f e)
    (on g f)
    (on b g)
    (on m b)

    (on d table)
    (on j d)
    (on k j)
    (on a k)

    (clear a)
    (clear l)
    (clear m)
    (clear h)

    (vowel a)
    (vowel e)
    (vowel i)
    (vowel o)

    (consonant b)
    (consonant c)
    (consonant d)
    (consonant f)
    (consonant g)
    (consonant h)
    (consonant j)
    (consonant k)
    (consonant l)
    (consonant m)
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
    (on n o)
    (on o table)
  ))
)