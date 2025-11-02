(define (problem BlocksworldScaling141-problem)
  (:domain BlocksworldScaling141)

  (:objects
    a e i - vowel
    j l m c d k b f h g - consonant
  )

  (:init
    (on m j)
    (on c m)
    (on k c)
    (on f k)
    (on i f)

    (on d l)
    (on h d)

    (on b e)
    (on a b)
    (on g a)

    (ontable j)
    (ontable l)
    (ontable e)

    (clear i)
    (clear h)
    (clear g)
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
    (ontable m)
  ))
)