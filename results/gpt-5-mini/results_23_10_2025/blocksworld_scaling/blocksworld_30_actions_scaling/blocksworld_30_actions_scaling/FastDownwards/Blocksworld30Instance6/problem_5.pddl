(define (problem blocks-final-arrangement)
  (:domain blocks-world)
  (:objects a b c d e f g h i j - block)

  (:init
    (ontable a)
    (on i a)
    (on c i)
    (on j c)
    (on d j)
    (on g d)

    (ontable b)
    (on f b)
    (on e f)
    (on h e)

    (clear g)
    (clear h)

    (handempty)
  )

  (:goal (and
    (ontable a)
    (on i a)
    (on c i)
    (on j c)
    (on d j)
    (on g d)
    (ontable b)
    (on f b)
    (on e f)
    (on h e)
    (handempty)
  ))
)