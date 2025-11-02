(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)

  (:objects
    a e i - vowel
    b c d f g h j k l m n - consonant
  )

  (:init
    (ontable b)
    (on f b)
    (on k f)

    (ontable c)
    (on a c)
    (on l a)
    (on j l)
    (on e j)
    (on h e)
    (on i h)

    (ontable m)
    (on n m)
    (on g n)
    (on d g)

    (clear k)
    (clear i)
    (clear d)
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
    (clear a)
  ))
)