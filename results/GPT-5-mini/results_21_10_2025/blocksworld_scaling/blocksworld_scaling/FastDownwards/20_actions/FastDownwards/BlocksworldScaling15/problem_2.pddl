(define (problem build-l-with-a-on-top)
  (:domain multiagent-blocks)
  (:objects
    a e i - vowel
    b c d f g h j k l - consonant
  )
  (:init
    (on f e)
    (on j f)
    (on g j)
    (on a g)

    (on b k)

    (on c i)
    (on l c)
    (on h l)

    (ontable e)
    (ontable d)
    (ontable k)
    (ontable i)

    (clear a)
    (clear d)
    (clear b)
    (clear h)
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