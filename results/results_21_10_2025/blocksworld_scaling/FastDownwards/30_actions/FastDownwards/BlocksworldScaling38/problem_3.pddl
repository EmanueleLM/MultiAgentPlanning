(define (problem blocksworld-multiagent-problem)
  (:domain blocksworld-multiagent)

  (:objects
    a e i - vowel
    b c d f g h j k l - consonant
  )

  (:init
    (ontable b)
    (on i b)
    (on c i)
    (on d c)
    (on g d)
    (on j g)
    (on l j)
    (ontable e)
    (on h e)
    (on a h)
    (ontable k)
    (on f k)
    (clear l)
    (clear a)
    (clear f)
  )

  (:goal (and
    (ontable l)
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